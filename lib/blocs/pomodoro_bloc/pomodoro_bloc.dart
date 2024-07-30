import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:focuzd/blocs/pomodoro_bloc/ticker.dart';
import 'package:focuzd/data/settings_storage/db_setings.dart';
part 'pomodoro_event.dart';
part 'pomodoro_state.dart';

class PomodoroBloc extends Bloc<PomodoroTimerEvent, PomodoroTimerState> {
  PomodoroBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(0, 1)) {
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
  StreamSubscription<int>? _tickerSubscription;
  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onTimerInit(TimerInit event, Emitter<PomodoroTimerState> emit) async {
    final stored = await SettingsDataProvider().readVar();
    final workTimeDuration = stored.selectedWorkDurationStored! * 60;
    emit(TimerInitial(workTimeDuration, timesRun));
  }

  void _onStart(TimerStarted event, Emitter<PomodoroTimerState> emit) {
    emit(TimerRunInProgress(event.duration, state.workTimes));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(_TimerTicked(duration: duration)));
  }

  void _onTicked(_TimerTicked event, Emitter<PomodoroTimerState> emit) {
    if (event.duration > 0) {
      emit(TimerRunInProgress(event.duration, state.workTimes));
    } else {
      add(const NextPomodoroTimer());
    }
  }

  void _onPause(TimerPaused event, Emitter<PomodoroTimerState> emit) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration, state.workTimes));
    }
  }

  void _onResumed(TimerResumed resume, Emitter<PomodoroTimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration, state.workTimes));
    }
  }

  void _onReset(TimerReset event, Emitter<PomodoroTimerState> emit) async {
    _tickerSubscription?.cancel();
    final stored = await SettingsDataProvider().readVar();
    final workTimeDuration = stored.selectedWorkDurationStored! * 60;
    emit(TimerInitial(workTimeDuration, state.workTimes));
  }

  void _onNextPomodoroTimer(
      NextPomodoroTimer event, Emitter<PomodoroTimerState> emit) async {
    final selected = await SettingsDataProvider().readVar();
    var selectedWorkDuration = selected.selectedWorkDurationStored;
    var selectedBreakDuration = selected.selectedBreakDurationStored;
    var selectedLBDuration = selected.selectedLongBreakDuration;
    var reqRound = selected.requestedNumberOfSessions;
    if (timesRun >= reqRound! * 2) {
      timesRun = 1;
      _tickerSubscription?.cancel();

      add(const TimerInit());
    } else if ((timesRun % 2) == 0) {
      timesRun++;
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick(ticks: selectedWorkDuration! * 60)
          .listen((duration) => add(_TimerTicked(duration: duration)));
      emit(TimerRunInProgress(selectedWorkDuration * 60, timesRun));
    } else if ((timesRun % 2) != 0 && timesRun == (reqRound! * 2) - 1) {
      // The following equation tells us when the last work duration will be: (requestedNumberOfSessions * 2) - 1
      timesRun++;
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick(ticks: selectedLBDuration! * 60)
          .listen((duration) => add(_TimerTicked(duration: duration)));
      emit(TimerRunInProgress(selectedLBDuration * 60,
          timesRun)); // The following equation tells us in what timesRun there will be a Long Break: requestedNumberOfSessions * 2
    } else if ((timesRun % 2) != 0) {
      timesRun++;
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick(ticks: selectedBreakDuration! * 60)
          .listen((duration) => add(_TimerTicked(duration: duration)));
      emit(TimerRunInProgress(selectedBreakDuration * 60, timesRun));
    }
  }
}
