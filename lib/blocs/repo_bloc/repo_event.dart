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

final class EmitStateWithDBVars extends RepoEvent {
  const EmitStateWithDBVars();
}

class ResetSettings extends RepoEvent {}

class CreatingSubject extends RepoEvent {
  const CreatingSubject();
}

class CreatingGoal extends RepoEvent {
  const CreatingGoal();
}

class UpdateAddingSubject extends RepoEvent {
  const UpdateAddingSubject(this.actionCode, this.subId, this.name);
  final String name;
  final int subId;
  final int actionCode;
  @override
  List<Object> get props => [name, subId, actionCode];
}

class UpdateCreatingGoal extends RepoEvent {
  const UpdateCreatingGoal({required this.newMakeable});
  final GoalMaking newMakeable;
  @override
  List<Object> get props => [newMakeable];
  @override
  String toString() =>
      "type: ${newMakeable.type}, codename: ${newMakeable.codeName}";
}

class AddSubjectToDB extends RepoEvent {
  const AddSubjectToDB();
}

class SaveGoalToDB extends RepoEvent {
  const SaveGoalToDB({required this.goal});
  final GoalMaking goal;
}

class DeleteSubjectDB extends RepoEvent {
  const DeleteSubjectDB({required this.id});
  final int id;
  @override
  List<Object> get props => [id];
}
