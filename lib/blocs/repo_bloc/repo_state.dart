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
      required this.nonContradictory,
      this.contradictions});
  final List<GoalData?> goals;
  final GoalMaking makeable;
  final List<SubjectData?> subjects;
  final bool nonContradictory;
  final List<Contradiction>? contradictions;
  @override
  String toString() =>
      "empty: ${contradictions!.isEmpty} length: ${contradictions!.length} noncon: $nonContradictory";
}

class RepoVariablesGivenState extends RepoState {
  const RepoVariablesGivenState(
      {required this.windowOnTop,
      required this.defaultNumberOfSessionsPerRound,
      required this.defaultBreakDurationStored,
      required this.defaultFocusDurationStored,
      required this.defaultLongBreakDuration,
      required this.overlapCDM,
      required this.atWillStart,
      this.subjectTree,
      this.subjects,
      this.roundsandsessions,
      this.goals});
  final bool windowOnTop;
  final int defaultNumberOfSessionsPerRound;
  final int defaultBreakDurationStored;
  final int defaultFocusDurationStored;
  final int defaultLongBreakDuration;
  final double overlapCDM;
  final bool atWillStart;
  final List<SubjectData>? subjects;
  final List<SubjectTreeNode>? subjectTree;
  final List<List<dynamic>>? roundsandsessions;
  final List<GoalData>? goals;
}
