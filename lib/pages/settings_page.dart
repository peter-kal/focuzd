import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/widgets/settings_widgets.dart';
import 'package:yaru/yaru.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

// TASK: make settings
class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoBloc, RepoState>(
      builder: (context, state) {
        if (state is RepoVariablesGivenState) {
          return Scaffold(
            bottomNavigationBar: BottomAppBar(
              height: 95,
              child: YaruSwitchListTile(
                  value: state.windowOnTop,
                  title: const Text("Window Always On Top"),
                  subtitle: const Text(
                      "If ticked the window will always be on top of other windows"),
                  onChanged: (newValue) {
                    BlocProvider.of<RepoBloc>(context).add(
                        UpdateSettingVariables(
                            selectedToChange: 1, changedVar: newValue));
                  }),
            ),
            body: ListView(
              children: [
                SettingsCardSpinBox(
                    kind: "min",
                    label: "Work Time",
                    changeable: 4,
                    value: state.selectedWorkDurationStored),
                SettingsCardSpinBox(
                    kind: "min",
                    label: "Break Time",
                    changeable: 3,
                    value: state.selectedBreakDurationStored),
                SettingsCardSpinBox(
                    kind: "min",
                    label: "Long Break Time",
                    changeable: 5,
                    value: state.selectedLongBreakDuration),
                SettingsCardSpinBox(
                    kind: "integer",
                    label: "Rounds",
                    changeable: 2,
                    value: state.requestedNumberOfSessions),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: OutlinedButton(
                      onPressed: () {
                        BlocProvider.of<RepoBloc>(context).add(ResetSettings());
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.restart_alt),
                          Text("Reset to default")
                        ],
                      )),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
              ],
            ),
            appBar: YaruWindowTitleBar(
              title: Text(AppLocalizations.of(context)!.settingsPage),
              leading: YaruIconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  BlocProvider.of<PageNavigationBloc>(context)
                      .add(const MainPageEvent());
                },
              ),
            ),
          );
        } else {
          return const YaruCircularProgressIndicator();
        }
      },
    ); //sca
  }
}
