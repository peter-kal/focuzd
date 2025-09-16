import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/extra_widgets/subject_tree_node.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:focuzd/data/repo.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';
import 'package:window_manager/window_manager.dart';

part 'repo_event.dart';
part 'repo_state.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  RepoBloc() : super(RepoInitial()) {
    on<EmitStateWithDBVars>(_onEmitStateWithDBVars);
    on<UpdateSettingVariables>(_onUpdateSettingsVariables);
    on<ResetSettings>(_onResetSettingsEvent);
    on<CreatingSubject>(_onAddingSubject);
    on<CreatingGoal>(_onCreatingGoal);
    on<UpdateCreatingGoal>(_onUpdateCreatingGoal);
    on<UpdateAddingSubject>(_onUpdateAddingSubject);
    on<AddSubjectToDB>(_onAddingSubjectToDB);
    on<SaveGoalToDB>(_onSaveGoalToDB);
    on<DeleteSubjectDB>(_onDeleteSubjectDB);
  }
  final settingsRepo = SettingsRepository(AppDatabase.instance);
  final memoryRepo = MemorySessionRepository(AppDatabase.instance);
  final subjectRepo = SubjectRepository(AppDatabase.instance);
  final roundRepo = RoundRepository(AppDatabase.instance);
  final outPlanningRepo = OutPlanningVariableRepo(AppDatabase.instance);
  final goalRepo = GoalRepository(AppDatabase.instance);
  void _onUpdateSettingsVariables(
      UpdateSettingVariables event, Emitter<RepoState> emit) async {
    switch (event.selectedToChange) {
      case 1:
        await settingsRepo.updateSetting(1,
            SettingsVariablesCompanion(windowOnTop: Value(event.changedVar)));
        break;
      case 2:
        await settingsRepo.updateSetting(
            1,
            SettingsVariablesCompanion(
                requestedNumberOfSessions: Value(event.changedVar)));
        break;
      case 3:
        await settingsRepo.updateSetting(
            1,
            SettingsVariablesCompanion(
                selectedBreakDurationStored: Value(event.changedVar)));
        break;
      case 4:
        await settingsRepo.updateSetting(
            1,
            SettingsVariablesCompanion(
                selectedFocusDurationStored: Value(event.changedVar)));
        break;
      case 5:
        await settingsRepo.updateSetting(
            1,
            SettingsVariablesCompanion(
                selectedLongBreakDurationStored: Value(event.changedVar)));
        break;

      default:
    }

    add(EmitStateWithDBVars());
  }

  Future<void> _onEmitStateWithDBVars(
      EmitStateWithDBVars event, Emitter<RepoState> emit) async {
    final has = await settingsRepo.fetchSettingsById(1);
    await subjectRepo.updateAllSubjectsSubSubjectCount();
    await subjectRepo.updateAllSubjectAddresses();
    final subjectList = await subjectRepo.fetchAllSubjects();
    final roundList = await roundRepo.fetchAllRounds();
    final tree =
        subjectRepo.buildSubjectTree(await subjectRepo.fetchAllSubjects());
    final goals = await goalRepo.fetchAllGoals();
    List<List<dynamic>> forEverything = [];

    for (int i = 0; i < roundList.length; i++) {
      List first = [];

      // Use correct round id
      var round = await roundRepo.fetchRoundById(roundList[i].id);
      first.add(round);

      // Add memory countdowns
      first.addAll(
          await memoryRepo.fetchMemoryCountdownByRoundID(roundList[i].id));

      // Collect out planning variables for each item in first
      List<dynamic> expandedFirst = [];
      for (var item in first) {
        expandedFirst.add(item);
        var second =
            await outPlanningRepo.fetchOutPlanningsByCountdownID(item.id);
        if (second.isNotEmpty) {
          expandedFirst.addAll(second);
        }
      }

      forEverything.add(expandedFirst);
    }

    WindowOptions options = WindowOptions(
      alwaysOnTop: has!.windowOnTop,
    );
    await windowManager.waitUntilReadyToShow(options, () async {
      windowManager.focus();
      windowManager.show();
    });

    emit(RepoVariablesGivenState(
      requestedNumberOfSessions: has.requestedNumberOfSessions,
      selectedBreakDurationStored: has.selectedBreakDurationStored,
      selectedLongBreakDuration: has.selectedLongBreakDurationStored,
      selectedFocusDurationStored: has.selectedFocusDurationStored,
      windowOnTop: has.windowOnTop,
      subjectTree: tree,
      subjects: subjectList,
      roundsandsessions: forEverything,
      goals: goals,
    ));
  }

  void _onResetSettingsEvent(
      ResetSettings event, Emitter<RepoState> emit) async {
    settingsRepo.updateSetting(
        1,
        SettingsVariablesCompanion(
          windowOnTop: Value(false),
          requestedNumberOfSessions: Value(4),
          selectedBreakDurationStored: Value(5),
          selectedLongBreakDurationStored: Value(15),
          selectedFocusDurationStored: Value(25),
        ));
    add(EmitStateWithDBVars());
  }

  Future<void> _onAddingSubject(
      CreatingSubject event, Emitter<RepoState> emit) async {
    // Implement your logic to add a subject
    var sub = SubjectMaking(
        name: "Add Name", subid: null, address: "> ", optionalTimes: false);
    emit(CreateSubjectState(
        subjects: await subjectRepo.fetchAllSubjects(), makeable: sub));
  }

  Future<void> _onCreatingGoal(
      CreatingGoal event, Emitter<RepoState> emit) async {
    // Implement your logic to add a subject

    var sub = GoalMaking();
    emit(CreateGoalState(
        goals: await goalRepo.fetchAllGoals(),
        subjects: await subjectRepo.fetchAllSubjects(),
        nonContradictory: true,
        makeable: sub));
  }

  void _onUpdateCreatingGoal(
      UpdateCreatingGoal event, Emitter<RepoState> emit) {
    final state = this.state;
    if (state is CreateGoalState) {
      emit(CreateGoalState(
          makeable: event.newMakeable,
          nonContradictory: true,
          goals: state.goals,
          subjects: state.subjects));
    }
  }

  Future<void> _onAddingSubjectToDB(
      AddSubjectToDB event, Emitter<RepoState> emit) async {
    // Implement your logic to add a subject
    final state = this.state;
    if (state is CreateSubjectState) {
      await subjectRepo.insertSubject(SubjectCompanion(
        name: Value(state.makeable.name),
        superSubjectID: Value(state.makeable.subid),
        address: Value(state.makeable.address!),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ));
    }
  }

  Future<void> _onSaveGoalToDB(
      SaveGoalToDB event, Emitter<RepoState> emit) async {
    final state = this.state;
    if (state is CreateGoalState) {
      if (event.goal.type == 1) {
        await goalRepo.insertGoal(GoalCompanion(
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
            codeName: Value(event.goal.codeName!),
            type: Value(event.goal.type!),
            startPeriod2: Value(DateTime.now()),
            endPeriod2: Value(event.goal.endPeriod2!),
            xSessionsGoal: Value(event.goal.xSessionsGoal),
            ySessionsDone: Value(0)));
      }
    }
  }

  void _onUpdateAddingSubject(
      UpdateAddingSubject event, Emitter<RepoState> emit) async {
    final state = this.state;
    if (state is CreateSubjectState) {
      if (event.newMakeable.subid != null) {
        var addr =
            await subjectRepo.getSubjectAddress(event.newMakeable.subid!);
        event.newMakeable.address = "$addr > ${state.makeable.name}";
      } else {
        event.newMakeable.address = " > ${event.newMakeable.name}";
      }
      if (event.newMakeable.optionalTimes != state.makeable.optionalTimes &&
          event.newMakeable.optionalTimes == true) {
        var settings = await settingsRepo.fetchSettingsById(1);
        int focus = settings?.selectedFocusDurationStored ?? 25;
        int breakT = settings?.selectedBreakDurationStored ?? 5;
        event.newMakeable.optionalBreakTime = breakT * 60;
        event.newMakeable.optionalFocusTime = focus * 60;
      }
      emit(CreateSubjectState(
          makeable: event.newMakeable, subjects: state.subjects));
    }
  }

  Future<void> _onDeleteSubjectDB(
      DeleteSubjectDB event, Emitter<RepoState> emit) async {
    final state = this.state;
    if (state is RepoVariablesGivenState) {
      subjectRepo.deleteSubjectByID(event.id);
      add(EmitStateWithDBVars());
    }
  }
}
