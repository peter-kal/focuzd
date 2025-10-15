import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/pages/history_data_page.dart';
import 'package:focuzd/pages/stats_data_page.dart';
import 'package:focuzd/extra_widgets/session_card.dart';
import 'package:yaru/yaru.dart';
import 'package:focuzd/l10n/app_localizations.dart' as l10n;

class MainDataPage extends StatefulWidget {
  const MainDataPage({super.key});

  @override
  State<MainDataPage> createState() => _MainDataPageS();
}

// TASK: make settings
class _MainDataPageS extends State<MainDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "history"),
            BottomNavigationBarItem(
                icon: Icon(Icons.query_stats), label: "statistics")
          ],
          elevation: 10,
          currentIndex: context.watch<PageNavigationBloc>().state ==
                  HistoryDataPageState()
              ? 0
              : 1,
          onTap: (index) {
            BlocProvider.of<PageNavigationBloc>(context)
                .add(SelectDataPageEvent(index: index));
          }),
      body: BlocBuilder<PageNavigationBloc, PageNavigationState>(
          builder: (context, state) {
        if (state is HistoryDataPageState) {
          return HistoryDataPage();
        }
        if (state is StatisticsDataPageState) {
          return StatsDataPage();
        } else {
          return Text("Else");
        }
      }),
      appBar: YaruWindowTitleBar(
        onClose: (context) {
          print("window is closing, who you gonna call ? The BLoC-busters");
          BlocProvider.of<PomodoroBloc>(context).add(WindowIsClosing());
        },
        title: Text("Data Page"),
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
