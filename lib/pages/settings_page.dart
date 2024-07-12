import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:focuzd/blocs/page_navigation_bloc/page_navigation_bloc.dart';
import 'package:focuzd/blocs/repo_bloc/repo_bloc.dart';
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: [
                        TileWithSliderAndInfo(
                            max4Slider: 50,
                            min4Slider: 1,
                            valueChanged: 4,
                            textInfo: "Work Duration",
                            valueRequested:
                                state.selectedWorkDurationStored.toDouble()),
                        TileWithSliderAndInfo(
                            max4Slider: 10,
                            min4Slider: 1,
                            valueChanged: 3,
                            textInfo: "Break Duration",
                            valueRequested:
                                state.selectedBreakDurationStored.toDouble()),
                        TileWithSliderAndInfo(
                            max4Slider: 30,
                            min4Slider: 1,
                            textInfo: "Long Break Duration",
                            valueChanged: 5,
                            valueRequested:
                                state.selectedLongBreakDuration.toDouble()),
                        YaruCheckboxListTile(
                            value: state.windowOnTop,
                            title: const Text("Window Always On Top"),
                            subtitle: const Text(
                                "If ticked the window will always be on top of other windows"),
                            onChanged: (newValue) {
                              BlocProvider.of<RepoBloc>(context).add(
                                  UpdateSettingVariables(
                                      selectedToChange: 1,
                                      changedVar: newValue));
                            })
                      ],
                    ),
                  ),
                ),
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
