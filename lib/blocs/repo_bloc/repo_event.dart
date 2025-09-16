part of 'repo_bloc.dart';

sealed class RepoEvent {
  const RepoEvent();
}

class UpdateSettingVariables extends RepoEvent {
  const UpdateSettingVariables(
      {required this.selectedToChange, required this.changedVar});
  final int selectedToChange;
  final dynamic changedVar;
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
  const UpdateAddingSubject({required this.newMakeable});
  final SubjectMaking newMakeable;

  @override
  String toString() =>
      "name: ${newMakeable.name}, optionalTimes: ${newMakeable.optionalTimes} super: ${newMakeable.subid}";
}

class UpdateCreatingGoal extends RepoEvent {
  const UpdateCreatingGoal({required this.newMakeable});
  final GoalMaking newMakeable;

  @override
  String toString() =>
      "type: ${newMakeable.type}, codename: ${newMakeable.codeName} ";
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
}
