import 'package:flutter/material.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:yaru/yaru.dart';

class GoalCard extends StatelessWidget {
  const GoalCard(this.id, {super.key});
  final GoalData id;

  @override
  Widget build(BuildContext context) {
    switch (id.type) {
      case 1:
        {
          return Card(
              child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(id.endPeriod2
                        .difference(DateTime.now())
                        .inDays
                        .toString()),
                  ),
                  CircleAvatar(
                      radius: 15,
                      backgroundColor: getSuccessColor(id.successPercentage),
                      child: Text(id.successPercentage.round().toString())),
                ],
              ),
            ),
            VerticalDivider(),
            Column(children: [
              Text(id.codeName),
              Container(
                width: 190,
                height: 60,
                child: Center(
                  child: Card(
                      child: Row(children: [
                    Text(
                        id.ySessionsDone
                            .toString(), // in the goals creating phase this will be defaulted to 0
                        style: TextStyle(fontSize: 20)),
                    Text(" / ", style: TextStyle(fontSize: 20)),
                    Text(id.xSessionsGoal.toString(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20)),
                  ])),
                ),
              )
            ])
          ]));
        }
      case 2:
        {
          return Card(
              child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(id.endPeriod2
                        .difference(DateTime.now())
                        .inDays
                        .toString()),
                  ),
                  CircleAvatar(
                      radius: 15,
                      backgroundColor: id.successPercentage < 30
                          ? YaruColors.adwaitaRed
                          : id.successPercentage < 60
                              ? YaruColors.adwaitaOrange
                              : id.successPercentage < 75
                                  ? Colors.greenAccent
                                  : id.successPercentage > 95
                                      ? Colors.green
                                      : Colors.green,
                      child: Text(id.successPercentage.round().toString())),
                ],
              ),
            ),
            VerticalDivider(),
            Column(children: [
              Text(id.codeName),
              Container(
                width: 190,
                height: 60,
                child: Center(
                  child: Card(
                      child: Row(children: [
                    Text(
                        id.ySessionsDone
                            .toString(), // in the goals creating phase this will be defaulted to 0
                        style: TextStyle(fontSize: 20)),
                    Text(" / ", style: TextStyle(fontSize: 20)),
                    Text(id.xSessionsGoal.toString(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20)),
                  ])),
                ),
              ),
              Text("${id.xSessionsR} --> ${id.xSessionsGoal}"),
              Text(id.plannedRatio.toString() + " " + id.realRatio.toString())
            ])
          ]));
        }
      case 3:
        {
          return Card(
              child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(id.endPeriod2
                        .difference(DateTime.now())
                        .inDays
                        .toString()),
                  ),
                  CircleAvatar(
                      radius: 15,
                      backgroundColor: getSuccessColor(id.successPercentage),
                      child: Text(id.successPercentage.round().toString())),
                ],
              ),
            ),
            VerticalDivider(),
            Column(children: [
              Text(id.codeName),
              Text(id.subjectIdZ!),
              Container(
                width: 190,
                height: 60,
                child: Center(
                  child: Card(
                      child: Row(children: [
                    Text(
                        id.ySessionsDone
                            .toString(), // in the goals creating phase this will be defaulted to 0
                        style: TextStyle(fontSize: 20)),
                    Text(" / ", style: TextStyle(fontSize: 20)),
                    Text(id.xSessionsGoal.toString(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20)),
                  ])),
                ),
              )
            ])
          ]));
        }
      case 4:
        {
          return Card(
              child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(id.endPeriod2
                        .difference(DateTime.now())
                        .inDays
                        .toString()),
                  ),
                  CircleAvatar(
                      radius: 15,
                      backgroundColor: id.realRatio == id.plannedRatio
                          ? Colors.green
                          : Colors.red,
                      child: Text("")),
                ],
              ),
            ),
            VerticalDivider(),
            Column(children: [
              Text(id.codeName),
              Text(id.subjectIdZ!),
              Container(
                width: 190,
                height: 60,
                child: Center(
                  child: Card(
                      child: Row(children: [
                    Text(
                        id.xSessionsZ
                            .toString(), // in the goals creating phase this will be defaulted to 0
                        style: TextStyle(fontSize: 20)),
                    Text(" / ", style: TextStyle(fontSize: 20)),
                    Text(id.xSessionsF.toString(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20)),
                  ])),
                ),
              ),
              Text("${id.subjectZNominator} z <-> ${id.subjectFDenominator} f"),
              Text(
                  "planned: ${id.plannedRatio.toString()}  real:${id.realRatio.toString()}")
            ])
          ]));
        }
      case 5:
        {
          return Card(
              child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(id.endPeriod2
                        .difference(DateTime.now())
                        .inDays
                        .toString()),
                  ),
                  CircleAvatar(
                      radius: 15,
                      backgroundColor: id.successPercentage < 30
                          ? YaruColors.adwaitaRed
                          : id.successPercentage < 60
                              ? YaruColors.adwaitaOrange
                              : id.successPercentage < 75
                                  ? Colors.greenAccent
                                  : id.successPercentage > 95
                                      ? Colors.green
                                      : Colors.green,
                      child: Text(id.successPercentage.round().toString())),
                ],
              ),
            ),
            VerticalDivider(),
            Column(children: [
              Text(id.codeName),
              Text(id.subjectIdZ!),
              Container(
                width: 190,
                height: 60,
                child: Center(
                  child: Card(
                      child: Row(children: [
                    Text(
                        id.ySessionsDone
                            .toString(), // in the goals creating phase this will be defaulted to 0
                        style: TextStyle(fontSize: 20)),
                    Text(" / ", style: TextStyle(fontSize: 20)),
                    Text(id.xSessionsGoal.toString(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20)),
                  ])),
                ),
              ),
              Text("${id.xSessionsR} --> ${id.xSessionsGoal}"),
              Text(id.plannedRatio.toString() + " " + id.realRatio.toString())
            ])
          ]));
        }
      default:
        {
          return Text("");
        }
    }
  }
}

Color getSuccessColor(double percentage) {
  if (percentage < 30) return YaruColors.adwaitaRed;
  if (percentage < 60) return YaruColors.adwaitaOrange;
  if (percentage < 75) return Colors.greenAccent;
  return Colors.green;
}
