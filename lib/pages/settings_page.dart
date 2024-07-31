import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
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
    return Scaffold(
      body: BlocBuilder<RepoBloc, RepoState>(
        builder: (context, state) {
          if (state is RepoVariablesGivenState) {
            return ListView(
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
                const Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                YaruCheckboxListTile(
                    value: state.windowOnTop,
                    title: const Text("Window Always On Top"),
                    subtitle: const Text(
                        "If ticked the window will always be on top of other windows"),
                    onChanged: (newValue) {
                      BlocProvider.of<RepoBloc>(context).add(
                          UpdateSettingVariables(
                              selectedToChange: 1, changedVar: newValue));
                    }),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
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
  }
}
