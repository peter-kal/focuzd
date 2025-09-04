import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/pages/goals_page.dart';
import 'package:focuzd/pages/history_data_page.dart';
import 'package:focuzd/pages/pages.dart';
import 'package:focuzd/pages/stats_data_page.dart';
import 'package:focuzd/extra_widgets/session_card.dart';
import 'package:yaru/yaru.dart';
import 'package:focuzd/l10n/app_localizations.dart' as l10n;

class SubjectsGoalsPage extends StatefulWidget {
  const SubjectsGoalsPage({super.key});

  @override
  State<SubjectsGoalsPage> createState() => _SubjectsGoalsPage();
}

// TASK: make settings
class _SubjectsGoalsPage extends State<SubjectsGoalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.subject), label: "subjects"),
            BottomNavigationBarItem(
                icon: Icon(Icons.vertical_align_top_rounded), label: "goals")
          ],
          elevation: 10,
          currentIndex:
              context.watch<PageNavigationBloc>().state == SubjectsPageState()
                  ? 0
                  : 1,
          onTap: (index) {
            BlocProvider.of<PageNavigationBloc>(context)
                .add(SelectSubGoalPageEvent(index: index));
          }),
      body: BlocBuilder<PageNavigationBloc, PageNavigationState>(
          builder: (context, state) {
        if (state is GoalsPageState) {
          return GoalsPage();
        }
        if (state is SubjectsPageState) {
          return SubjectsPage();
        } else {
          return Text("Else");
        }
      }),
      appBar: YaruWindowTitleBar(
        title: Text("Subjects & Goals"),
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
  }
  //sca
}
