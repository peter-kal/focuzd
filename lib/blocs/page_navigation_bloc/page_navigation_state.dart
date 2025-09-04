part of 'page_navigation_bloc.dart';

@immutable
sealed class PageNavigationState extends Equatable {
  const PageNavigationState();

  @override
  List<Object> get props => [];
}

final class PageNavigationInitial extends PageNavigationState {}

class MainPageState extends PageNavigationState {}

class SettingsPageState extends PageNavigationState {}

class DataPageState extends PageNavigationState {}

class HistoryDataPageState extends PageNavigationState {}

class StatisticsDataPageState extends PageNavigationState {}

class RoundPlanningPageState extends PageNavigationState {}

class SubjectsAndGoalsPageState extends PageNavigationState {}

class GoalsPageState extends PageNavigationState {}

class SubjectsPageState extends PageNavigationState {}

class AddSubjectPageState extends PageNavigationState {}

class SubjectPageState extends PageNavigationState {
  const SubjectPageState({required this.subject});
  final SubjectData subject;

  @override
  List<Object> get props => [subject];
}
