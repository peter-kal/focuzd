import 'package:flutter/material.dart';
import 'package:focuzd/blocs/pomodoro_bloc/pomodoro_bloc.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';
import 'package:yaru/yaru.dart';

class CountdownInterface extends StatelessWidget with ExtraFunctions {
  const CountdownInterface({
    super.key,
    required this.minutesStr,
    required this.secondsStr,
    required this.duration,
    required this.selectedDuration,
    required this.runTimes,
    required this.state,
    required this.type,
    this.hoursStr,
  });
  final String minutesStr;
  final String secondsStr;
  final hoursStr;
  final int duration;
  final int selectedDuration;
  final int runTimes;
  final String type;
  final PomodoroTimerState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        SizedBox(
          height: 250,
          width: 250,
          child: YaruCircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
                (type == 'break' || type == 'longbreak')
                    ? Colors.green
                    : Theme.of(context).primaryColor),
            strokeWidth: 10,
            value: duration / selectedDuration,
          ),
        ),
        Column(
          children: [
            Text(
              hoursStr == null
                  ? "$minutesStr : $secondsStr"
                  : "$hoursStr : $minutesStr : $secondsStr",
              style: const TextStyle(fontSize: 40),
            ),
            Text(
                style: const TextStyle(fontWeight: FontWeight.w500),
                endsOn(duration, state, DateTime.now())),
          ],
        ),
      ],
    );
  }
}
