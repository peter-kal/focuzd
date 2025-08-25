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

class AddingSubject extends RepoEvent {
  const AddingSubject();
}

class UpdateAddingSubject extends RepoEvent {
  const UpdateAddingSubject(this.actionCode, this.subId, this.name);
  final String name;
  final int subId;
  final int actionCode;
}

class AddSubjectToDB extends RepoEvent {
  const AddSubjectToDB();
}
