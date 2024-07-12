part of 'pomodoro_bloc.dart';

@immutable
sealed class PomodoroEvent extends Equatable {
  const PomodoroEvent();

  @override
  List<Object> get props => [];
}

class Start extends PomodoroEvent {}

class Pause extends PomodoroEvent {
  const Pause({required this.stateGiven});
  final PomodoroState stateGiven;
  @override
  List<Object> get props => [stateGiven];
}

class Resume extends PomodoroEvent {
  const Resume({required this.stateGiven});
  final PomodoroState stateGiven;

  @override
  List<Object> get props => [stateGiven];
}

class Next extends PomodoroEvent {
  const Next({required this.stateGiven});
  final PomodoroState stateGiven;
  @override
  List<Object> get props => [stateGiven];
}

class Restart extends PomodoroEvent {
  const Restart({required this.stateGiven});
  final PomodoroState stateGiven;
  @override
  List<Object> get props => [stateGiven];
}

class UpdateRemainingTime extends PomodoroEvent {
  const UpdateRemainingTime({required this.remainingTime});
  final Duration remainingTime;
  @override
  List<Object> get props => [remainingTime];
}
