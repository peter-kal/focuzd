import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/data/settings_storage/entities/settings_vars.dart';
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
    final has = await SettingsVariablesEntity.querySetVarById(1);
    switch (event.selectedToChange) {
      case 1:
        has!.windowOnTop = event.changedVar;
        break;
      case 2:
        has?.requestedNumberOfSessions = event.changedVar;
        break;
      case 3:
        has?.selectedBreakDurationStored = event.changedVar;
        break;
      case 4:
        has?.selectedWorkDurationStored = event.changedVar;
        break;
      case 5:
        has?.selectedLongBreakDurationStored = event.changedVar;
        break;

      default:
    }
    SettingsVariablesEntity.updateSettingsVariablesEntity(has!);

    add(EmitStateWithDBVars());
  }

  void _onEmitStateWithDBVars(
      EmitStateWithDBVars event, Emitter<RepoState> emit) async {
    final has = await SettingsVariablesEntity.querySetVarById(1);
    if (has!.windowOnTop!) {
      WindowOptions options = const WindowOptions(
        alwaysOnTop: true,
        size: Size(360, 463),
        minimumSize: Size(360, 463),
        fullScreen: false,
      );
      await windowManager.waitUntilReadyToShow(options, () async {
        windowManager.focus();
        windowManager.show();
      });
    } else {
      WindowOptions options = const WindowOptions(
        alwaysOnTop: false,
        size: Size(360, 463),
        minimumSize: Size(360, 463),
        fullScreen: false,
      );
      await windowManager.waitUntilReadyToShow(options, () async {
        windowManager.focus();
        windowManager.show();
      });
    }

    emit(RepoVariablesGivenState(
        requestedNumberOfSessions: has.requestedNumberOfSessions!,
        selectedBreakDurationStored: has.selectedBreakDurationStored!,
        selectedLongBreakDuration: has.selectedLongBreakDurationStored!,
        selectedWorkDurationStored: has.selectedWorkDurationStored!,
        windowOnTop: has.windowOnTop!));
  }

  void _onResetSettingsEvent(
      ResetSettings event, Emitter<RepoState> emit) async {
    SettingsVariablesEntity.updateSettingsVariablesEntity(
        SettingsVariablesEntity(
            id: 1,
            requestedNumberOfSessions: 4,
            selectedBreakDurationStored: 5,
            selectedLongBreakDurationStored: 15,
            selectedWorkDurationStored: 25));
    add(EmitStateWithDBVars());
  }
}
