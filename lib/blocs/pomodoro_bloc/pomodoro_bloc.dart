import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:desktop_notifications/desktop_notifications.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:focuzd/blocs/pomodoro_bloc/ticker.dart';
import 'package:focuzd/data/repo.dart';
import 'package:focuzd/data/settings_storage/db_settings.dart';
part 'pomodoro_event.dart';
part 'pomodoro_state.dart';

class PomodoroBloc extends Bloc<PomodoroTimerEvent, PomodoroTimerState> {
  final SettingsRepository settingsRepo;
  PomodoroBloc({required Ticker ticker, SettingsRepository? settingsRepo})
      : _ticker = ticker,
        settingsRepo = SettingsRepository(AppDatabase.instance),
        super(const TimerInitial(1, 1, 0, 1, 0, false)) {
    on<TimerStarted>(_onStart);
    on<TimerInit>(_onTimerInit);
    on<_TimerTicked>(_onTicked);
    on<TimerPaused>(_onPause);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<NextPomodoroTimer>(_onNextPomodoroTimer);
    on<PomodoroSettingsChanged>(_onPomodoroSettingsChanged);
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
    final stored = await settingsRepo.fetchSettings();
    final workTimeDuration = stored!.defaultFocusDurationStored * 60;
    final reqRounds = stored.defaultNumberOfSessionsPerRound;
    emit(TimerInitial(workTimeDuration, timesRun, reqRounds, workTimeDuration,
        stored.periodofLongBreak, stored.atWillStart));
  }

  void _onStart(TimerStarted event, Emitter<PomodoroTimerState> emit) async {
    emit(TimerRunInProgress(event.duration, state.runTimes, state.reqRounds,
        state.selectedDuration, state.selectedLBperiod, state.atWillStart));
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
          state.selectedDuration, state.selectedLBperiod, state.atWillStart));
    } else {
      add(const NextPomodoroTimer());
    }
  }

  void _onPause(TimerPaused event, Emitter<PomodoroTimerState> emit) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration, state.runTimes, state.reqRounds,
          state.selectedDuration, state.selectedLBperiod, state.atWillStart));
    }
  }

  void _onResumed(TimerResumed resume, Emitter<PomodoroTimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration, state.runTimes, state.reqRounds,
          state.selectedDuration, state.selectedLBperiod, state.atWillStart));
    }
  }

  void _onReset(TimerReset event, Emitter<PomodoroTimerState> emit) async {
    _tickerSubscription?.cancel();
    final stored = await settingsRepo.fetchSettings();
    if ((state.runTimes % 2) != 0) {
      final workTimeDuration = stored!.defaultFocusDurationStored * 60;
      emit(TimerInitial(workTimeDuration, state.runTimes, state.reqRounds,
          state.selectedDuration, state.selectedLBperiod, state.atWillStart));
    } else {
      if ((state.runTimes % 2) == 0 &&
          ((state.runTimes) % (state.runTimes * 2) != 0)) {
        final breakTimeDuration = stored!.defaultBreakDurationStored * 60;
        emit(TimerInitial(breakTimeDuration, state.runTimes, state.reqRounds,
            state.selectedDuration, state.selectedLBperiod, state.atWillStart));
      }
      if ((state.runTimes % 2) == 0 &&
          ((state.runTimes) % (state.selectedLBperiod * 2) == 0)) {
        final longBreakTimeDuration =
            stored!.defaultLongBreakDurationStored * 60;
        emit(TimerInitial(
            longBreakTimeDuration,
            state.runTimes,
            state.reqRounds,
            state.selectedDuration,
            state.selectedLBperiod,
            state.atWillStart));
      }
    }
  }

  void _onNextPomodoroTimer(
      NextPomodoroTimer event, Emitter<PomodoroTimerState> emit) async {
    final selected = await settingsRepo.fetchSettings();
    final int selectedWorkDuration = selected!.defaultFocusDurationStored;
    final int selectedBreakDuration = selected.defaultBreakDurationStored;
    final int selectedLBDuration = selected.defaultLongBreakDurationStored;
    final int reqRound = selected.defaultNumberOfSessionsPerRound;
    final int selectedLBperiod = selected.periodofLongBreak;
    final bool selectedAtWillStart = selected.atWillStart;
    if (timesRun >= reqRound * 2) {
      // if the goal reached then stop
      timesRun = 1;
      _tickerSubscription?.cancel();

      add(const TimerInit());
    } else if ((timesRun % 2) == 0) {
      // its break so it gives back a work session
      //here there should be a check if manualStart has been enabled
      timesRun++;
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick(ticks: selectedWorkDuration * 60)
          .listen((duration) => add(_TimerTicked(duration: duration)));

      emit(TimerRunInProgress(selectedWorkDuration * 60, timesRun, reqRound,
          selectedWorkDuration * 60, selectedLBperiod, selectedAtWillStart));
      if (selectedAtWillStart == true) {
        add(const TimerPaused());
      }
      if (Platform.isLinux) {
        client = await NotificationsClient();
        await client.notify(
            "Focus for the next ${(state.duration / 60).round()} minutes!");
      } else if (Platform.isWindows) {}
    } else if ((timesRun % 2) != 0 &&
        (timesRun + 1) % (selectedLBperiod * 2) == 0) {
      // if the current timesRun is by one smaller to a number that's perfectly divisible by the period of long break then it gives back a long break session

      timesRun++;
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick(ticks: selectedLBDuration * 60)
          .listen((duration) => add(_TimerTicked(duration: duration)));

      emit(TimerRunInProgress(selectedLBDuration * 60, timesRun, reqRound,
          selectedLBDuration * 60, selectedLBperiod, selectedAtWillStart));
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
      emit(TimerRunInProgress(selectedBreakDuration * 60, timesRun, reqRound,
          selectedBreakDuration * 60, selectedLBperiod, selectedAtWillStart));
      if (Platform.isLinux) {
        client = await NotificationsClient();
        await client.notify(
            "Take a break for the next ${(state.duration / 60).round()} minutes!");
      }
    }
  }

  FutureOr<void> _onPomodoroSettingsChanged(
      PomodoroSettingsChanged event, Emitter<PomodoroTimerState> emit) {
    final current = state;
    if (current is TimerInitial) {
      add(const TimerInit());
    }
  }
}
