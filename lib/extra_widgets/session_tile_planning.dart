import 'package:duration_spinbox/duration_spinbox.dart';
import 'package:flutter/material.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';
import 'package:focuzd/l10n/app_localizations.dart';
import 'package:path/path.dart';
import 'package:yaru/widgets.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaru/yaru.dart';

import 'package:intl/intl.dart';

class SessionTilePlanning extends StatelessWidget {
  const SessionTilePlanning(
      this.prototype, this.position, this.planlist, this.subjects, {super.key});
  final SessionVariablePlanning prototype;
  final List<SessionVariablePlanning> planlist;
  final int position;
  final List<SubjectData> subjects;

  @override
  Widget build(BuildContext context) {
    return YaruExpandable(
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
              SizedBox(
                width: 35,
                child: Text((prototype.plannedDuration / 60).round().toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:
                            prototype.type == "work" ? Theme.of(context).primaryColor : Colors.green)),
              ),
              SizedBox(
                width: 10,
              ),
              prototype.subject != null
                  ? Text(prototype.subject!.name)
                  : SizedBox.shrink(),
            ],
          ),
          SizedBox(
            width: 75,
            child: Row(
              children: [
                Text(DateFormat('HH:mm').format(prototype.expFinishTime!),
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                prototype.type == "work"
                    ? YaruIconButton(
                        icon: Icon(YaruIcons.trash),
                        tooltip: AppLocalizations.of(context)!.deleteSessionTooltip,
                        onPressed: () {
                          BlocProvider.of<PomodoroBloc>(context)
                              .add(ChangePlan(3, position));
                        },
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          
        ],
      ),
      child: Column(
        children: [
          Text("${AppLocalizations.of(context)!.changeDurationLabel}:"),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DurationSpinbox(value: Duration(seconds: prototype.plannedDuration),onChanged: (value) {
              BlocProvider.of<PomodoroBloc>(context)
                  .add(ChangePlan(5, position, null, value.inSeconds)); 
            }, ),
          ),
          prototype.type == 'work'
          ? Column(
            children: [
              Text("${AppLocalizations.of(context)!.selectSubjectLabel}:"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: YaruPopupMenuButton<SubjectData>(
                            initialValue: prototype.subject,
                            onSelected: (selectedItem) {
                planlist[position].subject = selectedItem;
                BlocProvider.of<PomodoroBloc>(context)
                    .add(ChangePlan(2, position, selectedItem));
                            },
                            child: Text(
                prototype.subject?.name ?? 'Select Subject',
                style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            itemBuilder: (context) => subjects
                  .map((item) => PopupMenuItem<SubjectData>(
                        value: item,
                        child: Text(item.name),
                      ))
                  .toList(),
                          ),
              ),
            ],
          )
          
          : SizedBox.shrink(),

        ],
      ),
    );
  }
}
