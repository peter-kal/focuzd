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
  final int requestedRounds;

  const BreakPomodoroState(
      {required this.selectedBreakDuration,
      required this.isRunning,
      required this.requestedRounds,
      required this.timesRunBreak});

  @override
  List<Object> get props =>
      [selectedBreakDuration, isRunning, timesRunBreak, requestedRounds];
}

class WorkPomodoroState extends PomodoroState {
  final Duration selectedWorkDuration;
  final bool isRunning;
  final int timesRunWork;
  final int requestedRounds;

  const WorkPomodoroState(
      {required this.selectedWorkDuration,
      required this.isRunning,
      required this.requestedRounds,
      required this.timesRunWork});
  @override
  List<Object> get props =>
      [selectedWorkDuration, isRunning, timesRunWork, requestedRounds];
}

class LongBreakPomodoroState extends PomodoroState {
  final Duration selectedLongBreakDuration;
  final bool isRunning;
  final int timesRunLongBreak;
  final int requestedRounds;

  const LongBreakPomodoroState(
      {required this.selectedLongBreakDuration,
      required this.isRunning,
      required this.requestedRounds,
      required this.timesRunLongBreak});

  @override
  List<Object> get props => [
        selectedLongBreakDuration,
        isRunning,
        timesRunLongBreak,
        requestedRounds
      ];
}

final class PomodoroInitial extends PomodoroState {}
