import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';
import 'package:focuzd/extra_widgets/bottom_appBar_interface.dart';
import 'package:focuzd/extra_widgets/countdown_interface.dart';
import 'package:focuzd/extra_widgets/round_planning_dialog.dart';

import 'package:yaru/yaru.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with ExtraFunctions {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PomodoroBloc, PomodoroTimerState>(
      listener: (context, state) async {
        if (state is RoundPlanning) {
          return await showDialog(
              context: context, builder: (_) => RoundPlanningDialog());
        }
      },
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
                  runTimes: state.runTimes,
                ),
              TimerRunInProgress() => BottomAppBarInterface(
                  duration: state.duration,
                  isInitial: false,
                  isActive: true,
                  leftButton: AppLocalizations.of(context)!.pauseButtonTooltip,
                  reqRounds: state.defaultSessionsPerRound,
                  runTimes: state.runTimes),
              TimerRunPause() => BottomAppBarInterface(
                  duration: state.duration,
                  isInitial: false,
                  isActive: false,
                  leftButton: AppLocalizations.of(context)!.resumeButtonTooltip,
                  reqRounds: state.defaultSessionsPerRound,
                  runTimes: state.runTimes),
              TimerRunComplete() => throw UnimplementedError(),
            },
          ),
          appBar: YaruWindowTitleBar(
            actions: [
              YaruIconButton(
                icon: const Icon(Icons.analytics),
                onPressed: () {
                  BlocProvider.of<PageNavigationBloc>(context)
                      .add(const HistoryPageEvent());
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
                          state.runTimes,
                          state.defaultSessionsPerRound,
                          AppLocalizations.of(context)!.longBreakTimeLabel,
                          AppLocalizations.of(context)!.workTimeLabel,
                          AppLocalizations.of(context)!.breakTimeLabel),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  TimerRunPause() => Text(
                      currentSessionStatus(
                          state.runTimes,
                          state.defaultSessionsPerRound,
                          AppLocalizations.of(context)!.longBreakTimeLabel,
                          AppLocalizations.of(context)!.workTimeLabel,
                          AppLocalizations.of(context)!.breakTimeLabel),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  TimerRunInProgress() => Text(
                      currentSessionStatus(
                          state.runTimes,
                          state.defaultSessionsPerRound,
                          AppLocalizations.of(context)!.longBreakTimeLabel,
                          AppLocalizations.of(context)!.workTimeLabel,
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
                            runTimes: state.runTimes,
                            minutesStr: minutesString(state.duration),
                            secondsStr: secondsString(state.duration),
                            hoursStr: hoursString(state.duration),
                            selectedDuration: state.selectedDuration,
                            duration: state.duration,
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
                            runTimes: state.runTimes,
                            minutesStr: minutesString(state.duration),
                            secondsStr: secondsString(state.duration),
                            hoursStr: hoursString(state.duration),
                            selectedDuration: state.selectedDuration,
                            duration: state.duration,
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
