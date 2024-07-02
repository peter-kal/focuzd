import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:focuzd/blocs/pomodoro_bloc/pomodoro_bloc.dart';

class CountDownWidget extends StatelessWidget {
  const CountDownWidget(
      {super.key, required this.endTimeGiven, required this.state});
  final DateTime endTimeGiven;
  final PomodoroState state;

  @override
  Widget build(BuildContext context) {
    return TimerCountdown(
      timeTextStyle: const TextStyle(fontSize: 40),
      enableDescriptions: false,
      format: CountDownTimerFormat.minutesSeconds,
      endTime: endTimeGiven,
      onEnd: () {
        BlocProvider.of<PomodoroBloc>(context).add(Next(stateGiven: state));
      },
      onTick: (remainingTime) {
        BlocProvider.of<PomodoroBloc>(context)
            .add(UpdateRemainingTime(remainingTime: remainingTime));
      },
    );
  }
}

// needs polishing so it would be identical with the countdown
class TimeToCountdownWidget extends StatelessWidget {
  const TimeToCountdownWidget({super.key, required this.selectedDuration});
  final Duration selectedDuration;
  @override
  Widget build(BuildContext context) {
    return Text("$selectedDuration");
  }
}
