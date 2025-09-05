import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/extra_widgets/goal_card.dart';
import 'package:focuzd/extra_widgets/history_round_card.dart';
import 'package:yaru/widgets.dart';

class GoalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<RepoBloc, RepoState>(builder: (context, state) {
      if (state is RepoVariablesGivenState) {
        if (state.goals == null) {
          return Text("NO GOALS");
        } else {
          return ListView.builder(
              itemCount: state.goals!.length,
              itemBuilder: (context, index) {
                return SizedBox(
                    height: 125, child: GoalCard(state.goals![index]));
              });
        }
      } else {
        return YaruCircularProgressIndicator();
      }
    }));
  }
}
