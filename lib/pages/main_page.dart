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
  int? countingWorkRounds(int times) {
    if (times == 1) {
      return times;
    } else if (times != 1 && (times % 2) == 0) {
      int timeshalf = times ~/ 2;
      return timeshalf;
    } else if (times != 1 && (times % 2) != 0) {
      int n = ((times + 2) - 1) ~/
          2; // from the arithmetic progression of: An = A1st(which is 1) + (n - 1) * d(which is 2)
      return n;
    }
    return null;
  }

  String currentSessionStatus(int Rn, int ReqSessions) {
    if ((Rn % 2) == 0 && Rn == (ReqSessions * 2)) {
      return AppLocalizations.of(context)!.longBreakTimeLabel;
    } else if ((Rn % 2 != 0)) {
      return AppLocalizations.of(context)!.workTimeLabel;
    } else if ((Rn % 2) == 0 && Rn != (ReqSessions * 2)) {
      return AppLocalizations.of(context)!.breakTimeLabel;
    }
    return "error";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PomodoroBloc, PomodoroTimerState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
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
                                  "${countingWorkRounds(state.runTimes)} / ${state.reqRounds}"))),
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
                                  "${countingWorkRounds(state.runTimes)} / ${state.reqRounds}"))),
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
                                  "${countingWorkRounds(state.runTimes)} / ${state.reqRounds}"))),
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
            title: Column(
              children: [
                const Text(
                  "Focuzd",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  currentSessionStatus(state.runTimes, state.reqRounds),
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          body: Center(child: BlocBuilder<PomodoroBloc, PomodoroTimerState>(
              builder: (context, state) {
            final dur =
                context.select((PomodoroBloc pom) => pom.state.duration);
            var minutesStr =
                ((dur / 60) % 60).floor().toString().padLeft(2, '0');
            final secondsStr = (dur % 60).floor().toString().padLeft(2, '0');
            return Text(
              "$minutesStr : $secondsStr",
              style: const TextStyle(fontSize: 40),
            );
          })),
        );
      },
    );
  }
}
