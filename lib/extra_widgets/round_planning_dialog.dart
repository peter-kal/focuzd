import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:yaru/yaru.dart';

class RoundPlanningDialog extends StatelessWidget {
  const RoundPlanningDialog();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [],
      ),
      actions: [
        OutlinedButton(
            onPressed: () {
              BlocProvider.of<PomodoroBloc>(context).add(TimerInit());
            },
            child: Text("Cancel")),
        FilledButton(
            child: Text("Start"),
            onPressed: () {
              BlocProvider.of<PomodoroBloc>(context).add(StartRound());
            })
      ],
      title: YaruDialogTitleBar(
        title: Text("Round Plan"),
      ),
    );
  }
}
