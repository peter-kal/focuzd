import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:focuzd/data/app_db.dart';

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
    on<DataPageEvent>((event, emit) {
      // return the Data(History-Statistics) page
      emit(DataPageState());
      add(SelectDataPageEvent(index: 0));
    });
    on<RoundPlanningPageEvent>((event, emit) {
      emit(RoundPlanningPageState());
    });
    on<SubjectsAndGoalsPageEvent>((event, emit) {
      emit(SubjectsAndGoalsPageState());
    });
    on<SubjectsPageEvent>((event, emit) {
      emit(SubjectsPageState());
    });
    on<GoalsPageEvent>((event, emit) {
      emit(GoalsPageState());
    });
    on<SubjectPageEvent>((event, emit) {
      emit(SubjectPageState(subject: event.subject));
    });
    on<AddSubjectPageEvent>((event, emit) {
      emit(AddSubjectPageState());
    });
    on<SelectSubGoalPageEvent>((event, emit) {
      if (event.index == 0) {
        emit(SubjectsPageState());
      } else if (event.index == 1) {
        emit(GoalsPageState());
      }
    });
    on<SelectDataPageEvent>((event, emit) {
      if (event.index == 0) {
        emit(HistoryDataPageState());
      } else if (event.index == 1) {
        emit(StatisticsDataPageState());
      }
    });
  }
}
