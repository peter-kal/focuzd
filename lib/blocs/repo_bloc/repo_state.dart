part of 'repo_bloc.dart';

sealed class RepoState extends Equatable {
  const RepoState();

  @override
  List<Object> get props => [];
}

final class RepoInitial extends RepoState {}

class CreateSubjectState extends RepoState {
  const CreateSubjectState({required this.subjects, required this.makeable});
  final List<SubjectData?> subjects;
  final SubjectMaking makeable;
  @override
  List<Object> get props => [subjects, makeable];
}

class RepoVariablesGivenState extends RepoState {
  const RepoVariablesGivenState(
      {required this.windowOnTop,
      required this.requestedNumberOfSessions,
      required this.selectedBreakDurationStored,
      required this.selectedFocusDurationStored,
      required this.selectedLongBreakDuration,
      this.subjects,
      this.roundsandsessions});
  final bool windowOnTop;
  final int requestedNumberOfSessions;
  final int selectedBreakDurationStored;
  final int selectedFocusDurationStored;
  final int selectedLongBreakDuration;
  final List<SubjectData>? subjects;
  final List<List<dynamic>>? roundsandsessions;
  @override
  List<Object> get props => [
        windowOnTop,
        requestedNumberOfSessions,
        selectedBreakDurationStored,
        selectedFocusDurationStored,
        selectedLongBreakDuration,
        subjects!,
        roundsandsessions!
      ];
}
