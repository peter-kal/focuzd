import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:yaru/yaru.dart';
import 'package:focuzd/l10n/app_localizations.dart' as l10n;

class IndividualSubjectPage extends StatelessWidget {
  const IndividualSubjectPage({super.key, required this.subject});
  final SubjectData subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RepoBloc, RepoState>(builder: (context, state) {
        if (state is RepoVariablesGivenState) {
          return Center(
            child: Column(children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 60,
                child: Card(
                  child: Center(
                    child: Column(
                      children: [
                        Text(subject.name, style: TextStyle(fontSize: 20)),
                        Text(
                            "${subject.updatedAt.day}/${subject.updatedAt.month}/${subject.updatedAt.year}")
                      ],
                    ),
                  ),
                ),
              ),
              subject.subSubjects != 0
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 300,
                      child: Card(
                        child: Center(
                          child: ListView.builder(
                              itemCount: state.subjects!.length,
                              itemBuilder: (context, index) {
                                if (state.subjects![index].superSubjectID ==
                                    subject.id) {
                                  return YaruTile(
                                      title: Text(state.subjects![index].name));
                                }
                              }),
                        ),
                      ),
                    )
                  : Text("hello")
            ]),
          );
        } else {
          return Text("he");
        }
      }),
      floatingActionButton:
          BlocBuilder<PageNavigationBloc, PageNavigationState>(
              builder: (context, state) {
        if (state is SubjectPageState) {
          return FloatingActionButton(
              child: Icon(Icons.delete_rounded),
              onPressed: () {
                BlocProvider.of<RepoBloc>(context)
                    .add(DeleteSubjectDB(id: state.subject.id));
                BlocProvider.of<PageNavigationBloc>(context)
                    .add(SubjectsPageEvent());
              });
        } else {
          return FloatingActionButton(
              child: Icon(Icons.delete_forever), onPressed: () {});
        }
      }),
      appBar: YaruWindowTitleBar(
        title: Text(subject!.name),
        leading: YaruIconButton(
          tooltip: l10n.AppLocalizations.of(context)!.backArrowTooltip,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            BlocProvider.of<PageNavigationBloc>(context)
                .add(const SubjectsPageEvent());
          },
        ),
      ),
    );

    //sca
  }
}
