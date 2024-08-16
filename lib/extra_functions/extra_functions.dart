import 'package:focuzd/blocs/pomodoro_bloc/pomodoro_bloc.dart';
import 'package:intl/intl.dart';

class ExtraFunctions {
  String endsOn(
      int remainingDuration, PomodoroTimerState state, DateTime start) {
    if (state is TimerRunInProgress) {
      Duration buildDuration = Duration(seconds: remainingDuration);
      DateTime target = start.add(buildDuration);
      String formatted = DateFormat('kk:mm').format(target);
      return formatted;
    } else if (state is TimerRunPause || state is TimerInitial) {
      return "-- : --";
    }
    return "null";
  }

  String currentSessionStatus(int Rn, int ReqSessions,
      String longBreakTimeLabel, String workTimeLabel, String breakTimeLabel) {
    if ((Rn % 2) == 0 && Rn == (ReqSessions * 2)) {
      return longBreakTimeLabel;
    } else if ((Rn % 2 != 0)) {
      return workTimeLabel;
    } else if ((Rn % 2) == 0 && Rn != (ReqSessions * 2)) {
      return breakTimeLabel;
    }
    return "error";
  }

  int countingWorkRounds(int times) {
    if (times == 1) {
      return times;
    } else if (times != 1 && (times % 2) == 0) {
      return times ~/ 2;
    } else if (times != 1 && (times % 2) != 0) {
      return ((times + 2) - 1) ~/
          2; // from the arithmetic progression of: An = A1st(which is 1) + (n - 1) * d(which is 2)
    }
    return 0;
  }
}
