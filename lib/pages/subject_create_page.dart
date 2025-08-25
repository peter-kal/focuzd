import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:focuzd/data/repo.dart';
import 'package:yaru/yaru.dart';

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
            title: Text("Create a Subject"),
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
                  },
                )
              ],
            ),
          ),
          body: ListView(
            children: [
              Text("Subject Name:"),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter subject name",
                ),
                onChanged: (value) {
                  BlocProvider.of<RepoBloc>(context)
                      .add(UpdateAddingSubject(1, 0, value));
                },
              ),
              YaruPopupMenuButton<SubjectData>(
                initialValue: null,
                onSelected: (selectedItem) {
                  BlocProvider.of<RepoBloc>(context)
                      .add(UpdateAddingSubject(2, selectedItem.id, ""));
                },
                child: Text(
                  state.makeable.name != "Add Name"
                      ? state.makeable.subid.toString()
                      : 'Select Subject',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                itemBuilder: (context) => state.subjects
                    .map((item) => PopupMenuItem<SubjectData>(
                          value: item,
                          child: Column(
                            children: [
                              Text(item!.name),
                              item.subjectid != null
                                  ? Text(
                                      "with child",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    )
                                  : SizedBox.shrink(),
                            ],
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
        );
      }
      // Return a default widget if state is not CreateSubjectState
      return const SizedBox.shrink();
    });
  }
}
