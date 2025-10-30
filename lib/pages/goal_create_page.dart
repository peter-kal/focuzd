import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
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
                  BlocProvider.of<RepoBloc>(context).add(EmitStateWithDBVars());
                },
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                children: [
                  ElevatedButton(
                    child: Text("Save"),
                    onPressed: () {
                      if (state.nonContradictory == true &&
                          state.makeable.codeName != null) {
                        BlocProvider.of<RepoBloc>(context)
                            .add(SaveGoalToDB(goal: state.makeable));
                        BlocProvider.of<PageNavigationBloc>(context)
                            .add(GoalsPageEvent());
                      } else {
                        null;
                      }
                    },
                  ),
                  SizedBox.shrink(),
                  if (state.contradictions != null &&
                      state.contradictions!.isNotEmpty == true)
                    Column(children: [
                      Text(state.contradictions!.first.reason),
                      Text(state.contradictions!.first.suggestedFix),
                    ]),
                ],
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(children: [
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
                                  state.makeable.startPeriod2 ?? DateTime.now(),
                              firstDateTime: DateTime.now(),
                              lastDateTime:
                                  DateTime.now().add(Duration(days: 2000)),
                              onChanged: (change) {
                                var newmakeable = state.makeable;
                                newmakeable.startPeriod2 = change;
                                BlocProvider.of<RepoBloc>(context).add(
                                    UpdateCreatingGoal(
                                        newMakeable: newmakeable));
                              }),
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
                                    UpdateCreatingGoal(
                                        newMakeable: newmakeable));
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
                                    UpdateCreatingGoal(
                                        newMakeable: newmakeable));
                              })
                        ])),
                      ),
                  if (state.makeable.type == 2)
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(children: [
                        YaruSection(
                          child: Column(
                            children: [
                              Text("past time period"),
                              YaruDateTimeEntry(
                                  force24HourFormat: true,
                                  initialDateTime:
                                      state.makeable.startPeriod1 ??
                                          DateTime.now(),
                                  firstDateTime: DateTime.now(),
                                  lastDateTime:
                                      DateTime.now().add(Duration(days: 2000)),
                                  onChanged: (change) {
                                    var newmakeable = state.makeable;
                                    newmakeable.startPeriod1 = change;
                                    BlocProvider.of<RepoBloc>(context).add(
                                        UpdateCreatingGoal(
                                            newMakeable: newmakeable));
                                  }),
                              YaruDateTimeEntry(
                                  force24HourFormat: true,
                                  initialDateTime: state.makeable.endPeriod1 ??
                                      DateTime.now(),
                                  firstDateTime: DateTime.now(),
                                  lastDateTime:
                                      DateTime.now().add(Duration(days: 2000)),
                                  onChanged: (change) {
                                    var newmakeable = state.makeable;
                                    newmakeable.endPeriod1 = change;
                                    BlocProvider.of<RepoBloc>(context).add(
                                        UpdateCreatingGoal(
                                            newMakeable: newmakeable));
                                  }),
                              Text(state.makeable.xSessionsR.toString())
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        YaruSection(
                          child: Column(
                            children: [
                              Text("future time period"),
                              YaruDateTimeEntry(
                                  force24HourFormat: true,
                                  initialDateTime:
                                      state.makeable.startPeriod2 ??
                                          DateTime.now(),
                                  firstDateTime: DateTime.now(),
                                  lastDateTime:
                                      DateTime.now().add(Duration(days: 2000)),
                                  onChanged: (change) {
                                    var newmakeable = state.makeable;
                                    newmakeable.startPeriod2 = change;
                                    BlocProvider.of<RepoBloc>(context).add(
                                        UpdateCreatingGoal(
                                            newMakeable: newmakeable));
                                  }),
                              YaruDateTimeEntry(
                                  force24HourFormat: true,
                                  initialDateTime: state.makeable.endPeriod2 ??
                                      DateTime.now(),
                                  firstDateTime: DateTime.now(),
                                  lastDateTime:
                                      DateTime.now().add(Duration(days: 2000)),
                                  onChanged: (change) {
                                    var newmakeable = state.makeable;
                                    newmakeable.endPeriod2 = change;
                                    BlocProvider.of<RepoBloc>(context).add(
                                        UpdateCreatingGoal(
                                            newMakeable: newmakeable));
                                  }),
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
                                        UpdateCreatingGoal(
                                            newMakeable: newmakeable));
                                  }),
                              Text(state.makeable.plannedRatio.toString())
                            ],
                          ),
                        ),
                      ]),
                    ),
                  if (state.makeable.type == 3)
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: YaruSection(
                            child: Column(children: [
                          YaruDateTimeEntry(
                              force24HourFormat: true,
                              initialDateTime:
                                  state.makeable.startPeriod2 ?? DateTime.now(),
                              firstDateTime: DateTime.now(),
                              lastDateTime:
                                  DateTime.now().add(Duration(days: 2000)),
                              onChanged: (change) {
                                var newmakeable = state.makeable;
                                newmakeable.startPeriod2 = change;
                                BlocProvider.of<RepoBloc>(context).add(
                                    UpdateCreatingGoal(
                                        newMakeable: newmakeable));
                              }),
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
                                    UpdateCreatingGoal(
                                        newMakeable: newmakeable));
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
                                    UpdateCreatingGoal(
                                        newMakeable: newmakeable));
                              }),
                          YaruPopupMenuButton<SubjectData>(
                            mouseCursor: MouseCursor.uncontrolled,
                            position: PopupMenuPosition.over,
                            initialValue: null,
                            onSelected: (selectedItem) {
                              var makeable = state.makeable;
                              makeable.subjectIdZ = selectedItem.id;

                              BlocProvider.of<RepoBloc>(context).add(
                                  UpdateCreatingGoal(newMakeable: makeable));
                            },
                            child: state.makeable.subjectIdZ != null
                                ? SizedBox(
                                    width: 250,
                                    child: FutureBuilder(
                                        future: _getSubjectNamebyID(
                                            state.makeable.subjectIdZ!),
                                        builder: (context, asyncSnapshot) {
                                          if (asyncSnapshot.connectionState ==
                                              ConnectionState.done) {
                                            return Text(
                                              asyncSnapshot.data!,
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                            );
                                          } else {
                                            return Text("...");
                                          }
                                        }),
                                  )
                                : Text('Select Subject'),
                            itemBuilder: (context) => state.subjects
                                .map((item) => PopupMenuItem<SubjectData>(
                                      mouseCursor: MouseCursor.uncontrolled,
                                      value: item,
                                      child: Column(
                                        children: [
                                          YaruTile(
                                            title: Text(
                                              item!.name,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            subtitle: Text(
                                              item.address,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        ]))),
                  if (state.makeable.type == 4)
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: YaruSection(
                            child: Column(children: [
                          Text("From: "),
                          YaruDateTimeEntry(
                              force24HourFormat: true,
                              initialDateTime:
                                  state.makeable.endPeriod2 ?? DateTime.now(),
                              firstDateTime: DateTime.now(),
                              lastDateTime:
                                  DateTime.now().add(Duration(days: 2000)),
                              onChanged: (change) {
                                var newmakeable = state.makeable;
                                newmakeable.startPeriod2 = change;
                                BlocProvider.of<RepoBloc>(context).add(
                                    UpdateCreatingGoal(
                                        newMakeable: newmakeable));
                              }),
                          Text("to:"),
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
                                    UpdateCreatingGoal(
                                        newMakeable: newmakeable));
                              }),
                          Text("sessions: "),
                          Text("1"),
                          YaruPopupMenuButton<SubjectData>(
                            mouseCursor: MouseCursor.uncontrolled,
                            position: PopupMenuPosition.over,
                            initialValue: null,
                            onSelected: (selectedItem) {
                              var makeable = state.makeable;
                              makeable.subjectIdZ = selectedItem.id;

                              BlocProvider.of<RepoBloc>(context).add(
                                  UpdateCreatingGoal(newMakeable: makeable));
                            },
                            child: state.makeable.subjectIdZ != null
                                ? SizedBox(
                                    width: 250,
                                    child: FutureBuilder(
                                        future: _getSubjectNamebyID(
                                            state.makeable.subjectIdZ!),
                                        builder: (context, asyncSnapshot) {
                                          if (asyncSnapshot.connectionState ==
                                              ConnectionState.done) {
                                            return Text(
                                              asyncSnapshot.data!,
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                            );
                                          } else {
                                            return Text("...");
                                          }
                                        }),
                                  )
                                : Text('Select Subject'),
                            itemBuilder: (context) => state.subjects
                                .map((item) => PopupMenuItem<SubjectData>(
                                      mouseCursor: MouseCursor.uncontrolled,
                                      value: item,
                                      child: Column(
                                        children: [
                                          YaruTile(
                                            title: Text(
                                              item!.name,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            subtitle: Text(
                                              item.address,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                          YaruPopupMenuButton<SubjectData>(
                            mouseCursor: MouseCursor.uncontrolled,
                            position: PopupMenuPosition.over,
                            initialValue: null,
                            onSelected: (selectedItem) {
                              var makeable = state.makeable;
                              makeable.subjectIdF = selectedItem.id;

                              BlocProvider.of<RepoBloc>(context).add(
                                  UpdateCreatingGoal(newMakeable: makeable));
                            },
                            child: state.makeable.subjectIdF != null
                                ? SizedBox(
                                    width: 250,
                                    child: FutureBuilder(
                                        future: _getSubjectNamebyID(
                                            state.makeable.subjectIdF!),
                                        builder: (context, asyncSnapshot) {
                                          if (asyncSnapshot.connectionState ==
                                              ConnectionState.done) {
                                            return Text(
                                              asyncSnapshot.data!,
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                            );
                                          } else {
                                            return Text("...");
                                          }
                                        }),
                                  )
                                : Text('Select Subject'),
                            itemBuilder: (context) => state.subjects
                                .map((item) => PopupMenuItem<SubjectData>(
                                      mouseCursor: MouseCursor.uncontrolled,
                                      value: item,
                                      child: Column(
                                        children: [
                                          YaruTile(
                                            title: Text(
                                              item!.name,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            subtitle: Text(
                                              item.address,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                          Text("per sessions: "),
                          SpinBox(
                              step: 0.1,
                              decimals: 1,
                              value: state.makeable.subjectFdenominator ?? 0,
                              onChanged: (count) {
                                var newmakeable = state.makeable;
                                newmakeable.subjectFdenominator = count;
                                BlocProvider.of<RepoBloc>(context).add(
                                    UpdateCreatingGoal(
                                        newMakeable: newmakeable));
                              }),
                        ]))),
                  if (state.makeable.type == 5)
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(children: [
                        YaruPopupMenuButton<SubjectData>(
                          mouseCursor: MouseCursor.uncontrolled,
                          position: PopupMenuPosition.over,
                          initialValue: null,
                          onSelected: (selectedItem) {
                            var makeable = state.makeable;
                            makeable.subjectIdZ = selectedItem.id;

                            BlocProvider.of<RepoBloc>(context)
                                .add(UpdateCreatingGoal(newMakeable: makeable));
                          },
                          child: state.makeable.subjectIdZ != null
                              ? SizedBox(
                                  width: 250,
                                  child: FutureBuilder(
                                      future: _getSubjectNamebyID(
                                          state.makeable.subjectIdZ!),
                                      builder: (context, asyncSnapshot) {
                                        if (asyncSnapshot.connectionState ==
                                            ConnectionState.done) {
                                          return Text(
                                            asyncSnapshot.data!,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                          );
                                        } else {
                                          return Text("...");
                                        }
                                      }),
                                )
                              : Text('Select Subject'),
                          itemBuilder: (context) => state.subjects
                              .map((item) => PopupMenuItem<SubjectData>(
                                    mouseCursor: MouseCursor.uncontrolled,
                                    value: item,
                                    child: Column(
                                      children: [
                                        YaruTile(
                                          title: Text(
                                            item!.name,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          subtitle: Text(
                                            item.address,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                        YaruSection(
                          child: Column(
                            children: [
                              Text("past time period"),
                              YaruDateTimeEntry(
                                  force24HourFormat: true,
                                  initialDateTime:
                                      state.makeable.startPeriod1 ??
                                          DateTime.now(),
                                  firstDateTime: DateTime.now(),
                                  lastDateTime:
                                      DateTime.now().add(Duration(days: 2000)),
                                  onChanged: (change) {
                                    var newmakeable = state.makeable;
                                    newmakeable.startPeriod1 = change;
                                    BlocProvider.of<RepoBloc>(context).add(
                                        UpdateCreatingGoal(
                                            newMakeable: newmakeable));
                                  }),
                              YaruDateTimeEntry(
                                  force24HourFormat: true,
                                  initialDateTime: state.makeable.endPeriod1 ??
                                      DateTime.now(),
                                  firstDateTime: DateTime.now(),
                                  lastDateTime:
                                      DateTime.now().add(Duration(days: 2000)),
                                  onChanged: (change) {
                                    var newmakeable = state.makeable;
                                    newmakeable.endPeriod1 = change;
                                    BlocProvider.of<RepoBloc>(context).add(
                                        UpdateCreatingGoal(
                                            newMakeable: newmakeable));
                                  }),
                              Text(state.makeable.xSessionsR.toString())
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        YaruSection(
                          child: Column(
                            children: [
                              Text("future time period"),
                              YaruDateTimeEntry(
                                  force24HourFormat: true,
                                  initialDateTime:
                                      state.makeable.startPeriod2 ??
                                          DateTime.now(),
                                  firstDateTime: DateTime.now(),
                                  lastDateTime:
                                      DateTime.now().add(Duration(days: 2000)),
                                  onChanged: (change) {
                                    var newmakeable = state.makeable;
                                    newmakeable.startPeriod2 = change;
                                    BlocProvider.of<RepoBloc>(context).add(
                                        UpdateCreatingGoal(
                                            newMakeable: newmakeable));
                                  }),
                              YaruDateTimeEntry(
                                  force24HourFormat: true,
                                  initialDateTime: state.makeable.endPeriod2 ??
                                      DateTime.now(),
                                  firstDateTime: DateTime.now(),
                                  lastDateTime:
                                      DateTime.now().add(Duration(days: 2000)),
                                  onChanged: (change) {
                                    var newmakeable = state.makeable;
                                    newmakeable.endPeriod2 = change;
                                    BlocProvider.of<RepoBloc>(context).add(
                                        UpdateCreatingGoal(
                                            newMakeable: newmakeable));
                                  }),
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
                                        UpdateCreatingGoal(
                                            newMakeable: newmakeable));
                                  }),
                              Text(state.makeable.plannedRatio.toString())
                            ],
                          ),
                        ),
                      ]),
                    ),
                ])));
      }
      // Return a default widget if state is not CreateSubjectState
      return const SizedBox.shrink();
    });
  }
}

Future<String> _getSubjectNamebyID(String id) async {
  var subjectRepo = SubjectRepository(AppDatabase.instance);
  var subject = await subjectRepo.fetchSubjectByID(id);
  return subject?.name ?? '';
}
