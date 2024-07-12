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
          selectedWorkDuration:
              Duration(minutes: selected.selectedWorkDurationStored!),
          isRunning: false,
          timesRunWork: timesRunW));
    });
    on<Pause>((event, emit) {
      final stateGiven = event.stateGiven;
      if (stateGiven is WorkPomodoroState) {
        emit(WorkPomodoroState(
            selectedWorkDuration: remainingTimeGiven,
            isRunning: false,
            timesRunWork: stateGiven.timesRunWork));
      } else if (stateGiven is BreakPomodoroState) {
        emit(BreakPomodoroState(
            selectedBreakDuration: remainingTimeGiven,
            isRunning: false,
            timesRunBreak: stateGiven.timesRunBreak));
      } else if (stateGiven is LongBreakPomodoroState) {
        emit(LongBreakPomodoroState(
            selectedLongBreakDuration: remainingTimeGiven,
            isRunning: false,
            timesRunLongBreak: stateGiven.timesRunLongBreak));
      }
    });

    on<Resume>((event, emit) {
      final stateGiven = event.stateGiven;
      if (stateGiven is WorkPomodoroState) {
        emit(WorkPomodoroState(
            selectedWorkDuration: stateGiven.selectedWorkDuration,
            isRunning: true,
            timesRunWork: stateGiven.timesRunWork));
      } else if (stateGiven is BreakPomodoroState) {
        emit(BreakPomodoroState(
            selectedBreakDuration: stateGiven.selectedBreakDuration,
            isRunning: true,
            timesRunBreak: stateGiven.timesRunBreak));
      } else if (stateGiven is LongBreakPomodoroState) {
        emit(LongBreakPomodoroState(
            selectedLongBreakDuration: stateGiven.selectedLongBreakDuration,
            isRunning: true,
            timesRunLongBreak: stateGiven.timesRunLongBreak));
      }
    });

    on<Next>((event, emit) async {
      final selected = await SettingsDataProvider().readVar();
      final stateGiven = event.stateGiven;

      switch (stateGiven) {
        case WorkPomodoroState _:
          switch (stateGiven.timesRunWork) {
            case == 4:
              emit(LongBreakPomodoroState(
                  selectedLongBreakDuration:
                      Duration(minutes: selected.selectedLongBreakDuration!),
                  isRunning: true,
                  timesRunLongBreak: timesRunLB + 1));
              break;
            case <= 3:
              emit(BreakPomodoroState(
                  selectedBreakDuration:
                      Duration(minutes: selected.selectedBreakDurationStored!),
                  isRunning: true,
                  timesRunBreak: timesRunB + 1));
              break;
            default:
          }
          break;
        case BreakPomodoroState _:
          switch (stateGiven.timesRunBreak) {
            case <= 3:
              emit(WorkPomodoroState(
                  selectedWorkDuration:
                      Duration(minutes: selected.selectedWorkDurationStored!),
                  isRunning: true,
                  timesRunWork: timesRunW + 1)); // here is the problem
              break;
          }
          break;
        case LongBreakPomodoroState _:
          emit(WorkPomodoroState(
              selectedWorkDuration:
                  Duration(minutes: selected.selectedWorkDurationStored!),
              isRunning: true,
              timesRunWork: timesRunW + 1));

          break;
        default:
      }
    });

    on<Restart>((event, emit) async {
      final selected = await SettingsDataProvider().readVar();
      final stateGiven = event.stateGiven;
      switch (stateGiven) {
        case WorkPomodoroState _:
          emit(PomodoroInitial());
          emit(WorkPomodoroState(
              selectedWorkDuration:
                  Duration(minutes: selected.selectedWorkDurationStored!),
              isRunning: true,
              timesRunWork: stateGiven.timesRunWork));
          break;
        case BreakPomodoroState _:
          emit(PomodoroInitial());
          emit(BreakPomodoroState(
              selectedBreakDuration:
                  Duration(minutes: selected.selectedBreakDurationStored!),
              isRunning: true,
              timesRunBreak: stateGiven.timesRunBreak));
          break;
        case LongBreakPomodoroState _:
          emit(PomodoroInitial());
          emit(LongBreakPomodoroState(
              selectedLongBreakDuration:
                  Duration(minutes: selected.selectedLongBreakDuration!),
              isRunning: true,
              timesRunLongBreak: stateGiven.timesRunLongBreak));
          break;
        default:
      }
    });
  }
}
