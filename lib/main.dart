import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/page_navigation_bloc/page_navigation_bloc.dart';
import 'package:focuzd/blocs/pomodoro_bloc/pomodoro_bloc.dart';
import 'package:focuzd/blocs/pomodoro_bloc/ticker.dart';
import 'package:focuzd/blocs/repo_bloc/repo_bloc.dart';
import 'package:focuzd/pages/main_page.dart';
import 'package:focuzd/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'blocs/observer.dart';

Future<void> main() async {
  await YaruWindowTitleBar.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => PageNavigationBloc()..add(const MainPageEvent()),
    ),
    BlocProvider(create: (context) => RepoBloc()..add(EmitStateWithDBVars())),
    BlocProvider(
        create: (context) => PomodoroBloc(ticker: Ticker())..add(TimerInit()))
  ], child: const FocuzdApp()));
}

class FocuzdApp extends StatelessWidget {
  const FocuzdApp({super.key});

  @override
  Widget build(BuildContext context) {
    YaruWindow.setMaximizable(context, false);
    YaruWindow.show(context);
    return YaruTheme(
      builder: (context, yaru, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          title: 'Focuzd',
          theme: yaru.theme,
          darkTheme: yaru.darkTheme,
          home: BlocBuilder<PageNavigationBloc, PageNavigationState>(
              builder: (context, state) => state is MainPageState
                  ? const MainPage()
                  : const SettingsPage()),
        );
      },
    );
  }
}
