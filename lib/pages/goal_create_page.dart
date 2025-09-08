import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/data/app_db.dart';

import 'package:focuzd/data/repo.dart';
import 'package:yaru/yaru.dart';

class GoalCreatePage extends StatefulWidget {
  const GoalCreatePage({super.key});

  @override
  State<GoalCreatePage> createState() => _GoalCreatePageState();
}

class _GoalCreatePageState extends State<GoalCreatePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RepoBloc, RepoState>(listener: (context, state) {
      if (state is EmitStateWithDBVars) {
        // Handle the state if needed
        BlocProvider.of<PageNavigationBloc>(context)
            .add(const GoalsPageEvent());
      }
    }, builder: (context, state) {
      if (state is CreateGoalState) {
        var groupNum = state.makeable.type ?? 0;
        return Scaffold(
          appBar: YaruWindowTitleBar(
            title: Text("Set a goal"),
            leading: YaruIconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                BlocProvider.of<PageNavigationBloc>(context)
                    .add(const GoalsPageEvent());
              },
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              children: [
                ElevatedButton(
                  child: Text("Save"),
                  onPressed: () {
                    BlocProvider.of<RepoBloc>(context)
                        .add(SaveGoalToDB(goal: state.makeable));
                    BlocProvider.of<PageNavigationBloc>(context)
                        .add(GoalsPageEvent());
                  },
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 1,
                    maxLength: 25,
                    decoration: InputDecoration(
                      hintText: "Enter codename:",
                    ),
                    onChanged: (value) {
                      var newmakeable = state.makeable;
                      newmakeable.codeName = value;
                      BlocProvider.of<RepoBloc>(context)
                          .add(UpdateCreatingGoal(newMakeable: newmakeable));
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: YaruSection(
                    child: Column(children: [
                      YaruRadioListTile(
                          toggleable: true,
                          title: Text("type 1"),
                          subtitle: Text(
                              "Static goal of x session per y period of time."),
                          value: 1,
                          onChanged: (number) {
                            var newmakeable = state.makeable;
                            newmakeable.type = number;
                            BlocProvider.of<RepoBloc>(context).add(
                                UpdateCreatingGoal(newMakeable: newmakeable));
                          },
                          groupValue: groupNum),
                      YaruRadioListTile(
                          toggleable: true,
                          title: Text("type 2"),
                          subtitle: Text(
                              "Dialectic goal of x sessions per y period of time for x' ses per r, where r time period of ±y."),
                          value: 2,
                          onChanged: (number) {
                            var newmakeable = state.makeable;
                            newmakeable.type = number;
                            BlocProvider.of<RepoBloc>(context).add(
                                UpdateCreatingGoal(newMakeable: newmakeable));
                          },
                          groupValue: groupNum),
                      YaruRadioListTile(
                          toggleable: true,
                          title: Text("type 3"),
                          subtitle:
                              Text("Static goal of x sessions with z per y"),
                          value: 3,
                          onChanged: (number) {
                            var newmakeable = state.makeable;
                            newmakeable.type = number;
                            BlocProvider.of<RepoBloc>(context).add(
                                UpdateCreatingGoal(newMakeable: newmakeable));
                          },
                          groupValue: groupNum),
                      YaruRadioListTile(
                          toggleable: true,
                          title: Text("type4"),
                          subtitle: Text(
                              "Static goal of x with z per x' with f, on same y."),
                          value: 4,
                          onChanged: (number) {
                            var newmakeable = state.makeable;
                            newmakeable.type = number;
                            BlocProvider.of<RepoBloc>(context).add(
                                UpdateCreatingGoal(newMakeable: newmakeable));
                          },
                          groupValue: groupNum),
                      YaruRadioListTile(
                          toggleable: true,
                          title: Text("type 5"),
                          subtitle: Text(
                              "Dialectic goal of x with z per x' with z, on y and y-1."),
                          value: 5,
                          onChanged: (number) {
                            var newmakeable = state.makeable;
                            newmakeable.type = number;
                            BlocProvider.of<RepoBloc>(context).add(
                                UpdateCreatingGoal(newMakeable: newmakeable));
                          },
                          groupValue: groupNum),
                    ]),
                  ),
                ),
                SizedBox(height: 20),
                if (state.makeable.type != null)
                  if (state.makeable.type == 1)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: YaruSection(
                          child: Column(children: [
                        YaruDateTimeEntry(
                            force24HourFormat: true,
                            initialDateTime:
                                state.makeable.endPeriod2 ?? DateTime.now(),
                            firstDateTime: DateTime.now(),
                            lastDateTime:
                                DateTime.now().add(Duration(days: 2000)),
                            onChanged: (change) {
                              var newmakeable = state.makeable;
                              newmakeable.endPeriod2 = change;
                              BlocProvider.of<RepoBloc>(context).add(
                                  UpdateCreatingGoal(newMakeable: newmakeable));
                            }),
                        Text("Number of sessions in the "),
                        CartStepper(
                            size: 35,
                            style: CartStepperStyle(
                                activeBackgroundColor:
                                    Theme.of(context).primaryColor,
                                iconPlus: Icons.plus_one,
                                iconMinus: Icons.exposure_minus_1),
                            alwaysExpanded: true,
                            value: state.makeable.xSessionsGoal ?? 0,
                            didChangeCount: (count) {
                              var newmakeable = state.makeable;
                              newmakeable.xSessionsGoal = count;
                              BlocProvider.of<RepoBloc>(context).add(
                                  UpdateCreatingGoal(newMakeable: newmakeable));
                            })
                      ])),
                    ),
              ],
            ),
          ),
        );
      }
      // Return a default widget if state is not CreateSubjectState
      return const SizedBox.shrink();
    });
  }
}

Future<String> _getSubjectNamebyID(int id) async {
  var subjectRepo = SubjectRepository(AppDatabase.instance);
  var subject = await subjectRepo.fetchSubjectByID(id);
  return subject?.name ?? '';
}
