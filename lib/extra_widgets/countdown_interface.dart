import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class CountdownInterface extends StatelessWidget {
  const CountdownInterface({
    super.key,
    required this.minutesStr,
    required this.secondsStr,
    required this.duration,
    required this.selectedDuration,
    required this.runTimes,
  });
  final String minutesStr;
  final String secondsStr;
  final int duration;
  final int selectedDuration;
  final int runTimes;

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
        Text(
          "$minutesStr : $secondsStr",
          style: const TextStyle(fontSize: 40),
        ),
      ],
    );
  }
}
