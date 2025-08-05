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
    return YaruExpandable(
      child: Text(""),
      header: Row(
        children: [
          Text(position.toString()),
          SizedBox(
            width: 75,
            child:
                Text(prototype.type.toString(), style: TextStyle(fontSize: 15)),
          ),
          VerticalDivider(),
          SizedBox(
            width: 25,
          ),
          SizedBox(
            width: 35,
            child: Text((prototype.plannedDuration / 60).toString(),
                style: TextStyle(
                    fontSize: 15,
                    color:
                        prototype.type == "work" ? Colors.red : Colors.green)),
          ),
          SizedBox(
            width: 25,
            child: Text("min"),
          ),
          SizedBox(
            width: 10,
          ),
          prototype.subject != null
              ? Text(prototype.subject!.name)
              : SizedBox(
                  width: 1,
                ),
          Text(DateFormat('HH:mm').format(prototype.expFinishTime!),
              style: TextStyle(color: Theme.of(context).primaryColor)),
          prototype.type == "work"
              ? PopupMenuButton<SubjectData>(
                  onSelected: (selectedItem) {
                    planlist[position].subject = selectedItem;

                    BlocProvider.of<PomodoroBloc>(context)
                        .add(ChangePlan(2, position, selectedItem));
                  },
                  itemBuilder: (context) => subjects.map((item) {
                    return PopupMenuItem<SubjectData>(
                        value: item, child: Text(item.name));
                  }).toList(),
                )
              : SizedBox(
                  width: 5,
                ),
          prototype.type == "work"
              ? FilledButton.icon(
                  label: Text("Delete"),
                  icon: Icon(YaruIcons.trash),
                  onPressed: () {
                    BlocProvider.of<PomodoroBloc>(context)
                        .add(ChangePlan(3, position));
                  },
                )
              : SizedBox(
                  width: 5,
                ),
        ],
      ),
    );
  }
}
