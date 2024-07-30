part of 'pomodoro_bloc.dart';

@immutable
sealed class PomodoroTimerEvent {
  const PomodoroTimerEvent();
}

final class TimerStarted extends PomodoroTimerEvent {
  const TimerStarted({required this.duration});
  final int duration;
}

final class TimerInit extends PomodoroTimerEvent {
  const TimerInit();
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
