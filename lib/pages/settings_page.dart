import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:focuzd/blocs/page_navigation_bloc/page_navigation_bloc.dart';
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
