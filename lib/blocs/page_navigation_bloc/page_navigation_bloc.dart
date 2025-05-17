import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'page_navigation_event.dart';
part 'page_navigation_state.dart';

class PageNavigationBloc
    extends Bloc<PageNavigationEvent, PageNavigationState> {
  PageNavigationBloc() : super(PageNavigationInitial()) {
    on<MainPageEvent>((event, emit) async {
      emit(MainPageState());
    });
    on<SettingsPageEvent>((event, emit) {
      emit(SettingsPageState());
    });
    on<HistoryPageEvent>((event, emit) {
      emit(HistoryPageState());
    });
  }
}
