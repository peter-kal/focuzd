import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/extra_widgets/settings_widgets.dart';
import 'package:yaru/yaru.dart';
import 'package:focuzd/l10n/app_localizations.dart' as l10n;

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
              height: 100,
              child: YaruSwitchListTile(
                  value: state.windowOnTop,
                  title: Text(
                      l10n.AppLocalizations.of(context)!.alwaysOnTopOption),
                  subtitle: Text(l10n.AppLocalizations.of(context)!
                      .alwaysOnTopOptionDescription),
                  onChanged: (newValue) {
                    BlocProvider.of<RepoBloc>(context).add(
                        UpdateSettingVariables(
                            selectedToChange: 1, changedVar: newValue));
                  }),
            ),
            body: ListView(
              children: [
                SettingsCardSpinBox(
                    kind: l10n.AppLocalizations.of(context)!.minutes,
                    label: l10n.AppLocalizations.of(context)!.workTimeLabel,
                    changeable: 4,
                    value: state.selectedWorkDurationStored),
                SettingsCardSpinBox(
                    kind: l10n.AppLocalizations.of(context)!.minutes,
                    label: l10n.AppLocalizations.of(context)!.breakTimeLabel,
                    changeable: 3,
                    value: state.selectedBreakDurationStored),
                SettingsCardSpinBox(
                    kind: l10n.AppLocalizations.of(context)!.minutes,
                    label:
                        l10n.AppLocalizations.of(context)!.longBreakTimeLabel,
                    changeable: 5,
                    value: state.selectedLongBreakDuration),
                SettingsCardSpinBox(
                    kind:
                        l10n.AppLocalizations.of(context)!.numberLabelSettings,
                    label:
                        l10n.AppLocalizations.of(context)!.roundsLabelSettings,
                    changeable: 2,
                    value: state.requestedNumberOfSessions),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: OutlinedButton.icon(
                      icon: const Icon(Icons.restart_alt),
                      iconAlignment: IconAlignment.start,
                      onPressed: () {
                        BlocProvider.of<RepoBloc>(context).add(ResetSettings());
                      },
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(l10n.AppLocalizations.of(context)!.reset2Default)
                        ],
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: SizedBox(
                    height: 50,
                    child: Card(
                      child: Center(
                          child: Text(
                        "Free Palestine ",
                        style: TextStyle(fontSize: 15),
                      )),
                    ),
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
              ],
            ),
            appBar: YaruWindowTitleBar(
              title: Text(l10n.AppLocalizations.of(context)!.settingsPage),
              leading: YaruIconButton(
                tooltip: l10n.AppLocalizations.of(context)!.backArrowTooltip,
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
