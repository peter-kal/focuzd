import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/observer.dart';
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
    var settings = await settingsRepo.fetchSettings();
    switch (event.selectedToChange) {
      case 1:
        await settingsRepo.updateSetting(settings!.id,
            SettingsVariablesCompanion(windowOnTop: Value(event.changedVar)));
        break;
      case 2:
        await settingsRepo.updateSetting(
            settings!.id,
            SettingsVariablesCompanion(
                requestedNumberOfSessions: Value(event.changedVar)));
        break;
      case 3:
        await settingsRepo.updateSetting(
            settings!.id,
            SettingsVariablesCompanion(
                selectedBreakDurationStored: Value(event.changedVar)));
        break;
      case 4:
        await settingsRepo.updateSetting(
            settings!.id,
            SettingsVariablesCompanion(
                selectedFocusDurationStored: Value(event.changedVar)));
        break;
      case 5:
        await settingsRepo.updateSetting(
            settings!.id,
            SettingsVariablesCompanion(
                selectedLongBreakDurationStored: Value(event.changedVar)));
        break;

      default:
    }

    add(EmitStateWithDBVars());
  }

  Future<void> _onEmitStateWithDBVars(
      EmitStateWithDBVars event, Emitter<RepoState> emit) async {
    final has = await settingsRepo.fetchSettings();
    await subjectRepo.updateAllSubjectsSubSubjectCount();
    await subjectRepo.updateAllSubjectAddresses();
    final subjectList = await subjectRepo.fetchAllSubjects();
    final roundList = await roundRepo.fetchAllRounds();
    final tree =
        subjectRepo.buildSubjectTree(await subjectRepo.fetchAllSubjects());
    await goalRepo.updateGoals();
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
    var settings = await settingsRepo.fetchSettings();
    settingsRepo.updateSetting(
        settings!.id,
        SettingsVariablesCompanion(
          windowOnTop: Value(false),
          requestedNumberOfSessions: Value(4),
          selectedBreakDurationStored: Value(5),
          selectedLongBreakDurationStored: Value(15),
          selectedFocusDurationStored: Value(25),
        ));
    add(EmitStateWithDBVars());
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
      UpdateCreatingGoal event, Emitter<RepoState> emit) async {
    final state = this.state;
    if (state is CreateGoalState) {
      print("start: ${event.newMakeable.startPeriod1}");
      print("end: ${event.newMakeable.endPeriod1}");
      print("subjectIdZ: ${event.newMakeable.subjectIdZ}");
      if (event.newMakeable.type == 2 &&
          event.newMakeable.startPeriod1 != null &&
          event.newMakeable.endPeriod1 != null) {
        print("let's go");
        var s = await memoryRepo.getAllMemorySessionXPeriod(
            event.newMakeable.startPeriod1!, event.newMakeable.endPeriod1!);
        event.newMakeable.xSessionsR = s.length;
        if (event.newMakeable.startPeriod2 != null &&
            event.newMakeable.endPeriod2 != null &&
            event.newMakeable.xSessionsGoal != null &&
            event.newMakeable.xSessionsR != null) {
          print("lets go 2");
          event.newMakeable.plannedRatio =
              event.newMakeable.xSessionsGoal! / event.newMakeable.xSessionsR!;
        }
      }
      if (event.newMakeable.type == 5 &&
          event.newMakeable.startPeriod1 != null &&
          event.newMakeable.endPeriod1 != null &&
          event.newMakeable.subjectIdZ != null) {
        var s = await memoryRepo.getAllMemorySessionXPeriodZ(
            event.newMakeable.startPeriod1!,
            event.newMakeable.endPeriod1!,
            event.newMakeable.subjectIdZ!);
        event.newMakeable.xSessionsR = s.length;
        if (event.newMakeable.startPeriod2 != null &&
            event.newMakeable.endPeriod2 != null &&
            event.newMakeable.xSessionsGoal != null &&
            event.newMakeable.xSessionsR != null) {
          print("lets go 2");
          event.newMakeable.xSessionsR! > 0
              ? event.newMakeable.plannedRatio =
                  event.newMakeable.xSessionsGoal! /
                      event.newMakeable.xSessionsR!
              : event.newMakeable.plannedRatio =
                  event.newMakeable.xSessionsGoal! / 1;
        }
      }
      emit(CreateGoalState(
          makeable: event.newMakeable,
          nonContradictory: true,
          goals: state.goals,
          subjects: state.subjects));
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
            expired: Value(false),
            codeName: Value(event.goal.codeName!),
            type: Value(event.goal.type!),
            startPeriod2: Value(DateTime.now()),
            endPeriod2: Value(event.goal.endPeriod2!),
            xSessionsGoal: Value(event.goal.xSessionsGoal),
            ySessionsDone: Value(0)));
      } else if (event.goal.type == 2) {
        await goalRepo.insertGoal(GoalCompanion(
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
            expired: Value(false),
            codeName: Value(event.goal.codeName!),
            type: Value(event.goal.type!),
            startPeriod1: Value(event.goal.startPeriod1),
            endPeriod1: Value(event.goal.endPeriod1),
            startPeriod2: Value(event.goal.startPeriod2!),
            endPeriod2: Value(event.goal.endPeriod2!),
            xSessionsGoal: Value(event.goal.xSessionsGoal),
            xSessionsR: Value(event.goal.xSessionsR),
            plannedRatio: Value(event.goal.plannedRatio),
            realRatio: Value(0.0),
            ySessionsDone: Value(0)));
      } else if (event.goal.type == 3) {
        await goalRepo.insertGoal(GoalCompanion(
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
            expired: Value(false),
            codeName: Value(event.goal.codeName!),
            type: Value(event.goal.type!),
            startPeriod2: Value(DateTime.now()),
            endPeriod2: Value(event.goal.endPeriod2!),
            subjectIdZ: Value(event.goal.subjectIdZ),
            xSessionsZ: Value(0),
            xSessionsGoal: Value(event.goal.xSessionsGoal),
            ySessionsDone: Value(0)));
      } else if (event.goal.type == 4) {
        await goalRepo.insertGoal(GoalCompanion(
            expired: Value(false),
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
            ySessionsDone: Value(0),
            codeName: Value(event.goal.codeName!),
            type: Value(event.goal.type!),
            startPeriod2: Value(event.goal.startPeriod2!),
            endPeriod2: Value(event.goal.endPeriod2!),
            subjectIdF: Value(event.goal.subjectIdF),
            subjectIdZ: Value(event.goal.subjectIdZ),
            plannedRatio:
                Value(1 / event.goal.subjectFdenominator!), // 1 to 1.1
            subjectFDenominator: Value(event.goal.subjectFdenominator),
            subjectZNominator: Value(1),
            realRatio: Value(0.0)));
      } else if (event.goal.type == 5) {
        await goalRepo.insertGoal(GoalCompanion(
          expired: Value(false),
          createdAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
          ySessionsDone: Value(0),
          codeName: Value(event.goal.codeName!),
          type: Value(event.goal.type!),
          startPeriod1: Value(event.goal.startPeriod1),
          endPeriod1: Value(event.goal.endPeriod1),
          startPeriod2: Value(event.goal.startPeriod2!),
          endPeriod2: Value(event.goal.endPeriod2!),
          xSessionsGoal: Value(event.goal.xSessionsGoal),
          xSessionsR: Value(event.goal.xSessionsR),
          subjectIdZ: Value(event.goal.subjectIdZ),
          plannedRatio: Value(event.goal.plannedRatio), // 1 to 1.1
        ));
      }
      add(EmitStateWithDBVars());
    }
  }

  Future<void> _onAddingSubject(
      CreatingSubject event, Emitter<RepoState> emit) async {
    // Implement your logic to add a subject
    var sub = SubjectMaking(
        changeTime: 1,
        name: "Add Name",
        subid: null,
        address: "> ",
        durationOrigin: DurationOrigin.inherited,
        optionalTimes: false,
        optionalBreakTime: 5 * 60,
        optionalFocusTime: 25 * 60);
    emit(CreateSubjectState(
        subjects: await subjectRepo.fetchAllSubjects(), makeable: sub));
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
        optinalFocusTime: Value(state.makeable.optionalTimes == true
            ? state.makeable.optionalFocusTime
            : null),
        optinalBreakTime: Value(state.makeable.optionalTimes == true
            ? state.makeable.optionalBreakTime
            : null),
        linkSub: Value(state.makeable.linkId ?? null),
      ));
      if (state.makeable.alreadyDoneTime != null &&
          state.makeable.alreadyDoneTime != 0) {
        var subs = await subjectRepo.getTheLatestAdded();
        await subjectRepo.increaseSubjectTime(
          addedTime: state.makeable.alreadyDoneTime!,
          id: subs!.id,
        );
        if (state.makeable.linkId != null) {
          await subjectRepo.increaseSubjectTime(
            addedTime: state.makeable.alreadyDoneTime!,
            id: state.makeable.linkId!,
          );
        }
      }
    }
  }

  void _onUpdateAddingSubject(
      UpdateAddingSubject event, Emitter<RepoState> emit) async {
    final state = this.state;
    if (state is CreateSubjectState) {
      var updatedMakeable = event.newMakeable;

      // Handle super subject selection and inheritance
      if (updatedMakeable.subid != null) {
        // Fetch the parent subject from DB
        final subjectAtHand =
            await subjectRepo.fetchSubjectByID(updatedMakeable.subid!);

        if (subjectAtHand != null &&
            subjectAtHand.optinalFocusTime != null &&
            subjectAtHand.optinalBreakTime != null) {
          // Always inherit if not explicitly disabled manually
          if ((updatedMakeable.optionalTimes == false &&
              updatedMakeable.durationOrigin == DurationOrigin.inherited &&
              subjectAtHand.optinalFocusTime != null)) {
            updatedMakeable.optionalTimes = true;
            updatedMakeable.optionalFocusTime = subjectAtHand.optinalFocusTime!;
            updatedMakeable.optionalBreakTime =
                subjectAtHand.optinalBreakTime ?? 5;

            print("→ Inherited times from parent: "
                "focus=${updatedMakeable.optionalFocusTime}, "
                "break=${updatedMakeable.optionalBreakTime}");
          } else if (updatedMakeable.durationOrigin == DurationOrigin.manual) {
            print("entered");
            updatedMakeable.optionalBreakTime ??
                state.makeable.optionalBreakTime;
          }
        }

        // Build the addressoptionalTimes
        final address =
            await subjectRepo.getSubjectAddress(updatedMakeable.subid!);
        updatedMakeable.address = "$address > ${updatedMakeable.name}";
      } else {
        updatedMakeable.address = " > ${updatedMakeable.name}";
      }

      updatedMakeable.changeTime = state.makeable.changeTime + 1;

      emit(CreateSubjectState(
          makeable: updatedMakeable, subjects: state.subjects));
    }
  }

  Future<void> _onDeleteSubjectDB(
      DeleteSubjectDB event, Emitter<RepoState> emit) async {
    final state = this.state;
    if (state is RepoVariablesGivenState) {
      subjectRepo.deleteSubjectByID(event.id);
      var sub = await subjectRepo.fetchSubjectByID(event.id);
      if (sub!.linkSub != null) {
        subjectRepo.decreaseSubjectTime(
            id: sub.linkSub!, reducedTime: sub.totalTimeSpent);
      }
      add(EmitStateWithDBVars());
    }
  }
}
