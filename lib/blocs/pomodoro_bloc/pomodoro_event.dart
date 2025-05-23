part of 'pomodoro_bloc.dart';

@immutable
sealed class PomodoroTimerEvent {
  const PomodoroTimerEvent();
}

final class TimerInit extends PomodoroTimerEvent {
  const TimerInit();
}

final class RoundPlan extends PomodoroTimerEvent {
  // for round planning will be renamed later on
  const RoundPlan({required this.duration});
  final int duration;
}

final class ChangePlan extends PomodoroTimerEvent {
  const ChangePlan(this.newplanlist);
  final List<SessionVariablePlanning> newplanlist;
}

final class StartRound extends PomodoroTimerEvent {
  const StartRound();
}

final class TimerPaused extends PomodoroTimerEvent {
  const TimerPaused();
}

final class TimerResumed extends PomodoroTimerEvent {
  const TimerResumed();
}

class TimerReset extends PomodoroTimerEvent {
  const TimerReset();
}

class _TimerTicked extends PomodoroTimerEvent {
  const _TimerTicked({required this.duration});
  final int duration;
}

class NextPomodoroTimer extends PomodoroTimerEvent {
  const NextPomodoroTimer();
}

class WindowIsClosing extends PomodoroTimerEvent {}
