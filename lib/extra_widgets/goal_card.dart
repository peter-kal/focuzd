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
          return Text("");
        }
      case 3:
        {
          return Text("");
        }
      case 4:
        {
          return Text("");
        }
      case 5:
        {
          return Text("");
        }
      default:
        {
          return Text("");
        }
    }
  }
}
