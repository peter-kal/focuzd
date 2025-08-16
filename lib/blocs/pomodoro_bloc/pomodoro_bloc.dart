import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:desktop_notifications/desktop_notifications.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import 'package:focuzd/blocs/pomodoro_bloc/ticker.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:focuzd/data/repo.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';
part 'pomodoro_event.dart';
part 'pomodoro_state.dart';

class PomodoroBloc extends Bloc<PomodoroTimerEvent, PomodoroTimerState> {
  PomodoroBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(
          1,
          1,
          1,
        )) {
    on<RoundPlan>(_onRoundPlan);
    on<ChangePlan>(_onChangePlan);
    on<StartRound>(_onStart);
    on<TimerInit>(_onTimerInit);
    on<_TimerTicked>(_onTicked);
    on<TimerPaused>(_onPause);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<NextPomodoroTimer>(_onNextPomodoro);
    on<WindowIsClosing>(_onWindowIsClosing);
    on<SetTimeInnit>((event, emit) async {
      // This event is not used in the current implementation
      // but can be used to set initial time if needed.
      final stored = await settingsRepo.fetchSettingsById(1);
      final focusTimeDuration = stored!.selectedFocusDurationStored * 60;
      final reqRounds = stored.requestedNumberOfSessions;
      emit(TimerInitial(1, focusTimeDuration, reqRounds));
    });
  }
  Timer? _planningRefreshTimer;
  // This timer is used to refresh the planning time in the RoundPlanning state.
  final Ticker _ticker;
  final settingsRepo = SettingsRepository(AppDatabase.instance);
  final memorySessionRepo = MemorySessionRepository(AppDatabase.instance);
  final subjectRepo = SubjectRepository(AppDatabase.instance);
  final roundRepo = RoundRepository(AppDatabase.instance);
  dynamic client;
  StreamSubscription<int>? _tickerSubscription;
  @override
  Future<void> close() {
    _planningRefreshTimer?.cancel();
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _startPlanningRefresh() {
    _planningRefreshTimer?.cancel();
    _planningRefreshTimer =
        Timer.periodic(const Duration(seconds: 3), (_) => add(ChangePlan(4)));
  }

  void _cancelPlanningRefresh() {
    _planningRefreshTimer?.cancel();
    _planningRefreshTimer = null;
  }

  void _onTimerInit(TimerInit event, Emitter<PomodoroTimerState> emit) async {
    // done for now 17:25 17/05
    final stored = await settingsRepo.fetchSettingsById(1);
    final focusTimeDuration = stored!.selectedFocusDurationStored * 60;
    final reqRounds = stored.requestedNumberOfSessions;
    _cancelPlanningRefresh();
    emit(TimerInitial(1, focusTimeDuration, reqRounds));
  }

  void _onRoundPlan(RoundPlan event, Emitter<PomodoroTimerState> emit) async {
    final stored = await settingsRepo.fetchSettingsById(1);
    final subjects = await subjectRepo.fetchAllSubjects();
    final focusTimeDuration = stored!.selectedFocusDurationStored;
    final breakDuration = stored.selectedBreakDurationStored;
    final longBreakDuration = stored.selectedLongBreakDurationStored;
    final sessionsPerRound = stored.requestedNumberOfSessions;
    List<SessionVariablePlanning> planlist = ExtraFunctions().getList(
        sessionsPerRound, longBreakDuration, breakDuration, focusTimeDuration);

    var now = DateTime.now().toLocal();
    var nowperthen = DateTime.now().toLocal();
    for (int i = 0; i < planlist.length; i++) {
      nowperthen =
          nowperthen.add(Duration(seconds: planlist[i].plannedDuration));
      planlist[i].expFinishTime = nowperthen;
    }

    emit(RoundPlanning(
        sessionsPerRound,
        breakDuration,
        focusTimeDuration,
        longBreakDuration,
        subjects,
        planlist,
        nowperthen,
        (nowperthen.difference(now).inSeconds)));
    _startPlanningRefresh();
  }

  void _onChangePlan(ChangePlan event, Emitter<PomodoroTimerState> emit) async {
    final stored = await settingsRepo.fetchSettingsById(1);
    final subjects = await subjectRepo.fetchAllSubjects();
    final focusTimeDuration = stored!.selectedFocusDurationStored;
    final breakDuration = stored.selectedBreakDurationStored;
    final longBreakDuration = stored.selectedLongBreakDurationStored;
    final sessionsperRound = stored.requestedNumberOfSessions;
    final state = this.state;
    int durationOfRound = 0;
    DateTime nowPerThen = DateTime.now();
    List<SessionVariablePlanning> newlist = [];
    if (state is RoundPlanning) {
      newlist = state.planlist;

      if (event.actionCode == 1) {
        // add a session
        var newlist = state.planlist;
        newlist.add(SessionVariablePlanning('focus', focusTimeDuration * 60, null,
            expFinishTime: null));
        ((newlist.length + 1) % 8) == 0
            ? newlist.add(SessionVariablePlanning(
                "longbreak", longBreakDuration * 60, null, expFinishTime: null))
            : newlist.add(SessionVariablePlanning(
                "break", breakDuration * 60, null,
                expFinishTime: null));
      } else if (event.actionCode == 2) {
        newlist[event.position!].subject = event.subject;
        // change subject
      } else if (event.actionCode == 3) {
        int pos = event.position!;
        newlist.removeAt(pos);
        newlist.removeAt(pos++);
        // delete
      } else if (event.actionCode == 4) {
        //just for refreshing time
      } else if (event.actionCode == 5) {
        // change duration
        newlist[event.position!].plannedDuration = event.newduration!;
      }

      DateTime now = DateTime.now();
      nowPerThen = DateTime.now();
      for (int i = 0; i < newlist.length; i++) {
        nowPerThen =
            nowPerThen.add(Duration(seconds: newlist[i].plannedDuration));
        newlist[i].expFinishTime = nowPerThen;
      }
      Duration x = nowPerThen.difference(now);
      durationOfRound = x.inSeconds;
    }

    emit(RoundPlanning(sessionsperRound, breakDuration, focusTimeDuration,
        longBreakDuration, subjects, newlist, nowPerThen, durationOfRound));
  }

  void _onStart(StartRound event, Emitter<PomodoroTimerState> emit) async {
    final state = this.state;
    _cancelPlanningRefresh();
    if (state is RoundPlanning) {
      await roundRepo.insertRound(RoundVariableCompanion(
        // should change the way time is handled in round plannning but later on
        plannedDuration: Value(state.roundDuration),
        startingTime: Value(DateTime.now()),
        expFinishTime: Value(state.expFinishRoundTime),
      ));
      var roundid = await roundRepo.getCurrentRound();

      for (int i = 0; i < state.planlist.length; i++) {
        bool isFocus = ((i + 1) % 2) != 0;
        bool islongBreak = ((i + 1) % 8) == 0;
        String type;
        if (isFocus == false && islongBreak == false) {
          type = "break";
        } else if (isFocus == true) {
          type = "focus";
        } else if (islongBreak == true) {
          type = "longBreak";
        } else {
          type = "e";
        }
        dynamic idSub;
        if (state.planlist[i].subject == null) {
          idSub = null;
        } else if (state.planlist[i].subject != null) {
          idSub = state.planlist[i].subject!.id;
        }
        await memorySessionRepo
            .insertMemorySession(MemoryCountdownVariableCompanion(
                type: Value(type),
                roundGoal: Value(state.planlist.length ~/ 2),
                roundId: Value(roundid!.id),
                roundRunTime: Value(i),
                plannedDuration: Value(state.planlist[i].plannedDuration),
                subject: Value(idSub),
                expStartingTime: Value(
                  state.planlist[i].expFinishTime!.subtract(
                      Duration(seconds: state.planlist[i].plannedDuration)),
                )));
      }
      var memoryid = await memorySessionRepo.getTheNextClosest();
      await memorySessionRepo.updateMemorySessionWrite(memoryid!.id,
          MemoryCountdownVariableCompanion(startingTime: Value(DateTime.now())));

      emit(TimerRunInProgress(
          state.planlist.first.plannedDuration,
          0,
          1,
          state.planlist.first.plannedDuration,
          memoryid!.id,
          state.planlist.length ~/ 2,
          roundid!.id,
          state.planlist,
          state.planlist.first.type,
          roundid.plannedDuration,
          0,
          state.expFinishRoundTime,
          state.planlist.first.subject));
      _tickerSubscription?.cancel();
      if (Platform.isLinux) {
        client = NotificationsClient();
        await client.notify(
            "Focus for the next ${(state.planlist.first.plannedDuration / 60).round()} minutes!");
      }
      _tickerSubscription = _ticker
          .tick(ticks: state.planlist.first.plannedDuration)
          .listen((duration) => add(_TimerTicked(duration: duration)));
    }
  }

  void _onTicked(_TimerTicked event, Emitter<PomodoroTimerState> emit) async {
    // to be taken care of later on
    final state = this.state;
    if (state is TimerRunInProgress) {
      if (event.duration > 0) {
        emit(TimerRunInProgress(
            event.duration,
            state.runTimes,
            state.showTime,
            state.selectedDuration,
            state.currentMemorySessionID,
            state.defaultSessionsPerRound,
            state.currentRoundID,
            state.sessions,
            state.type,
            state.roundDuration,
            state.actualRoundDuration,
            state.endOfRound,
            state.subject));
      } else {
        emit(TimerRunInProgress(
            event.duration,
            state.runTimes,
            state.showTime,
            state.selectedDuration,
            state.currentMemorySessionID,
            state.defaultSessionsPerRound,
            state.currentRoundID,
            state.sessions,
            state.type,
            state.roundDuration,
            state.actualRoundDuration,
            state.endOfRound,
            state.subject));
        add(const NextPomodoroTimer());
      }
    }
  }

  void _onPause(TimerPaused event, Emitter<PomodoroTimerState> emit) {
    final state = this.state;
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(
          state.defaultSessionsPerRound,
          state.runTimes,
          state.showTime,
          state.duration,
          state.selectedDuration,
          state.currentMemorySessionID,
          state.currentRoundID,
          state.sessions,
          state.type,
          state.roundDuration,
          state.actualRoundDuration,
          state.endOfRound,
          state.subject));
    }
  }

  void _onResumed(TimerResumed resume, Emitter<PomodoroTimerState> emit) {
    final state = this.state;
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(
          state.duration,
          state.runTimes,
          state.showTime,
          state.selectedDuration,
          state.currentMemorySessionID,
          state.defaultSessionsPerRound,
          state.currentRoundID,
          state.sessions,
          state.type,
          state.roundDuration,
          state.actualRoundDuration,
          state.endOfRound,
          state.subject));
    }
  }

  void _onReset(TimerReset event, Emitter<PomodoroTimerState> emit) async {
    // Foundamentally wrong, it only emits TimerInitial, while it should just reload the session in TimerRunInProgress
    _tickerSubscription?.cancel();

    final stored = await settingsRepo.fetchSettingsById(1);

    final focusTimeDuration = stored!.selectedFocusDurationStored * 60;
    final now = DateTime.now();
    final startTime = await memorySessionRepo.getCurrentSession();

    final state = this.state;
    if (state is TimerRunInProgress) {
      if (startTime != null) {
        memorySessionRepo.updateMemorySessionWrite(
            state.currentMemorySessionID,
            MemoryCountdownVariableCompanion(
                id: Value(state.currentMemorySessionID),
                finishTime: Value(now),
                durationLeft: Value(state.duration),
                actuallyDoneDuration:
                    Value(now.difference(startTime.startingTime!).inSeconds)));
      }
      emit(TimerInitial(
          state.runTimes, focusTimeDuration, state.defaultSessionsPerRound));
    } else if (state is TimerInitial) {
      add(TimerInit());
    } else if (state is TimerRunPause) {
      if (startTime != null) {
        memorySessionRepo.updateMemorySessionWrite(
            state.currentMemorySessionID,
            MemoryCountdownVariableCompanion(
                id: Value(state.currentMemorySessionID),
                finishTime: Value(now),
                durationLeft: Value(state.duration),
                actuallyDoneDuration:
                    Value(now.difference(startTime.startingTime!).inSeconds)));
        emit(TimerInitial(
            state.runTimes, focusTimeDuration, state.defaultSessionsPerRound));
      }
    }
  }

  Future<void> _onNextPomodoro(
      NextPomodoroTimer event, Emitter<PomodoroTimerState> emit) async {
    _tickerSubscription?.cancel();
    final now = DateTime.now();
    final state = this.state;
    if (state is TimerRunInProgress) {
      if ((state.runTimes + 1) >= state.sessions.length) {
        // TASK: End the round

        await memorySessionRepo.updateMemorySessionWrite(
            state.currentMemorySessionID,
            MemoryCountdownVariableCompanion(
              durationLeft: Value(state.duration),
              finishTime: Value(now),
              actuallyDoneDuration: Value(
                state.selectedDuration - state.duration,
              ),
              completed: Value(state.duration == 0
                  ? true
                  : false), // what if it's skipped, is it considered completed? Actually done duration is not added tho it should
              // completed is when all planned duration is done, finished is the way to tell
            ));
        var roundid = await roundRepo.getCurrentRound();
        int? actuallydoneduration = roundid!.actuallyDoneDuration;
        await roundRepo.updateRoundWrite(
            state.currentRoundID,
            RoundVariableCompanion(
              actuallyDoneDuration: Value(actuallydoneduration != null
                  ? actuallydoneduration +
                      (state.selectedDuration - state.duration)
                  : (state.selectedDuration - state.duration)),
              completed: Value(true),
              finishTime: Value(now),
            ));
        if (state.subject != null) {
          var sub = await subjectRepo.fetchSubjectByID(state.subject!.id);
          int? totalTimeSpent = sub?.totalTimeSpent;
          await subjectRepo.editSubjectWrite(
            state.subject!.id,
            SubjectCompanion(
              updatedAt: Value(now),
              lastFocuzdOnSessionID: Value(state.currentMemorySessionID),
              totalTimeSpent: Value(totalTimeSpent != null
                  ? totalTimeSpent + (state.selectedDuration - state.duration)
                  : (state.selectedDuration - state.duration)),
            ),
          );
        }
        add(TimerInit());
      } else if ((state.runTimes + 1) < state.sessions.length) {
        int actuallyDoneSession = state.selectedDuration - state.duration;
        var roundid = await roundRepo.getCurrentRound();
        int? actuallyDoneRound = roundid!.actuallyDoneDuration;
        if (state.subject != null) {
          var sub = await subjectRepo.fetchSubjectByID(state.subject!.id);
          int? totalTimeSpent = sub?.totalTimeSpent;
          await subjectRepo.editSubjectWrite(
            state.subject!.id,
            SubjectCompanion(
              updatedAt: Value(now),
              lastFocuzdOnSessionID: Value(state.currentMemorySessionID),
              totalTimeSpent: Value(totalTimeSpent != null
                  ? totalTimeSpent + actuallyDoneSession
                  : actuallyDoneSession),
            ),
          );
        }
        await memorySessionRepo.updateMemorySessionWrite(
            state.currentMemorySessionID,
            MemoryCountdownVariableCompanion(
              durationLeft: Value(state.duration),
              finishTime: Value(now),
              completed: Value(state.duration == 0 ? true : false),
              actuallyDoneDuration: Value(actuallyDoneSession),
              propableCause: Value(event.nextCode == 1 ? "skipped" : null),
            ));
        var sessionathand = await memorySessionRepo.getTheNextClosest();
        await roundRepo.updateRoundWrite(
            state.currentRoundID,
            RoundVariableCompanion(
              actuallyDoneDuration: Value(actuallyDoneRound != null
                  ? actuallyDoneRound +
                      (state.selectedDuration - state.duration)
                  : (state.selectedDuration - state.duration)),
            ));
        await memorySessionRepo.updateMemorySessionWrite(
            state.currentMemorySessionID + 1,
            MemoryCountdownVariableCompanion(
              startingTime: Value(now),
            ));
        emit(TimerRunInProgress(
            state.sessions[state.runTimes + 1].plannedDuration,
            state.runTimes + 1,
            (state.runTimes + 1) % 2 == 0 ? state.showTime + 1 : state.showTime,
            state.sessions[state.runTimes + 1].plannedDuration,
            state.currentMemorySessionID + 1,
            state
                .defaultSessionsPerRound, // how many sessions are there in the round, name change needed
            state.currentRoundID,
            state.sessions,
            state.sessions[state.runTimes + 1].type,
            state.roundDuration,
            state.actualRoundDuration +
                (state.selectedDuration - state.duration),
            event.nextCode == 1
                ? state.endOfRound.subtract(Duration(seconds: state.duration))
                : state.endOfRound,
            state.sessions[state.runTimes + 1].subject));

        _tickerSubscription = _ticker
            .tick(ticks: state.sessions[state.runTimes + 1].plannedDuration)
            .listen((duration) => add(_TimerTicked(duration: duration)));

        if (Platform.isLinux) {
          client = NotificationsClient();

          if (state.sessions[state.runTimes + 1].type == 'break' ||
              state.sessions[state.runTimes + 1].type == 'longbreak') {
            await client.notify(
                "Take a break for the next ${(state.sessions[state.runTimes + 1].plannedDuration / 60).round()} minutes!");
          } else if (state.sessions[state.runTimes + 1].type == 'focus') {
            await client.notify(
                "Focus for the next ${(state.sessions[state.runTimes + 1].plannedDuration / 60).round()} minutes!");
          }
        }
      }
    }
  }

  void _onWindowIsClosing(
      WindowIsClosing event, Emitter<PomodoroTimerState> emit) async {
    final state = this.state;
    final now = DateTime.now();
    final currentSession = await memorySessionRepo.getCurrentSession();
    if (state is TimerRunInProgress) {
      if (currentSession != null) {
        await memorySessionRepo.updateMemorySessionWrite(
          currentSession.id,
          MemoryCountdownVariableCompanion(
            finishTime: Value(now),
            durationLeft: Value(state.duration),
            actuallyDoneDuration: Value(
              now.difference(currentSession.startingTime!).inSeconds,
            ),
          ),
        );
      } else {
        print("null");
      }
    } else if (state is TimerRunPause) {
      if (currentSession != null) {
        await memorySessionRepo.updateMemorySessionWrite(
          currentSession.id,
          MemoryCountdownVariableCompanion(
            finishTime: Value(now),
            durationLeft: Value(state.duration),
            actuallyDoneDuration: Value(
              now.difference(currentSession.startingTime!).inSeconds,
            ),
          ),
        );
      }
    }
  }
}
