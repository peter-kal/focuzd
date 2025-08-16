part of 'repo_bloc.dart';

sealed class RepoState extends Equatable {
  const RepoState();

  @override
  List<Object> get props => [];
}

final class RepoInitial extends RepoState {}

class RepoVariablesGivenState extends RepoState {
  const RepoVariablesGivenState(
      {required this.windowOnTop,
      required this.requestedNumberOfSessions,
      required this.selectedBreakDurationStored,
      required this.selectedFocusDurationStored,
      required this.selectedLongBreakDuration,
      this.sessions});
  final bool windowOnTop;
  final int requestedNumberOfSessions;
  final int selectedBreakDurationStored;
  final int selectedFocusDurationStored;
  final int selectedLongBreakDuration;
  final List<MemoryCountdownVariableData>? sessions;

  @override
  List<Object> get props => [
        windowOnTop,
        requestedNumberOfSessions,
        selectedBreakDurationStored,
        selectedFocusDurationStored,
        selectedLongBreakDuration,
        sessions!
      ];
}
