part of 'repo_bloc.dart';

sealed class RepoState {
  const RepoState();
}

final class RepoInitial extends RepoState {}

class CreateSubjectState extends RepoState {
  const CreateSubjectState({required this.subjects, required this.makeable});
  final List<SubjectData?> subjects;
  final SubjectMaking makeable;
  @override
  String toString() =>
      "name:${makeable.name}  optional:${makeable.optionalTimes}, focus:${makeable.optionalFocusTime} optional break: ${makeable.optionalBreakTime} subid: ${makeable.subid} origin: ${makeable.durationOrigin}";
}

class CreateGoalState extends RepoState {
  const CreateGoalState(
      {required this.goals,
      required this.makeable,
      required this.subjects,
      required this.nonContradictory});
  final List<GoalData?> goals;
  final GoalMaking makeable;
  final List<SubjectData?> subjects;
  final bool nonContradictory;
}

class RepoVariablesGivenState extends RepoState {
  const RepoVariablesGivenState(
      {required this.windowOnTop,
      required this.requestedNumberOfSessions,
      required this.selectedBreakDurationStored,
      required this.selectedFocusDurationStored,
      required this.selectedLongBreakDuration,
      this.subjectTree,
      this.subjects,
      this.roundsandsessions,
      this.goals});
  final bool windowOnTop;
  final int requestedNumberOfSessions;
  final int selectedBreakDurationStored;
  final int selectedFocusDurationStored;
  final int selectedLongBreakDuration;
  final List<SubjectData>? subjects;
  final List<SubjectTreeNode>? subjectTree;
  final List<List<dynamic>>? roundsandsessions;
  final List<GoalData>? goals;
}
