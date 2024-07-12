part of 'pomodoro_bloc.dart';

@immutable
sealed class PomodoroState extends Equatable {
  const PomodoroState();

  @override
  List<Object> get props => [];
}

class BreakPomodoroState extends PomodoroState {
  final Duration selectedBreakDuration;
  final bool isRunning;
  final int timesRunBreak;

  const BreakPomodoroState(
      {required this.selectedBreakDuration,
      required this.isRunning,
      required this.timesRunBreak});

  @override
  List<Object> get props => [selectedBreakDuration, isRunning, timesRunBreak];
}

class WorkPomodoroState extends PomodoroState {
  final Duration selectedWorkDuration;
  final bool isRunning;
  final int timesRunWork;

  const WorkPomodoroState(
      {required this.selectedWorkDuration,
      required this.isRunning,
      required this.timesRunWork});
  @override
  List<Object> get props => [selectedWorkDuration, isRunning, timesRunWork];
}

class LongBreakPomodoroState extends PomodoroState {
  final Duration selectedLongBreakDuration;
  final bool isRunning;
  final int timesRunLongBreak;

  const LongBreakPomodoroState(
      {required this.selectedLongBreakDuration,
      required this.isRunning,
      required this.timesRunLongBreak});

  @override
  List<Object> get props =>
      [selectedLongBreakDuration, isRunning, timesRunLongBreak];
}

final class PomodoroInitial extends PomodoroState {}
