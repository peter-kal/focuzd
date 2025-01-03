import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:desktop_notifications/desktop_notifications.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:focuzd/blocs/pomodoro_bloc/ticker.dart';
import 'package:focuzd/data/settings_storage/entities/settings_vars.dart';
part 'pomodoro_event.dart';
part 'pomodoro_state.dart';

class PomodoroBloc extends Bloc<PomodoroTimerEvent, PomodoroTimerState> {
  PomodoroBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(1, 1, 0, 1)) {
    on<TimerStarted>(_onStart);
    on<TimerInit>(_onTimerInit);
    on<_TimerTicked>(_onTicked);
    on<TimerPaused>(_onPause);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<NextPomodoroTimer>(_onNextPomodoroTimer);
  }

  int timesRun = 1;
  final Ticker _ticker;
  var client;
  StreamSubscription<int>? _tickerSubscription;
  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onTimerInit(TimerInit event, Emitter<PomodoroTimerState> emit) async {
    final stored = await SettingsVariablesEntity.querySetVarById(1);
    final workTimeDuration = stored!.selectedWorkDurationStored! * 60;
    final reqRounds = stored.requestedNumberOfSessions;
    emit(
        TimerInitial(workTimeDuration, timesRun, reqRounds!, workTimeDuration));
  }

  void _onStart(TimerStarted event, Emitter<PomodoroTimerState> emit) async {
    emit(TimerRunInProgress(event.duration, state.runTimes, state.reqRounds,
        state.selectedDuration));
    if (Platform.isLinux) {
      client = await NotificationsClient();
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
          state.selectedDuration));
    } else {
      add(const NextPomodoroTimer());
    }
  }

  void _onPause(TimerPaused event, Emitter<PomodoroTimerState> emit) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration, state.runTimes, state.reqRounds,
          state.selectedDuration));
    }
  }

  void _onResumed(TimerResumed resume, Emitter<PomodoroTimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration, state.runTimes, state.reqRounds,
          state.selectedDuration));
    }
  }

  void _onReset(TimerReset event, Emitter<PomodoroTimerState> emit) async {
    _tickerSubscription?.cancel();
    final stored = await SettingsVariablesEntity.querySetVarById(1);
    final workTimeDuration = stored!.selectedWorkDurationStored! * 60;
    emit(TimerInitial(workTimeDuration, state.runTimes, state.reqRounds,
        state.selectedDuration));
  }

  void _onNextPomodoroTimer(
      NextPomodoroTimer event, Emitter<PomodoroTimerState> emit) async {
    final selected = await SettingsVariablesEntity.querySetVarById(1);
    final int selectedWorkDuration = selected!.selectedWorkDurationStored!;
    final int selectedBreakDuration = selected.selectedBreakDurationStored!;
    final int selectedLBDuration = selected.selectedLongBreakDurationStored!;
    final int reqRound = selected.requestedNumberOfSessions!;
    if (timesRun >= reqRound * 2) {
      // if the goal reached then stop
      timesRun = 1;
      _tickerSubscription?.cancel();

      add(const TimerInit());
    } else if ((timesRun % 2) == 0) {
      // its break so it gives back a work session
      timesRun++;
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick(ticks: selectedWorkDuration * 60)
          .listen((duration) => add(_TimerTicked(duration: duration)));

      emit(TimerRunInProgress(selectedWorkDuration * 60, timesRun, reqRound,
          selectedWorkDuration * 60));
      if (Platform.isLinux) {
        client = await NotificationsClient();
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

      emit(TimerRunInProgress(
        selectedLBDuration * 60,
        timesRun,
        state.reqRounds,
        selectedLBDuration * 60,
      )); // The following equation tells us in what timesRun there will be a Long Break: requestedNumberOfSessions * 2
      if (Platform.isLinux) {
        client = await NotificationsClient();
        await client.notify(
            "Take a long break for the next ${(state.duration / 60).round()} minutes!");
      }
    } else if ((timesRun % 2) != 0) {
      timesRun++;
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick(ticks: selectedBreakDuration * 60)
          .listen((duration) => add(_TimerTicked(duration: duration)));
      emit(TimerRunInProgress(selectedBreakDuration * 60, timesRun,
          state.reqRounds, selectedBreakDuration * 60));
      if (Platform.isLinux) {
        client = await NotificationsClient();
        await client.notify(
            "Take a break for the next ${(state.duration / 60).round()} minutes!");
      }
    }
  }
}
