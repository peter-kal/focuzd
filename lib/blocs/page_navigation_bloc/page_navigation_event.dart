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
