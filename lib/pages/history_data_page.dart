import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/extra_widgets/history_round_card.dart';
import 'package:yaru/widgets.dart';

class HistoryDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<RepoBloc, RepoState>(builder: (context, state) {
      if (state is RepoVariablesGivenState) {
        return ListView.builder(
            itemCount: state.roundsandsessions?.length ?? 0,
            itemBuilder: (context, index) {
              return HistoryRoundCard(
                givenList: state.roundsandsessions![index],
              );
            });
      } else {
        return YaruCircularProgressIndicator();
      }
    }));
  }
}
