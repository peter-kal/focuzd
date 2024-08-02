import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';

import 'package:yaru/yaru.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  num? countingWorkRounds(int times) {
    if (times == 1) {
      return times;
    } else if (times != 1 && (times % 2) == 0) {
      double timeshalf = times / 2;
      return timeshalf.toInt();
    } else if (times != 1 && (times % 2) != 0) {
      int n = ((times + 2) - 1) ~/
          2; // from the arithmetic progression of: An = A 1st + (n - 1) * 2
      return n;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<PomodoroBloc, PomodoroTimerState>(
        builder: (context, state) {
          return BottomAppBar(
            height: 110,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...switch (state) {
                  TimerInitial() => [
                      SizedBox(
                        width: 50,
                        height: 70,
                        child: YaruIconButton(
                            tooltip:
                                AppLocalizations.of(context)!.playButtonTooltip,
                            icon: Icon(
                              Icons.play_arrow,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              context
                                  .read<PomodoroBloc>()
                                  .add(TimerStarted(duration: state.duration));
                            }),
                      ),
                      SizedBox(
                          child: YaruSection(
                              child: SelectableText(
                                  "${countingWorkRounds(state.runTimes)} / ${state.reqRounds.toInt()}"))),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          YaruIconButton(
                            tooltip: AppLocalizations.of(context)!
                                .resetSessionButtonTooltip,
                            icon: Icon(
                              Icons.restart_alt,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              null;
                            },
                          ),
                          YaruIconButton(
                            tooltip: AppLocalizations.of(context)!
                                .nextSessionButtonTooltip,
                            icon: Icon(
                              Icons.skip_next,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              context
                                  .read<PomodoroBloc>()
                                  .add(const NextPomodoroTimer());
                            },
                          )
                        ],
                      )
                    ],
                  TimerRunInProgress() => [
                      SizedBox(
                        width: 50,
                        height: 70,
                        child: YaruIconButton(
                            tooltip: AppLocalizations.of(context)!
                                .pauseButtonTooltip,
                            icon: Icon(
                              Icons.pause,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              context
                                  .read<PomodoroBloc>()
                                  .add(const TimerPaused());
                            }),
                      ),
                      SizedBox(
                          child: YaruSection(
                              child: SelectableText(
                                  "${countingWorkRounds(state.runTimes)} / ${state.reqRounds.toInt()}"))),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          YaruIconButton(
                            tooltip: AppLocalizations.of(context)!
                                .resetSessionButtonTooltip,
                            icon: Icon(
                              Icons.restart_alt,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              context
                                  .read<PomodoroBloc>()
                                  .add(const TimerReset());
                            },
                          ),
                          YaruIconButton(
                            tooltip: AppLocalizations.of(context)!
                                .nextSessionButtonTooltip,
                            icon: Icon(
                              Icons.skip_next,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              context
                                  .read<PomodoroBloc>()
                                  .add(const NextPomodoroTimer());
                            },
                          )
                        ],
                      )
                    ],
                  TimerRunPause() => [
                      SizedBox(
                        width: 50,
                        height: 70,
                        child: YaruIconButton(
                            tooltip: AppLocalizations.of(context)!
                                .resumeButtonTooltip,
                            icon: Icon(
                              Icons.play_arrow,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              context
                                  .read<PomodoroBloc>()
                                  .add(const TimerResumed());
                            }),
                      ),
                      SizedBox(
                          child: YaruSection(
                              child: SelectableText(
                                  "${countingWorkRounds(state.runTimes)} / ${state.reqRounds.toInt()}"))),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          YaruIconButton(
                            tooltip: AppLocalizations.of(context)!
                                .resetSessionButtonTooltip,
                            icon: Icon(
                              Icons.restart_alt,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              context
                                  .read<PomodoroBloc>()
                                  .add(const TimerReset());
                            },
                          ),
                          YaruIconButton(
                            tooltip: AppLocalizations.of(context)!
                                .nextSessionButtonTooltip,
                            icon: Icon(
                              Icons.skip_next,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              context
                                  .read<PomodoroBloc>()
                                  .add(const NextPomodoroTimer());
                            },
                          )
                        ],
                      )
                    ],

                  // TODO: Handle this case.
                  TimerRunComplete() => throw UnimplementedError(),
                }
              ],
            ),
          );
        },
      ),
      appBar: YaruWindowTitleBar(
        leading: YaruIconButton(
          tooltip: AppLocalizations.of(context)!.settingsPage,
          icon: const Icon(Icons.settings),
          onPressed: () {
            BlocProvider.of<PageNavigationBloc>(context)
                .add(const SettingsPageEvent());
          },
        ),
        title: const Text("Focuzd"),
      ),
      body: Center(child: BlocBuilder<PomodoroBloc, PomodoroTimerState>(
          builder: (context, state) {
        final dur = context.select((PomodoroBloc pom) => pom.state.duration);
        var minutesStr = ((dur / 60) % 60).floor().toString().padLeft(2, '0');
        final secondsStr = (dur % 60).floor().toString().padLeft(2, '0');
        return Text(
          "$minutesStr : $secondsStr",
          style: const TextStyle(fontSize: 40),
        );
      })),
    );
  }
}
