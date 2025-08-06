import 'package:flutter/material.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/l10n/app_localizations.dart';
import 'package:yaru/yaru.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/pomodoro_bloc/pomodoro_bloc.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';

class BottomAppBarInterface extends StatelessWidget with ExtraFunctions {
  const BottomAppBarInterface(
      {super.key,
      required this.leftButton,
      required this.reqRounds,
      required this.runTimes,
      required this.isActive,
      required this.isInitial,
      required this.duration});
  final String leftButton;
  final int runTimes;
  final int reqRounds;
  final bool isActive;
  final bool isInitial;
  final int duration;
  void initialFunction(BuildContext context) {
    BlocProvider.of<PomodoroBloc>(context).add(RoundPlan(duration: duration));
    BlocProvider.of<PageNavigationBloc>(context).add(const RoundPlanningPageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 50,
          height: 70,
          child: YaruIconButton(
              tooltip: leftButton,
              icon: Icon(
                isActive ? Icons.pause : Icons.play_arrow,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                isInitial
                    ? initialFunction(context)
                    : isActive
                        ? BlocProvider.of<PomodoroBloc>(context)
                            .add(const TimerPaused())
                        : BlocProvider.of<PomodoroBloc>(context)
                            .add(const TimerResumed());
              }),
        ),
        SizedBox(
            child: YaruSection(
                child: SelectableText(
                    textAlign: TextAlign.center,
                    "${countingWorkRounds(runTimes)} / $reqRounds"))),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            YaruIconButton(
              tooltip: AppLocalizations.of(context)!.resetSessionButtonTooltip,
              icon: Icon(
                Icons.restart_alt,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                context.read<PomodoroBloc>().add(const TimerReset());
              },
            ),
            YaruIconButton(
              tooltip: AppLocalizations.of(context)!.nextSessionButtonTooltip,
              icon: Icon(
                Icons.skip_next,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                context.read<PomodoroBloc>().add(const NextPomodoroTimer());
              },
            )
          ],
        )
      ],
    );
  }
}
