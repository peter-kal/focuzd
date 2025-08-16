import 'package:drift/drift.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/pomodoro_bloc/pomodoro_bloc.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:focuzd/data/repo.dart';
import 'package:intl/intl.dart';
import 'package:window_manager/window_manager.dart';

mixin class ExtraFunctions {
  Future<void> getThePermanentList(List<SessionVariablePlanning> list,
      MemorySessionRepository memoryrepo, int roundID) async {
    List<MemoryCountdownVariableData> historyList = [];

    DateTime now = DateTime.now().toLocal();
    DateTime nowperthen = DateTime.now().toLocal();
    for (int i = 0; i < list.length; i++) {
      nowperthen = nowperthen.add(Duration(seconds: list[i].plannedDuration));
      list[i].expFinishTime = nowperthen;
    }

    for (int i = 0; i < list.length; i++) {
      bool isFocus = ((i + 1) % 2) != 0;
      bool islongBreak = ((i + 1) % 8) == 0;
      String type;

      if (isFocus == false && islongBreak == false) {
        type = "break";
      } else if (isFocus == true) {
        type = "focus";
      } else if (islongBreak == true) {
        type = "longBreak";
      } else {
        type = "e";
      }
      historyList.add(MemoryCountdownVariableData(
        id: i,
        type: type,
        roundGoal: list.length ~/ 2,
        roundId: roundID,
        roundRunTime: i++,
        active: false,
        plannedDuration: list[i].plannedDuration,
        subject: list[i].subject!.id,
        expStartingTime: list[i]
            .expFinishTime!
            .subtract(Duration(seconds: list[i].plannedDuration)),
      ));
      memoryrepo.insertMemorySession(MemoryCountdownVariableCompanion(
          type: Value(type),
          roundGoal: Value(list.length ~/ 2),
          roundId: Value(roundID),
          roundRunTime: Value(i++),
          plannedDuration: Value(list[i].plannedDuration),
          subject: Value(list[i].subject!.id),
          expStartingTime: Value(
            list[i]
                .expFinishTime!
                .subtract(Duration(seconds: list[i].plannedDuration)),
          )));
    }
  }

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

  String currentSessionStatus(String type, String longBreakTimeLabel,
      String focusTimeLabel, String breakTimeLabel) {
    if (type == 'longbreak') {
      return longBreakTimeLabel;
    } else if (type == 'focus') {
      return focusTimeLabel;
    } else if (type == 'break') {
      return breakTimeLabel;
    }
    return "error";
  }


  List<SessionVariablePlanning> getList(
      int defaultSessionsPerRound, // multiply by 60 so to display you have to divide by 60
      int defaultLongBreakTime,
      int defaultBreakTime,
      defaultFocusTime) {
    List<SessionVariablePlanning> list = [];
    for (int i = 1; i < (defaultSessionsPerRound * 2) + 1; i++) {
      if ((i % 2) == 0 && (i % 8) == 0) {
        list.add(SessionVariablePlanning(
            "longbreak", defaultLongBreakTime * 60, null));
      } else if ((i % 2) == 0) {
        list.add(SessionVariablePlanning("break", defaultBreakTime * 60, null));
      } else if ((i % 2) != 0) {
        list.add(SessionVariablePlanning("focus", defaultFocusTime * 60, null));
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
  int plannedDuration;
  DateTime? expFinishTime;
  SubjectData? subject;
}
