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
      required this.selectedWorkDurationStored,
      required this.selectedLongBreakDuration,
      this.sessions});
  final bool windowOnTop;
  final int requestedNumberOfSessions;
  final int selectedBreakDurationStored;
  final int selectedWorkDurationStored;
  final int selectedLongBreakDuration;
  final List<MemorySessionVariableData>? sessions;

  @override
  List<Object> get props => [
        windowOnTop,
        requestedNumberOfSessions,
        selectedBreakDurationStored,
        selectedWorkDurationStored,
        selectedLongBreakDuration,
        sessions!
      ];
}
