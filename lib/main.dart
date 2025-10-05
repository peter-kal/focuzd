import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';
import 'package:focuzd/pages/goals_page.dart';
import 'package:focuzd/pages/pages.dart';
import 'package:flutter/material.dart';

import 'package:yaru/yaru.dart';
import 'package:window_manager/window_manager.dart';
import 'package:focuzd/l10n/app_localizations.dart';

import 'blocs/observer.dart';

Future<void> main() async {
  await YaruWindowTitleBar.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptions options = const WindowOptions(
    size: Size(370, 473),
    minimumSize: Size(370, 463),
    fullScreen: false,
  );
  await windowManager.waitUntilReadyToShow(options, () async {
    await windowManager.setPreventClose(true);
    windowManager.focus();
    windowManager.show();
  });
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageNavigationBloc()..add(const MainPageEvent()),
        ),
        BlocProvider(
            create: (context) => RepoBloc()..add(const EmitStateWithDBVars())),
        BlocProvider(
            create: (context) =>
                PomodoroBloc(ticker: const Ticker())..add(const TimerInit()))
      ],
      child: Builder(builder: (context) {
        return const FocuzdApp();
      })));
}

class FocuzdApp extends StatelessWidget {
  const FocuzdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      builder: (context, yaru, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            title: 'Focuzd',
            theme: yaru.theme,
            darkTheme: yaru.darkTheme,
            home: BlocConsumer<PageNavigationBloc, PageNavigationState>(
                listener: (context, state) {
              if (state is DataPageState) {
                BlocProvider.of<RepoBloc>(context).add(EmitStateWithDBVars());
              }
              if (state is SettingsPageState) {
                BlocProvider.of<RepoBloc>(context).add(EmitStateWithDBVars());
              }
              if (state is SubjectsPageState) {
                BlocProvider.of<RepoBloc>(context).add(EmitStateWithDBVars());
              }
            }, builder: (context, state) {
              return switch (state) {
                MainPageState() => const MainPage(),
                SettingsPageState() => const SettingsPage(),
                DataPageState() => const MainDataPage(),
                HistoryDataPageState() => const MainDataPage(),
                StatisticsDataPageState() => const MainDataPage(),
                PageNavigationInitial() => const Scaffold(),
                RoundPlanningPageState() => const RoundPlanningPage(),
                SubjectsAndGoalsPageState() => const SubjectsGoalsPage(),
                SubjectsPageState() => const SubjectsGoalsPage(),
                GoalsPageState() => SubjectsGoalsPage(),
                AddGoalPageState() => GoalCreatePage(),
                AddSubjectPageState() => const SubjectCreatePage(),
                SubjectPageState() =>
                  IndividualSubjectPage(subject: state.subject)
              };
            }));
      },
    );
  }
}
