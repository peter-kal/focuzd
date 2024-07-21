import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:focuzd/data/settings_storage/db_setings.dart';
part 'pomodoro_event.dart';
part 'pomodoro_state.dart';

class PomodoroBloc extends Bloc<PomodoroEvent, PomodoroState> {
  PomodoroBloc() : super(PomodoroInitial()) {
    int timesRunB = 0;
    int timesRunLB = 0;
    int timesRunW = 1;
    Duration remainingTimeGiven = Duration.zero;
    on<UpdateRemainingTime>((event, emit) {
      remainingTimeGiven = event.remainingTime;
    });
    on<Start>((event, emit) async {
      final selected = await SettingsDataProvider().readVar();
      emit(WorkPomodoroState(
          requestedRounds: selected.requestedNumberOfSessions!.toInt(),
          selectedWorkDuration:
              Duration(minutes: selected.selectedWorkDurationStored!),
          isRunning: false,
          timesRunWork: timesRunW));
    });

    on<Pause>((event, emit) {
      final stateGiven = event.stateGiven;
      if (stateGiven is WorkPomodoroState) {
        emit(WorkPomodoroState(
            requestedRounds: stateGiven.requestedRounds,
            selectedWorkDuration: remainingTimeGiven,
            isRunning: false,
            timesRunWork: stateGiven.timesRunWork));
      } else if (stateGiven is BreakPomodoroState) {
        emit(BreakPomodoroState(
            requestedRounds: stateGiven.requestedRounds,
            selectedBreakDuration: remainingTimeGiven,
            isRunning: false,
            timesRunBreak: stateGiven.timesRunBreak));
      } else if (stateGiven is LongBreakPomodoroState) {
        emit(LongBreakPomodoroState(
            requestedRounds: stateGiven.requestedRounds,
            selectedLongBreakDuration: remainingTimeGiven,
            isRunning: false,
            timesRunLongBreak: stateGiven.timesRunLongBreak));
      }
    });

    on<Resume>((event, emit) {
      final stateGiven = event.stateGiven;
      if (stateGiven is WorkPomodoroState) {
        emit(WorkPomodoroState(
            requestedRounds: stateGiven.requestedRounds,
            selectedWorkDuration: stateGiven.selectedWorkDuration,
            isRunning: true,
            timesRunWork: stateGiven.timesRunWork));
      } else if (stateGiven is BreakPomodoroState) {
        emit(BreakPomodoroState(
            requestedRounds: stateGiven.requestedRounds,
            selectedBreakDuration: stateGiven.selectedBreakDuration,
            isRunning: true,
            timesRunBreak: stateGiven.timesRunBreak));
      } else if (stateGiven is LongBreakPomodoroState) {
        emit(LongBreakPomodoroState(
            requestedRounds: stateGiven.requestedRounds,
            selectedLongBreakDuration: stateGiven.selectedLongBreakDuration,
            isRunning: true,
            timesRunLongBreak: stateGiven.timesRunLongBreak));
      }
    });

    on<Restart>((event, emit) async {
      final selected = await SettingsDataProvider().readVar();
      final stateGiven = event.stateGiven;
      switch (stateGiven) {
        case WorkPomodoroState _:
          emit(PomodoroInitial());
          emit(WorkPomodoroState(
              requestedRounds: stateGiven.requestedRounds,
              selectedWorkDuration:
                  Duration(minutes: selected.selectedWorkDurationStored!),
              isRunning: true,
              timesRunWork: stateGiven.timesRunWork));
          break;
        case BreakPomodoroState _:
          emit(PomodoroInitial());
          emit(BreakPomodoroState(
              requestedRounds: stateGiven.requestedRounds,
              selectedBreakDuration:
                  Duration(minutes: selected.selectedBreakDurationStored!),
              isRunning: true,
              timesRunBreak: stateGiven.timesRunBreak));
          break;
        case LongBreakPomodoroState _:
          emit(PomodoroInitial());
          emit(LongBreakPomodoroState(
              requestedRounds: stateGiven.requestedRounds,
              selectedLongBreakDuration:
                  Duration(minutes: selected.selectedLongBreakDuration!),
              isRunning: true,
              timesRunLongBreak: stateGiven.timesRunLongBreak));
          break;
        default:
      }
    });

    on<Next>((event, emit) async {
      final selected = await SettingsDataProvider().readVar();
      var stateGiven = event.stateGiven;

      if (stateGiven is WorkPomodoroState) {
        if (stateGiven.requestedRounds == stateGiven.timesRunWork) {
          timesRunLB++;
          emit(LongBreakPomodoroState(
              requestedRounds: stateGiven.requestedRounds,
              selectedLongBreakDuration:
                  Duration(minutes: selected.selectedLongBreakDuration!),
              isRunning: true,
              timesRunLongBreak: timesRunLB));
        } else if (stateGiven.timesRunWork < stateGiven.requestedRounds) {
          timesRunB++;
          emit(BreakPomodoroState(
              requestedRounds: stateGiven.requestedRounds, // from work to break
              selectedBreakDuration:
                  Duration(minutes: selected.selectedBreakDurationStored!),
              isRunning: true,
              timesRunBreak: timesRunB));
        }
      } else if (stateGiven is BreakPomodoroState) {
        if (stateGiven.timesRunBreak <= stateGiven.requestedRounds) {
          timesRunW++;
          emit(WorkPomodoroState(
              selectedWorkDuration:
                  Duration(minutes: selected.selectedWorkDurationStored!),
              isRunning: true,
              requestedRounds: stateGiven.requestedRounds,
              timesRunWork: timesRunW));
        }
      } else if (stateGiven is LongBreakPomodoroState) {
        timesRunW = 1;
        timesRunB = 0;
        timesRunLB = 0;
        add(Start());
      }
    });
  }
}
