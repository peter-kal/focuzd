import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/extra_widgets/session_card.dart';
import 'package:yaru/yaru.dart';
import 'package:focuzd/l10n/app_localizations.dart' as l10n;

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _SettingsPageState();
}

// TASK: make settings
class _SettingsPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoBloc, RepoState>(
      builder: (context, state) {
        if (state is RepoVariablesGivenState) {
          return Scaffold(
            body: ListView.builder(
              itemCount: state.sessions?.length ?? 0, // Safe null handling
              itemBuilder: (context, index) {
                if (state.sessions == null) {
                  return SizedBox(); // Prevents errors
                }
                return SessionCard(state.sessions![index]);
              },
            ),
            appBar: YaruWindowTitleBar(
              title: Text("History"),
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
