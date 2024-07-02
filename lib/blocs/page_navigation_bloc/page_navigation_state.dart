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
