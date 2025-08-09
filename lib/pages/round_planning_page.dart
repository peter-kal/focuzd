
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/extra_widgets/session_tile_planning.dart';
import 'package:focuzd/l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:yaru/yaru.dart';

class RoundPlanningPage extends StatelessWidget {
  const RoundPlanningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PomodoroBloc, PomodoroTimerState>(
      listener: (context, state) {
        if (state is TimerRunInProgress) {
          // Handle any specific actions when entering the RoundPlanning state
          BlocProvider.of<PageNavigationBloc>(context)
              .add(const MainPageEvent());
        }
      },
      builder: (context, state) {
        if (state is RoundPlanning) {
          return Scaffold(
            appBar: YaruWindowTitleBar(
              title:  Text(AppLocalizations.of(context)!.roundPlanningTitleBar),
             leading: YaruIconButton(
                icon:  Icon(Icons.close),
                onPressed: () {
                  BlocProvider.of<PomodoroBloc>(context).add(const SetTimeInnit());
                  BlocProvider.of<PageNavigationBloc>(context)
                      .add(const MainPageEvent());
                },
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              height: 100,
              elevation: 10,
              child: Column(
                children: [
                  Text(
                            DateFormat('HH:mm').format(state.expFinishRoundTime),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          
                          
                          FilledButton(
                            onPressed: () {
                              BlocProvider.of<PomodoroBloc>(context)
                                  .add(ChangePlan(1));
                            },
                            child:  Text(AppLocalizations.of(context)!.addSessionButton),
                          ),
                          
                          ElevatedButton(
                            child: Text(AppLocalizations.of(context)!.startButtonOnPlanning),
                            onPressed: () {
                              BlocProvider.of<PomodoroBloc>(context)
                                  .add(ChangePlan(4));
                              BlocProvider.of<PomodoroBloc>(context)
                                  .add(StartRound());
                              
                            },
                          ),
                        ],
                      ),
                ],
              ),
            ),
            body:  ListView.builder(
              padding: EdgeInsets.all(10),
                    itemCount: state.planlist.length,
                    itemBuilder: (context, index) {
                      return SessionTilePlanning(
                        state.planlist[index],
                        index,
                        state.planlist,
                        state.subjects,
                      );
                    },
                  ),
           
          );
        } else {
          return const YaruCircularProgressIndicator();
        }
      },
    );
  }
}