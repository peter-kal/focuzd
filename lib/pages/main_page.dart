import 'package:desktop_notifications/desktop_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/page_navigation_bloc/page_navigation_bloc.dart';
import 'package:focuzd/blocs/pomodoro_bloc/pomodoro_bloc.dart';
import 'package:focuzd/widgets/countdown_widgets.dart';
import 'package:yaru/yaru.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: BlocBuilder<PomodoroBloc, PomodoroState>(
                // play and pause button
                builder: (context, state) {
                  if (state is WorkPomodoroState) {
                    return YaruIconButton(
                      onPressed: () {
                        state.isRunning
                            ? BlocProvider.of<PomodoroBloc>(context)
                                .add(Pause(stateGiven: state))
                            : BlocProvider.of<PomodoroBloc>(context)
                                .add(Resume(stateGiven: state));
                      },
                      icon: Icon(
                        state.isRunning ? Icons.pause : Icons.play_arrow,
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  } else if (state is BreakPomodoroState) {
                    return YaruIconButton(
                      onPressed: () {
                        state.isRunning
                            ? BlocProvider.of<PomodoroBloc>(context)
                                .add(Pause(stateGiven: state))
                            : BlocProvider.of<PomodoroBloc>(context)
                                .add(Resume(stateGiven: state));
                      },
                      icon: Icon(
                        state.isRunning ? Icons.pause : Icons.play_arrow,
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  } else if (state is LongBreakPomodoroState) {
                    return YaruIconButton(
                      onPressed: () {
                        state.isRunning
                            ? BlocProvider.of<PomodoroBloc>(context)
                                .add(Pause(stateGiven: state))
                            : BlocProvider.of<PomodoroBloc>(context)
                                .add(Resume(stateGiven: state));
                      },
                      icon: Icon(
                        state.isRunning ? Icons.pause : Icons.play_arrow,
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  } else {
                    return const YaruCircularProgressIndicator();
                  }
                },
              ),
            ),
            SizedBox(
              child: BlocBuilder<PomodoroBloc, PomodoroState>(
                builder: (context, state) {
                  if (state is WorkPomodoroState) {
                    return Text(
                        "${state.timesRunWork} / ${state.requestedRounds}");
                  } else if (state is BreakPomodoroState) {
                    return Text(
                        "${state.timesRunBreak} / ${state.requestedRounds}");
                  } else if (state is LongBreakPomodoroState) {
                    return Text(
                        "${state.requestedRounds} / ${state.requestedRounds}");
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            BlocBuilder<PomodoroBloc, PomodoroState>(
              // skip and restart button
              builder: (context, state) {
                if (state is WorkPomodoroState) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: YaruIconButton(
                          icon: const Icon(Icons.restart_alt),
                          onPressed: () {
                            BlocProvider.of<PomodoroBloc>(context)
                                .add(Restart(stateGiven: state));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: YaruIconButton(
                          icon: const Icon(Icons.skip_next),
                          onPressed: () {
                            BlocProvider.of<PomodoroBloc>(context)
                                .add(Next(stateGiven: state));
                          },
                        ),
                      )
                    ],
                  );
                } else if (state is BreakPomodoroState) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: YaruIconButton(
                          icon: const Icon(Icons.restart_alt),
                          onPressed: () {
                            BlocProvider.of<PomodoroBloc>(context)
                                .add(Restart(stateGiven: state));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: YaruIconButton(
                          icon: const Icon(Icons.skip_next),
                          onPressed: () {
                            BlocProvider.of<PomodoroBloc>(context)
                                .add(Next(stateGiven: state));
                          },
                        ),
                      )
                    ],
                  );
                } else if (state is LongBreakPomodoroState) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: YaruIconButton(
                          icon: const Icon(Icons.restart_alt),
                          onPressed: () {
                            BlocProvider.of<PomodoroBloc>(context)
                                .add(Restart(stateGiven: state));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: YaruIconButton(
                          icon: const Icon(Icons.skip_next),
                          onPressed: () {
                            BlocProvider.of<PomodoroBloc>(context)
                                .add(Next(stateGiven: state));
                          },
                        ),
                      )
                    ],
                  );
                } else {
                  return const YaruCircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
      appBar: YaruWindowTitleBar(
        leading: YaruIconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            BlocProvider.of<PageNavigationBloc>(context)
                .add(const SettingsPageEvent());
          },
        ),
        title: const Text("Focuzd"),
      ),
      body: Center(
        child: BlocConsumer<PomodoroBloc, PomodoroState>(
          listener: (context, state) {
            var client = NotificationsClient();
            if (state is WorkPomodoroState && state.isRunning) {
              client.notify(
                  "Focus for the next ${state.selectedWorkDuration.inMinutes} minutes!");
              client.close();
            } else if (state is BreakPomodoroState && state.isRunning) {
              client.notify(
                  "Take a break for the next ${state.selectedBreakDuration.inMinutes} minutes!");
              client.close();
            } else if (state is LongBreakPomodoroState && state.isRunning) {
              client.notify(
                  "Take a long break for the next ${state.selectedLongBreakDuration.inMinutes} minutes!");
              client.close;
            }
          },
          builder: (context, state) {
            if (state is WorkPomodoroState && state.isRunning) {
              return CountDownWidget(
                  state: state,
                  endTimeGiven: DateTime.now().add(state.selectedWorkDuration));
            } else if (state is WorkPomodoroState && !state.isRunning) {
              return TimeToCountdownWidget(
                  selectedDuration: state.selectedWorkDuration);
            } else if (state is BreakPomodoroState && state.isRunning) {
              return CountDownWidget(
                  state: state,
                  endTimeGiven:
                      DateTime.now().add(state.selectedBreakDuration));
            } else if (state is BreakPomodoroState && !state.isRunning) {
              return TimeToCountdownWidget(
                  selectedDuration: state.selectedBreakDuration);
            } else if (state is LongBreakPomodoroState && state.isRunning) {
              return CountDownWidget(
                  state: state,
                  endTimeGiven:
                      DateTime.now().add(state.selectedLongBreakDuration));
            } else if (state is LongBreakPomodoroState && !state.isRunning) {
              return TimeToCountdownWidget(
                  selectedDuration: state.selectedLongBreakDuration);
            } else {
              return const YaruCircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
