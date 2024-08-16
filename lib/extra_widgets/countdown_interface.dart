import 'package:flutter/material.dart';
import 'package:focuzd/blocs/pomodoro_bloc/pomodoro_bloc.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';
import 'package:yaru/yaru.dart';

class CountdownInterface extends StatelessWidget {
  const CountdownInterface({
    super.key,
    required this.minutesStr,
    required this.secondsStr,
    required this.duration,
    required this.selectedDuration,
    required this.runTimes,
    required this.state,
  });
  final String minutesStr;
  final String secondsStr;
  final int duration;
  final int selectedDuration;
  final int runTimes;
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
            valueColor: AlwaysStoppedAnimation((runTimes % 2 == 0)
                ? Colors.green
                : Theme.of(context).primaryColor),
            strokeWidth: 10,
            value: duration / selectedDuration,
          ),
        ),
        Column(
          children: [
            Text(
              "$minutesStr : $secondsStr",
              style: const TextStyle(fontSize: 40),
            ),
            Text(
                style: const TextStyle(fontWeight: FontWeight.w500),
                ExtraFunctions().endsOn(duration, state, DateTime.now())),
          ],
        ),
      ],
    );
  }
}
