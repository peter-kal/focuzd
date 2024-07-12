part of 'repo_bloc.dart';

sealed class RepoEvent extends Equatable {
  const RepoEvent();

  @override
  List<Object> get props => [];
}

class UpdateSettingVariables extends RepoEvent {
  const UpdateSettingVariables(
      {required this.selectedToChange, required this.changedVar});
  final int selectedToChange;
  final dynamic changedVar;

  @override
  List<Object> get props => [selectedToChange, changedVar];
}

class EmitStateWithDBVars extends RepoEvent {}
