import 'package:flutter/material.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';
import 'package:path/path.dart';
import 'package:yaru/widgets.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaru/yaru.dart';

import 'package:intl/intl.dart';

class SessionTilePlanning extends StatelessWidget {
  const SessionTilePlanning(
      this.prototype, this.position, this.planlist, this.subjects);
  final SessionVariablePlanning prototype;
  final List<SessionVariablePlanning> planlist;
  final int position;
  final List<SubjectData> subjects;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: (prototype.type == "break" || prototype.type == "longbreak")
          ? Colors.green
          : Theme.of(context).primaryColor,
      child: Row(
        children: [
          Text(prototype.type.toString()),
          SizedBox(
            width: 10,
          ),
          Text((prototype.plannedDuration / 60).toString()),
          YaruIconButton(
            icon: Icon(YaruIcons.trash),
            onPressed: () {
              planlist.removeAt(position);
              BlocProvider.of<PomodoroBloc>(context).add(ChangePlan(planlist));
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(DateFormat('HH:mm').format(prototype.expFinishTime!)),
          prototype.type == "work"
              ? PopupMenuButton<SubjectData>(
                  onSelected: (selectedItem) {
                    planlist[position].subject = selectedItem;

                    BlocProvider.of<PomodoroBloc>(context)
                        .add(ChangePlan(planlist));
                  },
                  itemBuilder: (context) => subjects.map((item) {
                    return PopupMenuItem<SubjectData>(
                        value: item, child: Text(item.name));
                  }).toList(),
                )
              : SizedBox(
                  width: 5,
                ),
        ],
      ),
    );
  }
}
