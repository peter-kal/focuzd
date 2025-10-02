import 'package:cart_stepper/cart_stepper.dart';
import 'package:duration_spinbox/duration_spinbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:focuzd/data/repo.dart';
import 'package:yaru/yaru.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';

class SubjectCreatePage extends StatefulWidget {
  const SubjectCreatePage({super.key});

  @override
  State<SubjectCreatePage> createState() => _SubjectCreatePageState();
}

class _SubjectCreatePageState extends State<SubjectCreatePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RepoBloc, RepoState>(listener: (context, state) {
      if (state is EmitStateWithDBVars) {
        // Handle the state if needed
        BlocProvider.of<PageNavigationBloc>(context)
            .add(const SubjectsPageEvent());
      }
    }, builder: (context, state) {
      if (state is CreateSubjectState) {
        return Scaffold(
          appBar: YaruWindowTitleBar(
            title: Text("Add a Subject"),
            leading: YaruIconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                BlocProvider.of<PageNavigationBloc>(context)
                    .add(const SubjectsPageEvent());
              },
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              children: [
                ElevatedButton(
                  child: Text("Save"),
                  onPressed: () {
                    BlocProvider.of<RepoBloc>(context).add(AddSubjectToDB());
                    BlocProvider.of<PageNavigationBloc>(context)
                        .add(SubjectsPageEvent());
                  },
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text("Subject Name:"),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 3,
                    maxLength: 99,
                    decoration: InputDecoration(
                      hintText: "Enter subject name:",
                    ),
                    onChanged: (value) {
                      var makeable = state.makeable;
                      makeable.name = value;

                      BlocProvider.of<RepoBloc>(context)
                          .add(UpdateAddingSubject(newMakeable: makeable));
                    },
                  ),
                ),
                Text("Select super-subject:"),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 60,
                    child: YaruPopupMenuButton<SubjectData>(
                      mouseCursor: MouseCursor.uncontrolled,
                      position: PopupMenuPosition.over,
                      initialValue: null,
                      onSelected: (selectedItem) {
                        var makeable = state.makeable;
                        makeable.subid = selectedItem.id;

                        BlocProvider.of<RepoBloc>(context)
                            .add(UpdateAddingSubject(newMakeable: makeable));
                      },
                      child: state.makeable.subid != null
                          ? SizedBox(
                              width: 250,
                              child: FutureBuilder(
                                  future: _getSubjectNamebyID(
                                      state.makeable.subid!),
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
                  ),
                ),
                Text("Subject's Adress:"),
                Padding(
                    padding: EdgeInsetsGeometry.all(8.0),
                    child: YaruSection(child: Text(state.makeable.address!))),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Link another subject(optional)"),
                      YaruPopupMenuButton<SubjectData>(
                        mouseCursor: MouseCursor.uncontrolled,
                        position: PopupMenuPosition.over,
                        initialValue: null,
                        onSelected: (selectedItem) {
                          var makeable = state.makeable;
                          makeable.linkId = selectedItem.id;

                          BlocProvider.of<RepoBloc>(context)
                              .add(UpdateAddingSubject(newMakeable: makeable));
                        },
                        child: state.makeable.linkId != null
                            ? SizedBox(
                                width: 250,
                                child: FutureBuilder(
                                    future: _getSubjectNamebyID(
                                        state.makeable.linkId!),
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
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsetsGeometry.all(8),
                    child: YaruSection(
                      child: Column(children: [
                        Text("Already Focused Time (min):"),
                        SpinBox(
                            min: 0,
                            step: 10,
                            max: 1000000,
                            value: state.makeable.alreadyDoneTime != null
                                ? (state.makeable.alreadyDoneTime! / 60)
                                : 0,
                            onChanged: (count) {
                              var newmakeable = state.makeable;
                              newmakeable.alreadyDoneTime =
                                  (count * 60).toInt();
                              BlocProvider.of<RepoBloc>(context).add(
                                  UpdateAddingSubject(
                                      newMakeable: newmakeable));
                            })
                      ]),
                    )),
                Padding(
                    padding: EdgeInsetsGeometry.all(8),
                    child: Column(children: <Widget>[
                      YaruSwitchListTile(
                        title: Text("Optional Subject Duration"),
                        subtitle: Text("Optional Subject Duration"),
                        value: state.makeable.optionalTimes!,
                        onChanged: (value) {
                          var makeable = state.makeable;
                          makeable.optionalTimes = value;
                          makeable.durationOrigin = DurationOrigin.manual;
                          BlocProvider.of<RepoBloc>(context)
                              .add(UpdateAddingSubject(newMakeable: makeable));
                        },
                      ),
                      Visibility(
                          visible: state.makeable.optionalTimes ==
                              true, // Explicit comparison
                          child: Column(children: [
                            DurationSpinbox(
                              onChanged: (value) {
                                var makeable = state.makeable;
                                makeable.optionalFocusTime = value.inSeconds;
                                BlocProvider.of<RepoBloc>(context).add(
                                    UpdateAddingSubject(newMakeable: makeable));
                              },
                              value: Duration(
                                  seconds: state.makeable.optionalFocusTime ??
                                      25 * 60),
                            ),
                            DurationSpinbox(
                              onChanged: (value) {
                                print("passing $value");
                                var makeable = state.makeable;
                                makeable.durationOrigin = DurationOrigin.manual;
                                makeable.optionalBreakTime = value.inSeconds;
                                BlocProvider.of<RepoBloc>(context).add(
                                    UpdateAddingSubject(newMakeable: makeable));
                              },
                              value: Duration(
                                  seconds: state.makeable.optionalBreakTime ??
                                      5 * 60),
                            ),
                          ]))
                    ]))
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

Future<String> _getSubjectNamebyID(String id) async {
  var subjectRepo = SubjectRepository(AppDatabase.instance);
  var subject = await subjectRepo.fetchSubjectByID(id);
  return subject?.name ?? '';
}
