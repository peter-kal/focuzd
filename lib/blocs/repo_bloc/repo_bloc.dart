import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/data/repo.dart';
import 'package:focuzd/data/settings_storage/settings_vars.dart';

import 'package:focuzd/data/settings_storage/db_settings.dart';
import 'package:window_manager/window_manager.dart';

part 'repo_event.dart';
part 'repo_state.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  RepoBloc() : super(RepoInitial()) {
    on<EmitStateWithDBVars>(_onEmitStateWithDBVars);
    on<UpdateSettingVariables>(_onUpdateSettingsVariables);
    on<ResetSettings>(_onResetSettingsEvent);
  }
  final settingsRepo = SettingsRepository(AppDatabase.instance);

  void _onUpdateSettingsVariables(
      UpdateSettingVariables event, Emitter<RepoState> emit) async {
    SettingsVariable? has = await settingsRepo.fetchSettings();
    switch (event.selectedToChange) {
      case 1:
        await settingsRepo.updateSetting(1,
            SettingsVariablesCompanion(windowOnTop: Value(event.changedVar)));
        break;
      case 2:
        await settingsRepo.updateSetting(
            1,
            SettingsVariablesCompanion(
                defaultNumberOfSessionsPerRound: Value(event.changedVar)));
        break;
      case 3:
        await settingsRepo.updateSetting(
            1,
            SettingsVariablesCompanion(
                defaultBreakDurationStored: Value(event.changedVar)));
        break;
      case 4:
        await settingsRepo.updateSetting(
            1,
            SettingsVariablesCompanion(
                defaultFocusDurationStored: Value(event.changedVar)));
        break;
      case 5:
        await settingsRepo.updateSetting(
            1,
            SettingsVariablesCompanion(
                defaultLongBreakDurationStored: Value(event.changedVar)));
        break;
      
      case 6:
        await settingsRepo.updateSetting(1,
            SettingsVariablesCompanion(atWillStart: Value(event.changedVar)));
      default:
    }
    add(EmitStateWithDBVars());
  }

  void _onEmitStateWithDBVars(
      EmitStateWithDBVars event, Emitter<RepoState> emit) async {
    final has = await settingsRepo.fetchSettings(); 
    WindowOptions options = WindowOptions(
      alwaysOnTop: has!.windowOnTop,
    );
    await windowManager.waitUntilReadyToShow(options, () async {
      windowManager.focus();
      windowManager.show();
    });

    emit(RepoVariablesGivenState(
        requestedNumberOfSessions: has.defaultNumberOfSessionsPerRound,
        selectedBreakDurationStored: has.defaultBreakDurationStored,
        selectedLongBreakDuration: has.defaultLongBreakDurationStored,
        selectedWorkDurationStored: has.defaultFocusDurationStored,
        windowOnTop: has.windowOnTop));
  }

  void _onResetSettingsEvent(
      ResetSettings event, Emitter<RepoState> emit) async {
    settingsRepo.updateSetting(
        1,
        SettingsVariablesCompanion(
            windowOnTop: Value(false),
            defaultNumberOfSessionsPerRound: Value(4),
            defaultBreakDurationStored: Value(5),
            defaultLongBreakDurationStored: Value(15),
            defaultFocusDurationStored: Value(25)));
    add(EmitStateWithDBVars());
  }
}
