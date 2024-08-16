import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';
import 'package:intl/intl.dart';

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
    return BlocBuilder<PomodoroBloc, PomodoroTimerState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            elevation: 10,
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
                                  "${ExtraFunctions().countingWorkRounds(state.runTimes)} / ${state.reqRounds}"))),
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
                                  "${ExtraFunctions().countingWorkRounds(state.runTimes)} / ${state.reqRounds}"))),
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
                                  "${ExtraFunctions().countingWorkRounds(state.runTimes)} / ${state.reqRounds}"))),
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
                  ExtraFunctions().currentSessionStatus(
                      state.runTimes,
                      state.reqRounds,
                      AppLocalizations.of(context)!.longBreakTimeLabel,
                      AppLocalizations.of(context)!.workTimeLabel,
                      AppLocalizations.of(context)!.breakTimeLabel),
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          body: BlocBuilder<PomodoroBloc, PomodoroTimerState>(
              builder: (context, state) {
            final dur =
                context.select((PomodoroBloc pom) => pom.state.duration);
            var minutesStr =
                ((dur / 60) % 60).floor().toString().padLeft(2, '0');
            final secondsStr = (dur % 60).floor().toString().padLeft(2, '0');
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        SizedBox(
                          height: 250,
                          width: 250,
                          child: YaruCircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                (state.runTimes % 2 == 0)
                                    ? Colors.green
                                    : Theme.of(context).primaryColor),
                            strokeWidth: 10,
                            value: state.duration / (state.selectedDuration),
                          ),
                        ),
                        Text(
                          "$minutesStr : $secondsStr",
                          style: const TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                        "Ends on: ${ExtraFunctions().endsOn(state.duration, state, DateTime.now())}"),
                  )
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
