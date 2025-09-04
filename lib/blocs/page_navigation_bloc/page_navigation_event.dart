part of 'page_navigation_bloc.dart';

@immutable
sealed class PageNavigationEvent extends Equatable {
  const PageNavigationEvent();

  @override
  List<Object> get props => [];
}

class MainPageEvent extends PageNavigationEvent {
  const MainPageEvent();

  @override
  List<Object> get props => [];
}

class SettingsPageEvent extends PageNavigationEvent {
  const SettingsPageEvent();

  @override
  List<Object> get props => [];
}

class DataPageEvent extends PageNavigationEvent {
  const DataPageEvent();

  @override
  List<Object> get props => [];
}

class SelectDataPageEvent extends PageNavigationEvent {
  const SelectDataPageEvent({required this.index});
  final int index;
  @override
  List<Object> get props => [index];
}

class SelectSubGoalPageEvent extends PageNavigationEvent {
  const SelectSubGoalPageEvent({required this.index});
  final int index;
  @override
  List<Object> get props => [index];
}

class SubjectsAndGoalsPageEvent extends PageNavigationEvent {
  const SubjectsAndGoalsPageEvent();

  @override
  List<Object> get props => [];
}

class SubjectsPageEvent extends PageNavigationEvent {
  const SubjectsPageEvent();

  @override
  List<Object> get props => [];
}

class GoalsPageEvent extends PageNavigationEvent {
  const GoalsPageEvent();

  @override
  List<Object> get props => [];
}

class SubjectPageEvent extends PageNavigationEvent {
  const SubjectPageEvent({required this.subject});
  final SubjectData subject;
  @override
  List<Object> get props => [subject];
}

class AddSubjectPageEvent extends PageNavigationEvent {
  const AddSubjectPageEvent();

  @override
  List<Object> get props => [];
}

class RoundPlanningPageEvent extends PageNavigationEvent {
  const RoundPlanningPageEvent();

  @override
  List<Object> get props => [];
}
