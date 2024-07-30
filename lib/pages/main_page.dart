import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/page_navigation_bloc/page_navigation_bloc.dart';
import 'package:focuzd/blocs/pomodoro_bloc/pomodoro_bloc.dart';
import 'package:yaru/yaru.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  num? countingWorkRounds(times) {
    print(times);
    if (times == 1) {
      return 1;
    } else if (times != 1 && (times % 2) == 0) {
      return times / 2;
    } else if (times != 1 && (times % 2) != 0) {
      num newnum = times - (times / 2.1);
      return newnum.round();
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
                        width: 70,
                        height: 70,
                        child: YaruIconButton(
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
                          child:
                              Text("${countingWorkRounds(state.workTimes)}")),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          YaruIconButton(
                            icon: const Icon(Icons.restart_alt),
                            onPressed: () {
                              null;
                            },
                          ),
                          YaruIconButton(
                            icon: const Icon(Icons.skip_next),
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
                        width: 70,
                        height: 70,
                        child: YaruIconButton(
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
                          child:
                              Text("${countingWorkRounds(state.workTimes)}")),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          YaruIconButton(
                            icon: const Icon(Icons.restart_alt),
                            onPressed: () {
                              context
                                  .read<PomodoroBloc>()
                                  .add(const TimerReset());
                            },
                          ),
                          YaruIconButton(
                            icon: const Icon(Icons.skip_next),
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
                        width: 70,
                        height: 70,
                        child: YaruIconButton(
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
                          child:
                              Text("${countingWorkRounds(state.workTimes)}")),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          YaruIconButton(
                            icon: const Icon(Icons.restart_alt),
                            onPressed: () {
                              context
                                  .read<PomodoroBloc>()
                                  .add(const TimerReset());
                            },
                          ),
                          YaruIconButton(
                            icon: const Icon(Icons.skip_next),
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
          style: TextStyle(fontSize: 40),
        );
      })),
    );
  }
}
