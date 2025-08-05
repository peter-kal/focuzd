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
  }

  int timesRun = 1;
  final Ticker _ticker;
  final settingsRepo = SettingsRepository(AppDatabase.instance);
  final memorySessionRepo = MemorySessionRepository(AppDatabase.instance);
  final subjectRepo = SubjectRepository(AppDatabase.instance);
  final roundRepo = RoundRepository(AppDatabase.instance);
  var client;
  StreamSubscription<int>? _tickerSubscription;
  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onTimerInit(TimerInit event, Emitter<PomodoroTimerState> emit) async {
    // done for now 17:25 17/05
    final stored = await settingsRepo.fetchSettingsById(1);
    final workTimeDuration = stored!.selectedWorkDurationStored * 60;
    final reqRounds = stored.requestedNumberOfSessions;
    emit(TimerInitial(1, workTimeDuration, reqRounds));
  }

  void _onRoundPlan(RoundPlan event, Emitter<PomodoroTimerState> emit) async {
    final stored = await settingsRepo.fetchSettingsById(1);
    final subjects = await subjectRepo.fetchAllSubjects();
    final workTimeDuration = stored!.selectedWorkDurationStored;
    final breakDuration = stored.selectedBreakDurationStored;
    final LongBreakDuration = stored.selectedLongBreakDurationStored;
    final SessionsperRound = stored.requestedNumberOfSessions;
    List<SessionVariablePlanning> planlist = ExtraFunctions().getList(
        SessionsperRound, LongBreakDuration, breakDuration, workTimeDuration);

    var now = DateTime.now().toLocal();
    var nowperthen = DateTime.now().toLocal();
    for (int i = 0; i < planlist.length; i++) {
      nowperthen =
          nowperthen.add(Duration(seconds: planlist[i].plannedDuration));
      planlist[i].expFinishTime = nowperthen;
    }

    emit(RoundPlanning(
        SessionsperRound,
        breakDuration,
        workTimeDuration,
        LongBreakDuration,
        subjects,
        planlist,
        nowperthen,
        (nowperthen.difference(now).inSeconds)));
  }

  void _onChangePlan(ChangePlan event, Emitter<PomodoroTimerState> emit) async {
    final stored = await settingsRepo.fetchSettingsById(1);
    final subjects = await subjectRepo.fetchAllSubjects();
    final workTimeDuration = stored!.selectedWorkDurationStored;
    final breakDuration = stored.selectedBreakDurationStored;
    final longBreakDuration = stored.selectedLongBreakDurationStored;
    final sessionsperRound = stored.requestedNumberOfSessions;
    final state = this.state;
    var newlist;
    var nowperthen;
    var now;
    var durationOfRound;
    if (state is RoundPlanning) {
      newlist = state.planlist;
      for (int i = 0; i < newlist.length; i++) {
        print(newlist[i].plannedDuration);
      }
      if (event.actionCode == 1) {
        // add a session
        var newlist = state.planlist;
        newlist.add(SessionVariablePlanning('work', workTimeDuration * 60, null,
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
        await newlist.removeAt(pos);
        await newlist.removeAt(pos++);
        // delete
      }
      for (int i = 0; i < newlist.length; i++) {
        print(newlist[i].plannedDuration);
      }
      now = DateTime.now().toLocal();
      nowperthen = DateTime.now().toLocal();
      for (int i = 0; i < newlist.length; i++) {
        nowperthen =
            nowperthen.add(Duration(seconds: newlist[i].plannedDuration));
        newlist[i].expFinishTime = nowperthen;
      }
      Duration x = nowperthen.difference(now);
      durationOfRound = x.inSeconds;
    }
    emit(TimerInitial(0, 0, 0));
    emit(RoundPlanning(sessionsperRound, breakDuration, workTimeDuration,
        longBreakDuration, subjects, newlist, nowperthen, durationOfRound));
  }

  void _onStart(StartRound event, Emitter<PomodoroTimerState> emit) async {
    final state = this.state;

    if (state is RoundPlanning) {
      await roundRepo.insertRound(RoundVariableCompanion(
        // should change the way time is handled in round plannning but later on
        plannedDuration: Value(state.roundDuration),
        startingTime: Value(DateTime.now()),
        expFinishTime: Value(state.expFinishRoundTime),
      ));
      var roundid = await roundRepo.getCurrentRound();

      for (int i = 0; i < state.planlist.length; i++) {
        bool isWork = ((i + 1) % 2) != 0;
        bool islongBreak = ((i + 1) % 8) == 0;
        String type;
        if (isWork == false && islongBreak == false) {
          type = "break";
        } else if (isWork == true) {
          type = "work";
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
            .insertMemorySession(MemorySessionVariableCompanion(
                type: Value(type),
                roundGoal: Value(state.planlist.length ~/ 2),
                roundId: Value(roundid!.id),
                runTime: Value(i),
                plannedDuration: Value(state.planlist[i].plannedDuration),
                subject: Value(idSub),
                expStartingTime: Value(
                  state.planlist[i].expFinishTime!.subtract(
                      Duration(seconds: state.planlist[i].plannedDuration)),
                )));
      }
      var memoryid = await memorySessionRepo.getTheNextClosest();
      await memorySessionRepo.updateMemorySessionWrite(memoryid!.id,
          MemorySessionVariableCompanion(startingTime: Value(DateTime.now())));
      emit(TimerRunInProgress(
          state.planlist.first.plannedDuration,
          0,
          state.planlist.first.plannedDuration,
          memoryid!.id,
          state.planlist.length ~/ 2,
          roundid!.id,
          state.planlist,
          state.planlist.first.type,
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
            state.selectedDuration,
            state.currentMemorySessionID,
            state.defaultSessionsPerRound,
            state.currentRoundID,
            state.sessions,
            state.type,
            state.subject));
      } else {
        add(const NextPomodoroTimer());
      }
    }
  }

  void _onPause(TimerPaused event, Emitter<PomodoroTimerState> emit) {
    final state = this.state;
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(
          state.duration,
          state.runTimes,
          state.selectedDuration,
          state.currentMemorySessionID,
          state.defaultSessionsPerRound,
          state.currentRoundID,
          state.sessions,
          state.type,
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
          state.selectedDuration,
          state.currentMemorySessionID,
          state.defaultSessionsPerRound,
          state.currentRoundID,
          state.sessions,
          state.type,
          state.subject));
    }
  }

  void _onReset(TimerReset event, Emitter<PomodoroTimerState> emit) async {
    _tickerSubscription?.cancel();
    final stored = await settingsRepo.fetchSettingsById(1);
    final workTimeDuration = stored!.selectedWorkDurationStored * 60;
    final now = DateTime.now();
    final startTime = await memorySessionRepo.getCurrentSession();
    final state = this.state;
    if (state is TimerRunInProgress) {
      if (startTime != null) {
        memorySessionRepo.updateMemorySessionWrite(
            state.currentMemorySessionID,
            MemorySessionVariableCompanion(
                id: Value(state.currentMemorySessionID),
                finishTime: Value(now),
                durationLeft: Value(state.duration),
                actuallyDoneDuration:
                    Value(now.difference(startTime.startingTime!).inSeconds)));
      }
      emit(TimerInitial(
          state.runTimes, workTimeDuration, state.defaultSessionsPerRound));
    } else if (state is TimerRunPause) {
      if (startTime != null) {
        memorySessionRepo.updateMemorySessionWrite(
            state.currentMemorySessionID,
            MemorySessionVariableCompanion(
                id: Value(state.currentMemorySessionID),
                finishTime: Value(now),
                durationLeft: Value(state.duration),
                actuallyDoneDuration:
                    Value(now.difference(startTime.startingTime!).inSeconds)));
        emit(TimerInitial(
            state.runTimes, workTimeDuration, state.defaultSessionsPerRound));
      }
    }
  }

  void _onNextPomodoro(
      NextPomodoroTimer event, Emitter<PomodoroTimerState> emit) async {
    final now = DateTime.now();
    final state = this.state;
    if (state is TimerRunInProgress) {
      if ((state.runTimes + 1) >= state.sessions.length) {
        // TASK: End the round

        _tickerSubscription?.cancel();
        await memorySessionRepo.updateMemorySessionWrite(
            state.currentMemorySessionID,
            MemorySessionVariableCompanion(
              durationLeft: Value(state.duration),
              finishTime: Value(now),
              completed: Value(true),
            ));

        await roundRepo.updateRoundWrite(
            state.currentRoundID,
            RoundVariableCompanion(
              completed: Value(true),
              finishTime: Value(now),
            ));
        add(TimerInit());
      } else if ((state.runTimes + 1) < state.sessions.length) {
        _tickerSubscription?.cancel();
        await memorySessionRepo.updateMemorySessionWrite(
            state.currentMemorySessionID,
            MemorySessionVariableCompanion(
              durationLeft: Value(state.duration),
              finishTime: Value(now),
              completed: Value(true),
            ));
        var sessionathand = await memorySessionRepo.getTheNextClosest();
        await memorySessionRepo.updateMemorySessionWrite(
            state.currentMemorySessionID + 1,
            MemorySessionVariableCompanion(
              startingTime: Value(now),
            ));
        print(state.runTimes);
        emit(TimerRunInProgress(
            state.sessions[state.runTimes + 1].plannedDuration,
            state.runTimes + 1,
            state.sessions[state.runTimes + 1].plannedDuration,
            sessionathand!.id,
            state
                .defaultSessionsPerRound, // how many sessions are there in the round, name change needed
            state.currentRoundID,
            state.sessions,
            state.sessions[state.runTimes + 1].type,
            state.subject));

        _tickerSubscription = _ticker
            .tick(ticks: state.sessions[state.runTimes].plannedDuration)
            .listen((duration) => add(_TimerTicked(duration: duration)));

        if (Platform.isLinux) {
          client = NotificationsClient();

          if (state.sessions[state.runTimes + 1].type == 'break' ||
              state.sessions[state.runTimes + 1].type == 'longbreak') {
            await client.notify(
                "Take a break for the next ${(state.selectedDuration / 60).round()} minutes!");
          } else if (state.sessions[state.runTimes + 1].type == 'work') {
            await client.notify(
                "Focus for the next ${(state.selectedDuration / 60).round()} minutes!");
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
          MemorySessionVariableCompanion(
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
          MemorySessionVariableCompanion(
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
