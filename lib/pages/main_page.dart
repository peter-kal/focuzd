import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';
import 'package:focuzd/extra_widgets/bottom_appBar_interface.dart';
import 'package:focuzd/extra_widgets/countdown_interface.dart';
import 'package:focuzd/extra_widgets/roundProgressBar.dart';

import 'package:yaru/yaru.dart';
import 'package:focuzd/l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with ExtraFunctions {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PomodoroBloc, PomodoroTimerState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            elevation: 10,
            height: 110,
            child: switch (state) {
              RoundPlanning() => null,
              TimerInitial() => BottomAppBarInterface(
                  duration: state.selectedDuration,
                  isInitial: true,
                  isActive: false,
                  leftButton: AppLocalizations.of(context)!.playButtonTooltip,
                  reqRounds: state.defaultSessionsPerRound,
                  showTime: 1,
                ),
              TimerRunInProgress() => BottomAppBarInterface(
                  duration: state.duration,
                  isInitial: false,
                  isActive: true,
                  leftButton: AppLocalizations.of(context)!.pauseButtonTooltip,
                  reqRounds: state.defaultSessionsPerRound,
                  showTime: state.showTime),
              TimerRunPause() => BottomAppBarInterface(
                  duration: state.duration,
                  isInitial: false,
                  isActive: false,
                  leftButton: AppLocalizations.of(context)!.resumeButtonTooltip,
                  reqRounds: state.defaultSessionsPerRound,
                  showTime: state.showTime),
              TimerRunComplete() => throw UnimplementedError(),
            },
          ),
          appBar: YaruWindowTitleBar(
            onClose: (context) {
              Future.delayed(Duration(seconds: 2), () async {
                print(
                    "window is closing, who you gonna call ? The BLoC-busters");
                BlocProvider.of<PomodoroBloc>(context).add(WindowIsClosing());
              });
            },
            actions: [
              YaruIconButton(
                tooltip: AppLocalizations.of(context)!.settingsPage,
                icon: const Icon(Icons.subject),
                onPressed: () {
                  BlocProvider.of<PageNavigationBloc>(context)
                      .add(const SubjectsPageEvent());
                },
              ),
              YaruIconButton(
                icon: const Icon(Icons.analytics),
                onPressed: () {
                  BlocProvider.of<PageNavigationBloc>(context)
                      .add(const DataPageEvent());
                },
              ),
            ],
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
                switch (state) {
                  TimerRunComplete() => Text("Completed"),
                  RoundPlanning() => Text("RoundPlanning"),
                  TimerInitial() => Text(
                      currentSessionStatus(
                          'focus',
                          AppLocalizations.of(context)!.longBreakTimeLabel,
                          AppLocalizations.of(context)!.focusTimeLabel,
                          AppLocalizations.of(context)!.breakTimeLabel),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  TimerRunPause() => Text(
                      currentSessionStatus(
                          state.type,
                          AppLocalizations.of(context)!.longBreakTimeLabel,
                          AppLocalizations.of(context)!.focusTimeLabel,
                          AppLocalizations.of(context)!.breakTimeLabel),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  TimerRunInProgress() => Text(
                      currentSessionStatus(
                          state.type,
                          AppLocalizations.of(context)!.longBreakTimeLabel,
                          AppLocalizations.of(context)!.focusTimeLabel,
                          AppLocalizations.of(context)!.breakTimeLabel),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    )
                }
              ],
            ),
          ),
          body: switch (state) {
            TimerRunInProgress() => SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: CountdownInterface(
                            state: state,
                            type: state.type,
                            runTimes: state.runTimes + 1,
                            minutesStr: minutesString(state.duration),
                            secondsStr: secondsString(state.duration),
                            hoursStr: hoursString(state.duration),
                            selectedDuration: state.selectedDuration,
                            duration: state.duration,
                          )),
                      SizedBox(
                          width: 240,
                          child: RoundProgressBar(
                            endRound: state.endOfRound,
                            progress: (state.actualRoundDuration +
                                    (state.selectedDuration - state.duration)) /
                                state.roundDuration,
                            sessionNumber: 2,
                            subjectName: state.subject?.name,
                            type: state.type,
                          ))
                    ])),
            TimerRunPause() => SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: CountdownInterface(
                            state: state,
                            type: state.type,
                            runTimes: state.runTimes + 1,
                            minutesStr: minutesString(state.duration),
                            secondsStr: secondsString(state.duration),
                            hoursStr: hoursString(state.duration),
                            selectedDuration: state.selectedDuration,
                            duration: state.duration,
                          )),
                      SizedBox(
                          width: 240,
                          child: RoundProgressBar(
                            endRound: state.endOfRound,
                            progress: (state.actualRoundDuration +
                                    (state.selectedDuration - state.duration)) /
                                state.roundDuration,
                            sessionNumber: 2,
                            subjectName: state.subject?.name,
                            type: state.type,
                          ))
                    ])),
            TimerInitial() => SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: CountdownInterface(
                            state: state,
                            type: 'focus',
                            runTimes: state.runTimes,
                            minutesStr: minutesString(state.selectedDuration),
                            secondsStr: secondsString(state.selectedDuration),
                            hoursStr: hoursString(state.selectedDuration),
                            selectedDuration: state.selectedDuration,
                            duration: state.selectedDuration,
                          ))
                    ])),
            RoundPlanning() => Text("RoundPlanning"),
            TimerRunComplete() => Text("End")
          },
        ); // scaffold
      },
    );
  }
}
