part of 'pomodoro_bloc.dart';

@immutable
sealed class PomodoroTimerState extends Equatable {
  const PomodoroTimerState(this.duration, this.workTimes);
  final int duration;
  final int workTimes;
  @override
  List<Object> get props => [duration, workTimes];
}

final class TimerInitial extends PomodoroTimerState {
  const TimerInitial(super.duration, super.workTimes);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

final class TimerRunPause extends PomodoroTimerState {
  const TimerRunPause(super.duration, super.workTimes);

  @override
  String toString() =>
      'TimerRunPause { duration: $duration , workTImes: $workTimes}';
}

final class TimerRunInProgress extends PomodoroTimerState {
  const TimerRunInProgress(super.duration, super.workTimes);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

final class TimerRunComplete extends PomodoroTimerState {
  const TimerRunComplete() : super(0, 0);
}
