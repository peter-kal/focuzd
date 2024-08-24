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
    await Future<void>.delayed(const Duration(milliseconds: 50));

    await Future<void>.delayed(const Duration(milliseconds: 50));
    add(EmitStateWithDBVars());
  }

  void _onEmitStateWithDBVars(
      EmitStateWithDBVars event, Emitter<RepoState> emit) async {
    /* if (await IsFirstRun.isFirstRun() || database.allTables.isEmpty) {
      await database.insertNewSettingsVariable(const SettingsVariablesCompanion(
          windowOnTop: Value(false),
          requestedNumberOfSessions: Value(4),
          selectedBreakDurationStored: Value(5),
          selectedWorkDurationStored: Value(5),
          selectedLongBreakDurationStored: Value(15)));
    }*/
    final has = await SettingsVariablesEntity.querySetVarById(1);
    if (has!.windowOnTop!) {
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
        requestedNumberOfSessions: has.requestedNumberOfSessions!,
        selectedBreakDurationStored: has.selectedBreakDurationStored!,
        selectedLongBreakDuration: has.selectedLongBreakDurationStored!,
        selectedWorkDurationStored: has.selectedWorkDurationStored!,
        windowOnTop: has.windowOnTop!));
  }

  void _onResetSettingsEvent(
      ResetSettings event, Emitter<RepoState> emit) async {
    add(EmitStateWithDBVars());
  }
}
