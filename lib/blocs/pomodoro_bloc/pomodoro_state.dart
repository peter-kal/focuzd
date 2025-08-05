part of 'pomodoro_bloc.dart';

@immutable
sealed class PomodoroTimerState extends Equatable {
  const PomodoroTimerState(
    this.defaultSessionsPerRound,
  );
  //will be used for the list
  final int defaultSessionsPerRound;

  @override
  List<Object> get props => [
        defaultSessionsPerRound,
      ];
}

final class TimerInitial extends PomodoroTimerState {
  const TimerInitial(
    this.runTimes,
    this.selectedDuration,
    super.defaultSessionsPerRound,
  );
  final int runTimes;
  final int selectedDuration;
  @override
  List<Object> get props =>
      [runTimes, selectedDuration, defaultSessionsPerRound];
}

final class RoundPlanning extends PomodoroTimerState {
  const RoundPlanning(
      super.defaultSessionsPerRound,
      this.defaultBreakTime,
      this.defaultWorkTime,
      this.defaultLongBreakTime,
      this.subjects,
      this.planlist,
      this.expFinishRoundTime,
      this.roundDuration);
  final int defaultBreakTime;
  final int defaultWorkTime;
  final int defaultLongBreakTime;
  final List<SubjectData> subjects;
  final List<SessionVariablePlanning> planlist;
  final DateTime expFinishRoundTime;
  final int roundDuration;
  // in the future goals are going to be added here
  @override
  List<Object> get props => [
        defaultBreakTime,
        defaultWorkTime,
        defaultLongBreakTime,
        planlist,
        expFinishRoundTime,
        roundDuration
      ];
}

final class TimerRunPause extends PomodoroTimerState {
  const TimerRunPause(
      super.defaultSessionsPerRound,
      this.runTimes,
      this.duration,
      this.selectedDuration,
      this.currentMemorySessionID,
      this.currentRoundID,
      this.sessions,
      this.type,
      [this.subject]);
  final int runTimes;
  final int duration;
  final int selectedDuration;
  final int currentMemorySessionID;
  final int currentRoundID;
  final List<SessionVariablePlanning> sessions;
  final String type;
  final SubjectData? subject;
  @override
  String toString() =>
      'TimerRunPause { duration: $duration , workTimes: $runTimes}';
}

final class TimerRunInProgress extends PomodoroTimerState {
  const TimerRunInProgress(
      this.duration,
      this.runTimes,
      this.selectedDuration,
      this.currentMemorySessionID,
      super.defaultSessionsPerRound,
      this.currentRoundID,
      this.sessions,
      this.type,
      [this.subject]);
  final int duration;
  final int runTimes;
  final int selectedDuration;
  final int currentMemorySessionID;
  final int currentRoundID;
  final List<SessionVariablePlanning> sessions;
  final SubjectData? subject;
  final String type;
  @override
  List<Object> get props => [
        duration,
        runTimes,
        selectedDuration,
        currentMemorySessionID,
        defaultSessionsPerRound,
        currentRoundID,
        sessions,
        type,
        [subject],
      ];
  @override
  String toString() =>
      'TimerRunInProgress { duration: $duration, runTime: $runTimes }';
}

final class TimerRunComplete extends PomodoroTimerState {
  const TimerRunComplete() : super(0);
}
