import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:focuzd/extra_widgets/session_tile_planning.dart';
import 'package:intl/intl.dart';
import 'package:yaru/yaru.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';

class RoundPlanningDialog extends StatelessWidget {
  const RoundPlanningDialog();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PomodoroBloc, PomodoroTimerState>(
      builder: (context, state) {
        if (state is RoundPlanning) {
          return AlertDialog(
            content: SizedBox(
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ListView.builder(
                itemCount: state.planlist.length,
                itemBuilder: (context, index) {
                  return SessionTilePlanning(state.planlist[index], index,
                      state.planlist, state.subjects);
                }, // Use widget.state instead of state
              ),
            ),
            actions: [
              Text(
                  "Ends on: ${DateFormat('HH:mm').format(state.expFinishRoundTime)}"),
              FilledButton(
                  onPressed: () {
                    BlocProvider.of<PomodoroBloc>(context).add(ChangePlan(1));
                  },
                  child: Text("Add Session")),
              ElevatedButton(
                  child: Text("Start"),
                  onPressed: () {
                    BlocProvider.of<PomodoroBloc>(context).add(StartRound());
                  })
            ],
            title: YaruDialogTitleBar(
              backgroundColor: Theme.of(context).primaryColor,
              isClosable: false,
              title: Text("Round Plan"),
            ),
          );
        } else {
          return YaruCircularProgressIndicator();
        }
      },
    );
  }
}
