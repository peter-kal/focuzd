import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/data/settings_storage/db_setings.dart';
import 'package:window_manager/window_manager.dart';

part 'repo_event.dart';
part 'repo_state.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  RepoBloc() : super(RepoInitial()) {
    on<EmitStateWithDBVars>(_onEmitStateWithDBVars);
    on<UpdateSettingVariables>(_onUpdateSettingsVariables);
    on<ResetSettings>(_onResetSettingsEvent);
  }
  void _onUpdateSettingsVariables(
      UpdateSettingVariables event, Emitter<RepoState> emit) async {
    await SettingsDataProvider()
        .editSpecific(event.changedVar, event.selectedToChange);
    await Future<void>.delayed(const Duration(milliseconds: 50));

    await Future<void>.delayed(const Duration(milliseconds: 50));
    add(EmitStateWithDBVars());
  }

  void _onEmitStateWithDBVars(
      EmitStateWithDBVars event, Emitter<RepoState> emit) async {
    final settings = await SettingsDataProvider().readVar();
    if (await SettingsDataProvider().readSpecificVar(1) == true) {
      WindowOptions options = const WindowOptions(alwaysOnTop: true);
      await windowManager.waitUntilReadyToShow(options, () async {
        windowManager.focus();
        windowManager.show();
      });
    } else {
      WindowOptions options = const WindowOptions(alwaysOnTop: false);
      await windowManager.waitUntilReadyToShow(options, () async {
        windowManager.focus();
        windowManager.show();
      });
    }
    emit(RepoVariablesGivenState(
        requestedNumberOfSessions: settings.requestedNumberOfSessions!,
        selectedBreakDurationStored: settings.selectedBreakDurationStored!,
        selectedLongBreakDuration: settings.selectedLongBreakDuration!,
        selectedWorkDurationStored: settings.selectedWorkDurationStored!,
        windowOnTop: settings.windowOnTop!));
  }

  void _onResetSettingsEvent(
      ResetSettings event, Emitter<RepoState> emit) async {
    SettingsDataProvider().reset2Default();
    await Future<void>.delayed(const Duration(milliseconds: 50));

    add(EmitStateWithDBVars());
  }
}
