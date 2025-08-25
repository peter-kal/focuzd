import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:focuzd/extra_widgets/session_card.dart';
import 'package:focuzd/extra_widgets/subject_list_card.dart';
import 'package:focuzd/l10n/app_localizations.dart';
import 'package:yaru/yaru.dart';
import 'package:focuzd/l10n/app_localizations.dart' as l10n;

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

// TASK: make settings
class _SubjectsPageState extends State<SubjectsPage> {
  SubjectData? subject;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoBloc, RepoState>(
      builder: (context, state) {
        if (state is RepoVariablesGivenState) {
          return Scaffold(
            body: ListView.builder(
              itemCount: state.subjects?.length ?? 0, // Safe null handling
              itemBuilder: (context, index) {
                if (state.subjects == null) {
                  return SizedBox(); // Prevents errors
                }
                return SubjectListCard(
                  id: state.subjects![index].id,
                  name: state.subjects![index].name,
                  totalTimeSpent: state.subjects![index].totalTimeSpent,
                  onTap: () {
                    // Handle tap
                  },
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  BlocProvider.of<RepoBloc>(context).add(const AddingSubject());
                  BlocProvider.of<PageNavigationBloc>(context)
                      .add(const AddSubjectPageEvent());
                }),
            appBar: YaruWindowTitleBar(
              title: Text("Subjects"),
              leading: YaruIconButton(
                tooltip: l10n.AppLocalizations.of(context)!.backArrowTooltip,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  BlocProvider.of<PageNavigationBloc>(context)
                      .add(const MainPageEvent());
                },
              ),
            ),
          );
        } else {
          return const YaruCircularProgressIndicator();
        }
      },
    ); //sca
  }
}
