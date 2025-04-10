part of 'pomodoro_bloc.dart';

@immutable
sealed class PomodoroTimerState extends Equatable {
  const PomodoroTimerState(this.duration, this.runTimes, this.reqRounds,
      this.selectedDuration, this.currentMemorySessionid);
  final int duration;
  final int selectedDuration;
  final int runTimes;
  final int reqRounds;
  final int currentMemorySessionid;

  @override
  List<Object> get props =>
      [duration, runTimes, reqRounds, selectedDuration, currentMemorySessionid];
}

final class TimerInitial extends PomodoroTimerState {
  const TimerInitial(super.duration, super.runTimes, super.reqRounds,
      super.selectedDuration, super.currentMemorySessionid);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

final class TimerRunPause extends PomodoroTimerState {
  const TimerRunPause(super.duration, super.runTimes, super.reqRounds,
      super.selectedDuration, super.currentMemorySessionid);

  @override
  String toString() =>
      'TimerRunPause { duration: $duration , workTImes: $runTimes}';
}

final class TimerRunInProgress extends PomodoroTimerState {
  const TimerRunInProgress(super.duration, super.runTimes, super.reqRounds,
      super.selectedDuration, super.currentMemorySessionid);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

final class TimerRunComplete extends PomodoroTimerState {
  const TimerRunComplete() : super(0, 0, 0, 0, 0);
}
