import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/pomodoro_bloc/pomodoro_bloc.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:intl/intl.dart';
import 'package:window_manager/window_manager.dart';

mixin class ExtraFunctions {
  String? hoursString(duration) {
    if (((duration / 60) / 60) > 1) {
      return ((duration / 60) / 60).floor().toString().padLeft(1, '0');
    } else {
      return null;
    }
  }

  String minutesString(duration) {
    return ((duration / 60) % 60).floor().toString().padLeft(2, '0');
  }

  String secondsString(duration) {
    return (duration % 60).floor().toString().padLeft(2, '0');
  }

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

  List<SessionVariablePlanning> getList(
      int defaultSessionsPerRound, // multiply by 60 so to display you have to divide by 60
      int defaultLongBreakTime,
      int defaultBreakTime,
      defaultWorkTime) {
    List<SessionVariablePlanning> list = [];
    for (int i = 1; i < (defaultSessionsPerRound * 2) + 1; i++) {
      if ((i % 2) == 0 && i == defaultSessionsPerRound * 2) {
        list.add(SessionVariablePlanning(
            "longbreak", defaultLongBreakTime * 60, null));
      } else if ((i % 2) == 0 && i < defaultSessionsPerRound * 2) {
        list.add(SessionVariablePlanning("break", defaultBreakTime * 60, null));
      } else if ((i % 2) != 0) {
        list.add(SessionVariablePlanning("work", defaultWorkTime * 60, null));
      }
    }
    return list;
  }
}

class MyWindowListener extends WindowListener {
  MyWindowListener({required this.context});
  final BuildContext context;
  @override
  void onWindowClose() async {
    print("window is closing");
    windowManager.setPreventClose(true);
    BlocProvider.of<PomodoroBloc>(context).add(WindowIsClosing());
    await windowManager.setPreventClose(false);
    await windowManager.destroy();
  }
}

class SessionVariablePlanning {
  SessionVariablePlanning(this.type, this.plannedDuration, this.subject,
      {this.expFinishTime});
  final String type;
  final int plannedDuration;
  DateTime? expFinishTime;
  SubjectData? subject;
}
