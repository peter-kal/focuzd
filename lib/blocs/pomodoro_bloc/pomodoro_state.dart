part of 'pomodoro_bloc.dart';

@immutable
sealed class PomodoroTimerState extends Equatable {
  const PomodoroTimerState(
      this.duration, this.runTimes, this.reqRounds, this.selectedDuration, this.selectedLBperiod);
  final int duration;
  final int selectedDuration;
  final int runTimes;
  final int reqRounds;
  final int selectedLBperiod; // this is the default value for the long break period, which is 4 work sessions per round. This means that after 4 work sessions, there will be a long break. The user can change this value in the settings page.

  @override
  List<Object> get props => [duration, runTimes, reqRounds, selectedDuration];
}

final class TimerInitial extends PomodoroTimerState {
  const TimerInitial(
      super.duration, super.runTimes, super.reqRounds, super.selectedDuration, super.selectedLBperiod);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

final class TimerRunPause extends PomodoroTimerState {
  const TimerRunPause(
      super.duration, super.runTimes, super.reqRounds, super.selectedDuration, super.selectedLBperiod);

  @override
  String toString() =>
      'TimerRunPause { duration: $duration , workTImes: $runTimes}';
}

final class TimerRunInProgress extends PomodoroTimerState {
  const TimerRunInProgress(
      super.duration, super.runTimes, super.reqRounds, super.selectedDuration, super.selectedLBperiod);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration } TimesRun: $runTimes Type: {${runTimes % 2 == 0 ? "Break" : "Work"}}';
}

final class TimerRunComplete extends PomodoroTimerState {
  const TimerRunComplete() : super(0, 0, 0, 0, 0);
}
