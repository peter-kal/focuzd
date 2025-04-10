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
part 'pomodoro_event.dart';
part 'pomodoro_state.dart';

class PomodoroBloc extends Bloc<PomodoroTimerEvent, PomodoroTimerState> {
  PomodoroBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(1, 1, 0, 1, 0)) {
    on<TimerStarted>(_onStart);
    on<TimerInit>(_onTimerInit);
    on<_TimerTicked>(_onTicked);
    on<TimerPaused>(_onPause);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<NextPomodoroTimer>(_onNextPomodoroTimer);
    on<WindowIsClosing>(_onWindowIsClosing);
  }

  int timesRun = 1;
  final Ticker _ticker;
  final settingsRepo = SettingsRepository(AppDatabase.instance);
  final memorySessionRepo = MemorySessionRepository(AppDatabase.instance);
  var client;
  StreamSubscription<int>? _tickerSubscription;
  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onTimerInit(TimerInit event, Emitter<PomodoroTimerState> emit) async {
    final stored = await settingsRepo.fetchSettingsById(1);
    final workTimeDuration = stored!.selectedWorkDurationStored * 60;
    final reqRounds = stored.requestedNumberOfSessions;
    emit(TimerInitial(
        workTimeDuration, timesRun, reqRounds, workTimeDuration, 0));
  }

  void _onStart(TimerStarted event, Emitter<PomodoroTimerState> emit) async {
    final now = DateTime.now();
    await memorySessionRepo.insertMemorySession(MemorySessionVariableCompanion(
      roundGoal: Value(state.reqRounds),
      runTime: Value(state.runTimes),
      plannedDuration: Value(state.duration),
      startingTime: Value(now),
      expFinishTime: Value(now.add(Duration(seconds: state.duration))),
      type: Value("work"),
    ));
    final curr = await memorySessionRepo.getCurrentSession();
    emit(TimerRunInProgress(event.duration, state.runTimes, state.reqRounds,
        state.selectedDuration, curr!.id));
    if (Platform.isLinux) {
      client = NotificationsClient();
      await client.notify(
          "Focus for the next ${(state.duration / 60).round()} minutes!");
    }

    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(_TimerTicked(duration: duration)));
  }

  void _onTicked(_TimerTicked event, Emitter<PomodoroTimerState> emit) {
    if (event.duration > 0) {
      emit(TimerRunInProgress(event.duration, state.runTimes, state.reqRounds,
          state.selectedDuration, state.currentMemorySessionid));
    } else {
      add(const NextPomodoroTimer());
    }
  }

  void _onPause(TimerPaused event, Emitter<PomodoroTimerState> emit) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration, state.runTimes, state.reqRounds,
          state.selectedDuration, state.currentMemorySessionid));
    }
  }

  void _onResumed(TimerResumed resume, Emitter<PomodoroTimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration, state.runTimes, state.reqRounds,
          state.selectedDuration, state.currentMemorySessionid));
    }
  }

  void _onReset(TimerReset event, Emitter<PomodoroTimerState> emit) async {
    _tickerSubscription?.cancel();
    final stored = await settingsRepo.fetchSettingsById(1);
    final workTimeDuration = stored!.selectedWorkDurationStored * 60;
    final now = DateTime.now();
    final startTime = await memorySessionRepo.getCurrentSession();
    if (startTime != null) {
      memorySessionRepo.updateMemorySessionWrite(
          state.currentMemorySessionid,
          MemorySessionVariableCompanion(
              id: Value(state.currentMemorySessionid),
              finishTime: Value(now),
              durationLeft: Value(state.duration),
              actuallyDoneDuration:
                  Value(now.difference(startTime.startingTime).inSeconds)));
    }

    emit(TimerInitial(workTimeDuration, state.runTimes, state.reqRounds,
        state.selectedDuration, 0));
  }

  void _onNextPomodoroTimer(
      NextPomodoroTimer event, Emitter<PomodoroTimerState> emit) async {
    final selected = await settingsRepo.fetchSettingsById(1);
    final int selectedWorkDuration = selected!.selectedWorkDurationStored;
    final int selectedBreakDuration = selected.selectedBreakDurationStored;
    final int selectedLBDuration = selected.selectedLongBreakDurationStored;
    final int reqRound = selected.requestedNumberOfSessions;
    if (timesRun >= reqRound * 2) {
      // if the goal reached then stop
      timesRun = 1;
      _tickerSubscription?.cancel();
      final now = DateTime.now();
      final startTime = await memorySessionRepo.getCurrentSession();
      memorySessionRepo.updateMemorySessionWrite(
          state.currentMemorySessionid,
          MemorySessionVariableCompanion(
              id: Value(state.currentMemorySessionid),
              finishTime: Value(now),
              durationLeft: Value(state.duration),
              actuallyDoneDuration:
                  Value(now.difference(startTime!.startingTime).inSeconds)));
      add(const TimerInit());
    } else if ((timesRun % 2) == 0) {
      // its break so it gives back a work session
      timesRun++;
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick(ticks: selectedWorkDuration * 60)
          .listen((duration) => add(_TimerTicked(duration: duration)));
      final now = DateTime.now();
      final startTime = await memorySessionRepo.getCurrentSession();
      memorySessionRepo.updateMemorySessionWrite(
          //update the session that ends
          state.currentMemorySessionid,
          MemorySessionVariableCompanion(
              id: Value(state.currentMemorySessionid),
              finishTime: Value(now),
              durationLeft: Value(state.duration),
              actuallyDoneDuration:
                  Value(now.difference(startTime!.startingTime).inSeconds)));
      memorySessionRepo.insertMemorySession(MemorySessionVariableCompanion(
        //creates a new session
        roundGoal: Value(state.reqRounds),
        runTime: Value(state.runTimes),
        plannedDuration: Value(state.duration),
        startingTime: Value(now),
        expFinishTime: Value(now.add(Duration(seconds: state.duration))),
        type: Value("work"),
      ));
      final curr = await memorySessionRepo.getCurrentSession();
      emit(TimerRunInProgress(selectedWorkDuration * 60, timesRun, reqRound,
          selectedWorkDuration * 60, curr!.id));
      if (Platform.isLinux) {
        client = NotificationsClient();
        await client.notify(
            "Focus for the next ${(state.duration / 60).round()} minutes!");
      } else if (Platform.isWindows) {}
    } else if ((timesRun % 2) != 0 && timesRun == (reqRound * 2) - 1) {
      // its the last work session, returns LongBreak
      // The following equation tells us when the last work duration will be: (requestedNumberOfSessions * 2) - 1
      timesRun++;
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick(ticks: selectedLBDuration * 60)
          .listen((duration) => add(_TimerTicked(duration: duration)));
      final now = DateTime.now();
      final startTime = await memorySessionRepo.getCurrentSession();
      memorySessionRepo.updateMemorySessionWrite(
          state.currentMemorySessionid,
          MemorySessionVariableCompanion(
              id: Value(state.currentMemorySessionid),
              finishTime: Value(now),
              durationLeft: Value(state.duration),
              actuallyDoneDuration:
                  Value(now.difference(startTime!.startingTime).inSeconds)));

      memorySessionRepo.insertMemorySession(MemorySessionVariableCompanion(
        roundGoal: Value(state.reqRounds),
        runTime: Value(state.runTimes),
        plannedDuration: Value(state.duration),
        startingTime: Value(now),
        expFinishTime: Value(now.add(Duration(seconds: state.duration))),
        type: Value("longbreak"),
      ));
      final curr = await memorySessionRepo.getCurrentSession();
      emit(TimerRunInProgress(
          selectedLBDuration * 60,
          timesRun,
          state.reqRounds,
          selectedLBDuration * 60,
          curr!
              .id)); // The following equation tells us in what timesRun there will be a Long Break: requestedNumberOfSessions * 2
      if (Platform.isLinux) {
        client = NotificationsClient();
        await client.notify(
            "Take a long break for the next ${(state.duration / 60).round()} minutes!");
      }
    } else if ((timesRun % 2) != 0) {
      timesRun++;
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick(ticks: selectedBreakDuration * 60)
          .listen((duration) => add(_TimerTicked(duration: duration)));
      final now = DateTime.now();

      final startTime = await memorySessionRepo.getCurrentSession();
      memorySessionRepo.updateMemorySessionWrite(
          //update the session that ends
          state.currentMemorySessionid,
          MemorySessionVariableCompanion(
              id: Value(state.currentMemorySessionid),
              finishTime: Value(now),
              durationLeft: Value(state.duration),
              actuallyDoneDuration:
                  Value(now.difference(startTime!.startingTime).inSeconds)));
      memorySessionRepo.insertMemorySession(MemorySessionVariableCompanion(
        roundGoal: Value(state.reqRounds),
        runTime: Value(state.runTimes),
        plannedDuration: Value(state.duration),
        startingTime: Value(now),
        expFinishTime: Value(now.add(Duration(seconds: state.duration))),
        type: Value("break"),
      ));

      final curr = await memorySessionRepo.getCurrentSession();
      emit(TimerRunInProgress(selectedBreakDuration * 60, timesRun,
          state.reqRounds, selectedBreakDuration * 60, curr!.id));
      if (Platform.isLinux) {
        client = NotificationsClient();
        await client.notify(
            "Take a break for the next ${(state.duration / 60).round()} minutes!");
      }
    }
  }

  void _onWindowIsClosing(
      WindowIsClosing event, Emitter<PomodoroTimerState> emit) async {
    final state = this.state;
    final now = DateTime.now();
    final currentSession = await memorySessionRepo.getCurrentSession();
    if (currentSession != null) {
      await memorySessionRepo.updateMemorySessionWrite(
        currentSession.id,
        MemorySessionVariableCompanion(
          finishTime: Value(now),
          durationLeft: Value(state.duration),
          actuallyDoneDuration: Value(
            now.difference(currentSession.startingTime).inSeconds,
          ),
        ),
      );
    } else {
      print("null");
    }
  }
}
