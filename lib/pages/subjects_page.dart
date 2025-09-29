import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fancy_tree_view2/flutter_fancy_tree_view2.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';
import 'package:focuzd/extra_widgets/subject_tree_node.dart';

import 'package:focuzd/l10n/app_localizations.dart';
import 'package:yaru/yaru.dart';
import 'package:focuzd/l10n/app_localizations.dart' as l10n;

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

// TASK: make settings
class _SubjectsPageState extends State<SubjectsPage> with ExtraFunctions {
  int pixelSize = 0;
  double getTheSize(int size) {
    if (size < 30) {
      return 90;
    } else if (size < 60 && size > 30) {
      return 100;
    } else if (size > 60 && size < 100) {
      return 110;
    } else
      return 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoBloc, RepoState>(
      builder: (context, state) {
        if (state is RepoVariablesGivenState) {
          final treeController = TreeController<SubjectTreeNode>(
            roots: state.subjectTree!,
            defaultExpansionState: false,
            childrenProvider: (SubjectTreeNode node) => node.children,
          );
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: AnimatedTreeView<SubjectTreeNode>(
                  treeController: treeController,
                  nodeBuilder: (context, entry) {
                    return SizedBox(
                      height: getTheSize(entry.node.title.length),
                      child: Card(
                        child: TreeIndentation(
                          guide: IndentGuide.connectingLines(
                            indent: 6,
                          ),
                          entry: entry,
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  treeController.toggleExpansion(entry.node);
                                },
                                child: CircleAvatar(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    radius: 18,
                                    child: Text(
                                        entry.node.subSubjects.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    InkWell(
                                      onTap: () {
                                        BlocProvider.of<PageNavigationBloc>(
                                                context)
                                            .add(SubjectPageEvent(
                                                subject: entry.node.subject));
                                      },
                                      child: Text(
                                        entry.node.title,
                                        maxLines: 3,
                                        softWrap: true,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    entry.node.optionalFocusTime != null
                                        ? SizedBox(
                                            width: 60,
                                            height: 25,
                                            child: Row(children: [
                                              Text(minutesString(entry
                                                      .node.optionalFocusTime ??
                                                  0)),
                                              SizedBox(width: 4),
                                              Text(minutesString(entry
                                                      .node.optionalBreakTime ??
                                                  0))
                                            ]),
                                          )
                                        : SizedBox.shrink(),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2,
                                      ),
                                      decoration: BoxDecoration(
                                          border: BoxBorder.all(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadiusGeometry.circular(8)),
                                      child: Text(
                                        ("${(entry.node.totalTimeSpent / 60).round().toString()} min"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  BlocProvider.of<RepoBloc>(context)
                      .add(const CreatingSubject());
                  BlocProvider.of<PageNavigationBloc>(context)
                      .add(const AddSubjectPageEvent());
                }),
          );
        } else {
          return const YaruCircularProgressIndicator();
        }
      },
    ); //sca
  }
}

String _formatTime(DateTime? time) {
  if (time == null) return '--:--';
  return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
}
