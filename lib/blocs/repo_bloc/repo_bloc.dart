import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/data/settings_storage/db_setings.dart';

part 'repo_event.dart';
part 'repo_state.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  RepoBloc() : super(RepoInitial()) {
    on<RepoEvent>((event, emit) {});
    on<EmitStateWithDBVars>(_onEmitStateWithDBVars);
    on<UpdateSettingVariables>(_onUpdateSettingsVariables);
    on<ResetSettings>(_onResetSettingsEvent);
  }
  void _onUpdateSettingsVariables(
      UpdateSettingVariables event, Emitter<RepoState> emit) async {
    await SettingsDataProvider()
        .editSpecific(event.changedVar, event.selectedToChange);

    add(EmitStateWithDBVars());
  }

  void _onEmitStateWithDBVars(
      EmitStateWithDBVars event, Emitter<RepoState> emit) async {
    final settings = await SettingsDataProvider().readVar();

    emit(RepoVariablesGivenState(
        requestedNumberOfSessions: settings.requestedNumberOfSessions!,
        selectedBreakDurationStored: settings.selectedBreakDurationStored!,
        selectedLongBreakDuration: settings.selectedLongBreakDuration!,
        selectedWorkDurationStored: settings.selectedWorkDurationStored!,
        windowOnTop: settings.windowOnTop!));
  }

  void _onResetSettingsEvent(ResetSettings event, Emitter<RepoState> emit) {
    SettingsDataProvider().reset2Default();
    add(EmitStateWithDBVars());
  }
}
