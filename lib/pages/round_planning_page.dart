
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/extra_widgets/session_tile_planning.dart';
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
              title: const Text("Round Plan"),
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
              height: 150,
              elevation: 10,
              child: Row(
                    children: [
                      Text(
                        DateFormat('HH:mm').format(state.expFinishRoundTime),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      FilledButton(
                        onPressed: () {
                          BlocProvider.of<PomodoroBloc>(context)
                              .add(ChangePlan(1));
                        },
                        child: const Text("Add Session"),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        child: const Text("Start"),
                        onPressed: () {
                          BlocProvider.of<PomodoroBloc>(context)
                              .add(ChangePlan(4));
                          BlocProvider.of<PomodoroBloc>(context)
                              .add(StartRound());
                          
                        },
                      ),
                    ],
                  ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
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
                ),
                
              ],
            ),
          );
        } else {
          return const YaruCircularProgressIndicator();
        }
      },
    );
  }
}