import 'package:drift/drift.dart';
import 'package:focuzd/extra_widgets/subject_tree_node.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';

import 'app_db.dart';

class GoalRepository {
  final AppDatabase _db;
  GoalRepository(this._db);

  Future<void> updateGoal(String id, GoalCompanion updatedGoal) async {
    await (_db.update(_db.goal)..where((tbl) => tbl.id.equals(id)))
        .write(updatedGoal);
  }

  Future<void> insertGoal(GoalCompanion goal) async {
    await _db.into(_db.goal).insert(goal);
  }

  Future<List<Contradiction>> detectContradictions(GoalMaking making) async {
    final contradictions = <Contradiction>[];
    List<GoalData> existingGoals = await GoalRepository(_db).fetchAllGoals();
    for (final goal in existingGoals) {
      print(
          "shouldTest: ${shouldTestForContradiction(making.startPeriod2!, making.endPeriod2!, goal.startPeriod2, goal.endPeriod2)}");
      print(
          "overlap: ${overlapBetweenGoals(making.startPeriod2!, making.endPeriod2!, goal.startPeriod2, goal.endPeriod2)}");
      print(
          "xStart ${making.startPeriod2}, xend: ${making.endPeriod2}, yStart:${goal.startPeriod2}, yend:${goal.endPeriod2}");
      if (shouldTestForContradiction(making.startPeriod2!, making.endPeriod2!,
          goal.startPeriod2, goal.endPeriod2)) {
        print("entered");
        // Rule: t1 ↔ t2 (static vs dialectic total)
        if ((goal.type == 1 && making.type == 2) ||
            (goal.type == 2 && making.type == 1)) {
          if ((goal.xSessionsGoal ?? 0) != (making.xSessionsGoal ?? 0)) {
            contradictions
                .add(Contradiction(goal, "t1Xy vs t2Xy total mismatch"));
          }
        }

        // rule: t1Xy/t2Xy <-> t1Xy/t2Xy
        if ((goal.type == 1 || goal.type == 2) &&
            (making.type == 1 || making.type == 2)) {
          contradictions.add(
              Contradiction(goal, "duplicate ${making.type} ${goal.type}"));
        }

        // Rule: t1/t2 ↔ t3,t5 (subject overload)
        if ((goal.type == 1 || goal.type == 2) &&
            (making.type == 3 || making.type == 5)) {
          print("entered in repo");
          print(making.xSessionsGoal);
          print(goal.xSessionsGoal);
          if ((making.xSessionsGoal ?? 0) > (goal.xSessionsGoal ?? 0)) {
            contradictions.add(Contradiction(
                goal, "Subject goal exceeds total session goal",
                suggestedFix:
                    "Make the X goal be less or equal to ${goal.xSessionsGoal}"));
          }
        }

        // Rule: t3 ↔ t3 (duplicate subject)
        if (goal.type == 3 &&
            making.type == 3 &&
            goal.subjectIdZ == making.subjectIdZ) {
          contradictions.add(
              Contradiction(goal, "Duplicate subject goal in same period"));
        }

        // Rule: t5 ↔ t5 (duplicate subject)
        if (goal.type == 5 &&
            making.type == 5 &&
            goal.subjectIdZ == making.subjectIdZ) {
          contradictions.add(
              Contradiction(goal, "Duplicate subject goal t5 in same period"));
        }

        // Rule: t4 ↔ t4 (reciprocal contradiction)
        if (goal.type == 4 &&
            making.type == 4 &&
            goal.subjectIdZ == making.subjectIdF &&
            goal.subjectIdF == making.subjectIdZ) {
          contradictions
              .add(Contradiction(goal, "Duplicate ratio contradiction"));
        }
        // Rule: t5zXy <-> t3zXy
        if ((making.type == 3 && goal.type == 5) ||
            (making.type == 5 && goal.type == 3)) {
          if ((goal.xSessionsGoal ?? 0) != (making.xSessionsGoal ?? 0)) {
            contradictions.add(Contradiction(
                goal, "${goal.type} vs ${making.type} total mismatch"));
          }
        }
        if (making.type == 4) {
          print("entered t4");

          double sumForSubject(String? subjectId) => existingGoals
              .where((g) =>
                  (g.type == 3 || g.type == 5) &&
                  g.subjectIdZ == subjectId &&
                  shouldTestForContradiction(g.startPeriod2, g.endPeriod2,
                      making.startPeriod2!, making.endPeriod2!))
              .map((g) => g.xSessionsGoal ?? 0)
              .fold(0.0, (a, b) => a + b);

          final totalDerived = sumForSubject(making.subjectIdZ) +
              sumForSubject(making.subjectIdF);

          final totalBase = existingGoals
              .where((g) =>
                  (g.type == 1 || g.type == 2) &&
                  (g.subjectIdZ == making.subjectIdZ ||
                      g.subjectIdZ == making.subjectIdF) &&
                  shouldTestForContradiction(g.startPeriod2, g.endPeriod2,
                      making.startPeriod2!, making.endPeriod2!))
              .map((g) => g.xSessionsGoal ?? 0)
              .fold(0.0, (a, b) => a + b);

          if (totalDerived > totalBase) {
            contradictions.add(Contradiction(goal,
                "Derived subject sessions exceed t1/t2 total : $totalBase, $totalDerived",
                suggestedFix: "de"));
          }
        }
      }
    }
    return contradictions;
  }

  Future<void> updateGoals() async {
    var goals = await fetchAllGoals();
    for (var goal in goals) {
      if (goal.type == 1) {
        var focuses = await MemorySessionRepository(_db)
            .getAllMemorySessionXPeriod(goal.startPeriod2, goal.endPeriod2);
        await updateGoal(
            goal.id,
            GoalCompanion(
                updatedAt: Value(DateTime.now()),
                expired: Value(
                    goal.endPeriod2.isBefore(DateTime.now()) ? true : false),
                ySessionsDone: Value(focuses.length),
                successPercentage:
                    Value((focuses.length / goal.xSessionsGoal!) * 100)));
      }
      if (goal.type == 2) {
        var focuses = await MemorySessionRepository(_db)
            .getAllMemorySessionXPeriod(goal.startPeriod2, goal.endPeriod2);
        await updateGoal(
            goal.id,
            GoalCompanion(
                updatedAt: Value(DateTime.now()),
                expired: Value(
                    goal.endPeriod2.isBefore(DateTime.now()) ? true : false),
                ySessionsDone: Value(focuses.length),
                realRatio: Value(focuses.length / goal.xSessionsR!),
                successPercentage:
                    Value((focuses.length / goal.xSessionsGoal!) * 100)));
      } else if (goal.type == 3) {
        var focuses = await MemorySessionRepository(_db)
            .getAllMemorySessionXPeriodZ(
                goal.startPeriod2, goal.endPeriod2, goal.subjectIdZ!);

        await updateGoal(
            goal.id,
            GoalCompanion(
                updatedAt: Value(DateTime.now()),
                expired: Value(
                    goal.endPeriod2.isBefore(DateTime.now()) ? true : false),
                ySessionsDone: Value(focuses.length),
                xSessionsZ: Value(focuses.length),
                successPercentage:
                    Value((focuses.length / goal.xSessionsGoal!) * 100)));
      } else if (goal.type == 4) {
        var focuses = await MemorySessionRepository(_db)
            .getAllMemorySessionXPeriodZ(
                goal.startPeriod2, goal.endPeriod2, goal.subjectIdZ!);
        var ffocuses = await MemorySessionRepository(_db)
            .getAllMemorySessionXPeriodZ(
                goal.startPeriod2, goal.endPeriod2, goal.subjectIdF!);
        await updateGoal(
            goal.id,
            GoalCompanion(
              updatedAt: Value(DateTime.now()),
              expired: Value(
                  goal.endPeriod2.isBefore(DateTime.now()) ? true : false),
              ySessionsDone: Value(focuses.length + ffocuses.length),
              xSessionsZ: Value(focuses.length),
              xSessionsF: Value(ffocuses.length),
              realRatio: Value((focuses.length / ffocuses.length).isNaN == true
                  ? 1 / 1
                  : (focuses.length / ffocuses.length)),
            ));
      } else if (goal.type == 5) {
        var focuses = await MemorySessionRepository(_db)
            .getAllMemorySessionXPeriodZ(
                goal.startPeriod2, goal.endPeriod2, goal.subjectIdZ!);
        await updateGoal(
            goal.id,
            GoalCompanion(
                updatedAt: Value(DateTime.now()),
                expired: Value(
                    goal.endPeriod2.isBefore(DateTime.now()) ? true : false),
                ySessionsDone: Value(focuses.length),
                xSessionsZ: Value(focuses.length),
                realRatio: Value(goal.xSessionsR != 0
                    ? focuses.length / (goal.xSessionsR ?? 1)
                    : focuses.length / 1),
                successPercentage:
                    Value((focuses.length / goal.xSessionsGoal!) * 100)));
      }
    }
  }

  Future<List<GoalData>> fetchAllGoals() async {
    return await (_db.select(_db.goal)
          ..orderBy([(s) => OrderingTerm.asc(s.endPeriod2)])
          ..orderBy([(s) => OrderingTerm.desc(s.createdAt)]))
        .get();
  }
}

class SubjectRepository {
  final AppDatabase _db;
  SubjectRepository(this._db);

  List<SubjectTreeNode> buildSubjectTree(List<SubjectData> subjects) {
    // Step 1: Create a map from id to node for fast lookup
    final Map<String, SubjectTreeNode> nodeMap = {};

    // Step 2: Create all nodes and store them in the map
    for (final subject in subjects) {
      nodeMap[subject.id] = SubjectTreeNode(
        title: subject.name,
        id: subject.id,
        subSubjects: subject.subSubjects,
        subject: subject,
        sessions: subject.sessions,
        superId:
            subject.superSubjectID, // Add this to your SubjectTreeNode class
        totalTimeSpent: subject.totalTimeSpent,
        updatedAt: subject.updatedAt,
        optionalFocusTime: subject.optinalFocusTime,
        optionalBreakTime: subject.optinalBreakTime,
        children: [],
      );
    }

    // Step 3: Link children to their parents
    final List<SubjectTreeNode> roots = [];

    for (final node in nodeMap.values) {
      if (node.superId != null && nodeMap.containsKey(node.superId)) {
        final parentNode = nodeMap[node.superId]!;
        parentNode.children.add(node);
      } else {
        roots.add(node); // No parent means it's a root node
      }
    }

    return roots;
  }

  String? _getParentAddress(String address) {
    final parts = address.split('>');
    if (parts.length <= 1) return null;
    return parts.sublist(0, parts.length - 1).join('>');
  }

  Future<SubjectData?> fetchSubjectByID(String id) async {
    return await (_db.select(_db.subject)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<SubjectData?> getTheLatestAdded() async {
    return await (_db.select(_db.subject)
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<void> deleteSubjectByID(String id) async {
    var sub = await fetchSubjectByID(id);
    if (sub!.totalTimeSpent != 0) {
      await decreaseSubjectTime(reducedTime: sub.totalTimeSpent, id: id);
    }
    _db.delete(_db.subject)
      ..where((tbl) => tbl.id.equals(id))
      ..go();
  }

  Future<void> insertSubject(SubjectCompanion subject) async {
    await _db.into(_db.subject).insert(subject);
  }

  Future<List<SubjectData>> fetchSubSubjects(String id) async {
    return await (_db.select(_db.subject)
          ..where((tbl) => tbl.superSubjectID.equals(id))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .get();
  }

  Future<int> countSubSubjects(String subjectId) async {
    // Get direct sub-subjects
    var subSubjects = await (_db.select(_db.subject)
          ..where((tbl) => tbl.superSubjectID.equals(subjectId)))
        .get();

    int count = subSubjects.length;

    // Recursively count sub-subjects of each sub-subject
    for (var sub in subSubjects) {
      count += await countSubSubjects(sub.id);
    }

    return count;
  }

  Future<void> updateAllSubjectsSubSubjectCount() async {
    // Step 1: Fetch all subjects
    final allSubjects = await fetchAllSubjects();

    // Step 2: Loop through each subject and update its subSubjects count
    for (var subject in allSubjects) {
      var count = await countSubSubjects(subject.id);
      var updatedSubject = SubjectCompanion(
        subSubjects: Value(count),
        updatedAt: Value(DateTime.now()),
      );

      await editSubjectWrite(subject.id, updatedSubject);
    }
  }

  Future<void> increaseSubjectTime(
      // tree structure
      {required int addedTime,
      required String id,
      String? sessionId}) async {
    var subject = await fetchSubjectByID(id);
    print("start");
    print(addedTime);
    await editSubjectWrite(
        id,
        SubjectCompanion(
            lastFocuzdOnSessionID: Value(sessionId),
            totalTimeSpent: Value((subject?.totalTimeSpent ?? 0) + addedTime),
            updatedAt: Value(DateTime.now())));

    if (subject!.superSubjectID != null) {
      print("will repeat");
      print(addedTime);
      increaseSubjectTime(
          addedTime: addedTime,
          id: subject.superSubjectID!,
          sessionId: sessionId);
    }
  }

  Future<void> decreaseSubjectTime(
      {required int reducedTime, required String id}) async {
    var subject = await fetchSubjectByID(id);
    await editSubjectWrite(
        id,
        SubjectCompanion(
            totalTimeSpent: Value((subject?.totalTimeSpent ?? 0) - reducedTime),
            updatedAt: Value(DateTime.now())));

    if (subject!.superSubjectID != null) {
      decreaseSubjectTime(
        reducedTime: reducedTime,
        id: subject.superSubjectID!,
      );
    }
  }

  Future<void> increaseSessionCount(
      // tree structure
      {
    required String id,
  }) async {
    var subject = await fetchSubjectByID(id);
    print("start");
    int sessions = subject!.sessions;
    await editSubjectWrite(
        id,
        SubjectCompanion(
            sessions: Value(sessions + 1), updatedAt: Value(DateTime.now())));
    if (subject.superSubjectID != null) {
      print("will repeat");
      increaseSessionCount(
        id: subject.superSubjectID!,
      );
    }
  }

  Future<String> getSubjectAddress(String subjectId) async {
    List<String> path = [];

    var current = await fetchSubjectByID(subjectId);

    while (current != null) {
      path.insert(0, current.name); // safely unwrap

      final parentId = current.superSubjectID;
      if (parentId == null) break;

      current = await (_db.select(_db.subject)
            ..where((tbl) => tbl.id.equals(parentId)))
          .getSingleOrNull();
    }

    return path.join(' > ');
  }

  Future<void> updateAllSubjectAddresses() async {
    var allSubjects = await fetchAllSubjects();

    for (var subject in allSubjects) {
      var address = await getSubjectAddress(subject.id);

      var updatedSubject = SubjectCompanion(
        address: Value(address),
        updatedAt: Value(DateTime.now()),
      );

      await editSubjectWrite(subject.id, updatedSubject);
    }
  }

  Future<void> editSubjectWrite(
      String id, SubjectCompanion updatedSubject) async {
    await (_db.update(_db.subject)..where((tbl) => tbl.id.equals(id)))
        .write(updatedSubject);
  }

  Future<List<SubjectData>> fetchAllSubjects() async {
    return await (_db.select(_db.subject)
          ..orderBy([(s) => OrderingTerm.desc(s.totalTimeSpent)])
          ..orderBy([(s) => OrderingTerm.desc(s.subSubjects)])
          ..orderBy([(s) => OrderingTerm.desc(s.lastFocuzdOnSessionID)]))
        .get();
  }
}

class OutPlanningVariableRepo {
  final AppDatabase _db;
  OutPlanningVariableRepo(this._db);

  Future<List<OutPlanningVariableData>> fetchOutPlanningsByCountdownID(
      String id) async {
    return await (_db.select(_db.outPlanningVariable)
          ..where((tbl) => tbl.memoryCountdownID.equals(id)))
        .get();
  }

  Future<List<OutPlanningVariableData>> fetchAllOutPlannings() async {
    return await _db.select(_db.outPlanningVariable).get();
  }

  Future<void> updateOutPlanning(String outPlanningID,
      OutPlanningVariableCompanion updatedOutPlanning) async {
    await (_db.update(_db.outPlanningVariable)
          ..where((tbl) => tbl.id.equals(outPlanningID)))
        .write(updatedOutPlanning);
  }

  Future<void> insertOutPlanning(
      OutPlanningVariableCompanion outplanning) async {
    await _db.into(_db.outPlanningVariable).insert(outplanning);
  }

  Future<OutPlanningVariableData?> getActiveOutPlanning(String id) async {
    return await (_db.select(_db.outPlanningVariable)
          ..where((tbl) => tbl.memoryCountdownID.equals(id))
          ..where((tbl) => tbl.isActive.equals(true)))
        .getSingleOrNull();
  }
}

class SettingsRepository {
  final AppDatabase _db;

  SettingsRepository(this._db);

  Future<SettingsVariable?> fetchSettings() async {
    return await (_db.select(_db.settingsVariables).getSingleOrNull());
  }

  Future<void> updateSetting(
      String id, SettingsVariablesCompanion updatedSetting) async {
    await (_db.update(_db.settingsVariables)..where((tbl) => tbl.id.equals(id)))
        .write(updatedSetting);
  }
  // Fetch settings by ID

  // Update a specific setting

  // Delete settings by ID
  Future<void> deleteSettingsById(String id) async {
    await (_db.delete(_db.settingsVariables)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}

class MemorySessionRepository {
  final AppDatabase _db;

  MemorySessionRepository(this._db);

  // Insert a new memory session
  Future<void> insertMemorySession(
      MemoryCountdownVariableCompanion session) async {
    await _db.into(_db.memoryCountdownVariable).insert(session);
  }

  // Fetch all memory sessions
  Future<List<MemoryCountdownVariableData>> fetchAllMemorySessions() async {
    return await _db.select(_db.memoryCountdownVariable).get();
  }

  Future<List<MemoryCountdownVariableData?>> getAllMemorySessionXPeriod(
      DateTime a, DateTime b) async {
    return await (_db.select(_db.memoryCountdownVariable)
          ..where((tbl) => tbl.completed.equals(true))
          ..where((tbl) => tbl.finishTime.isBiggerThanValue(a))
          ..where((tbl) => tbl.type.equals("focus"))
          ..where((tbl) => tbl.finishTime.isSmallerThanValue(b)))
        .get();
  }

  Future<List<MemoryCountdownVariableData?>> getAllMemorySessionXPeriodZ(
      DateTime a, DateTime b, String z) async {
    return await (_db.select(_db.memoryCountdownVariable)
          ..where((tbl) => tbl.completed.equals(true))
          ..where((tbl) => tbl.finishTime.isBiggerThanValue(a))
          ..where((tbl) => tbl.type.equals("focus"))
          ..where((tbl) => tbl.subject.equals(z))
          ..where((tbl) => tbl.finishTime.isSmallerThanValue(b)))
        .get();
  }

  Future<MemoryCountdownVariableData?> getNextSession(
      String currentSessionId, String roundId) async {
    final current = await fetchMemorySessionById(currentSessionId);
    if (current == null) return null;

    return await (_db.select(_db.memoryCountdownVariable)
          ..where((tbl) => tbl.roundId.equals(roundId))
          ..where((tbl) =>
              tbl.roundRunTime.isBiggerThan(Variable(current.roundRunTime)))
          ..orderBy([(t) => OrderingTerm.asc(t.roundRunTime)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<List<MemoryCountdownVariableData>> fetchMemoryCountdownsBySubject(
      String id) async {
    return await (_db.select(_db.memoryCountdownVariable)
          ..where((tbl) => tbl.subject.equals(id))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.finishTime)]))
        .get();
  }

  Future<List> fetchMemoryCountdownByRoundID(String roundId) async {
    return await (_db.select(_db.memoryCountdownVariable)
          ..where((tbl) => tbl.roundId.equals(roundId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.expStartingTime)]))
        .get();
  }

  Future<MemoryCountdownVariableData?> getTheNextClosest() async {
    return await (_db.select(_db.memoryCountdownVariable)
          ..where((tbl) => tbl.finishTime.isNull())
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.expStartingTime)])
          ..limit(1))
        .getSingleOrNull();
  }

  // fetch the newest uncompleted memory session (max id AND uncompleted false )
  Future<MemoryCountdownVariableData?> getCurrentSession() async {
    return await (_db.select(_db.memoryCountdownVariable)
          ..where((tbl) => tbl.finishTime.isNull()) // Uncompleted sessions
          ..orderBy([
            (tbl) =>
                OrderingTerm.desc(tbl.id) // Sort by highest ID (or other field)
          ]))
        .getSingleOrNull(); // Return the single top result or null if none exist
  }

  // Fetch memory session by ID
  Future<MemoryCountdownVariableData?> fetchMemorySessionById(String id) async {
    return await (_db.select(_db.memoryCountdownVariable)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  // Update a memory session
  Future<void> updateMemorySession(
      MemoryCountdownVariableCompanion updatedSession) async {
    await _db.update(_db.memoryCountdownVariable).replace(updatedSession);
  }

  // edit specific with write not replace
  Future<void> updateMemorySessionWrite(
      String id, MemoryCountdownVariableCompanion updatedSession) async {
    await (_db.update(_db.memoryCountdownVariable)
          ..where((tbl) => tbl.id.equals(id)))
        .write(updatedSession);
  }

  // Delete memory session by ID
  Future<void> deleteMemorySessionById(String id) async {
    await (_db.delete(_db.memoryCountdownVariable)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //Delete all memory sessions
  Future<void> deleteAllMemorySessions() async {
    await _db.delete(_db.memoryCountdownVariable).go();
  }

  Future<MemoryCountdownVariableData?> fetchLastMemorySession() async {
    return await (_db.select(_db.memoryCountdownVariable)
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.id)])
          ..limit(1))
        .getSingleOrNull();
  }
}

class RoundRepository {
  final AppDatabase _db;

  RoundRepository(this._db);

  // Insert a new round
  Future<void> insertRound(RoundVariableCompanion round) async {
    await _db.into(_db.roundVariable).insert(round);
  }

  // Fetch all rounds
  Future<List<RoundVariableData>> fetchAllRounds() async {
    return await (_db.select(_db.roundVariable)
          ..where((tbl) => tbl.finishTime.isNotNull())
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.finishTime)]))
        .get();
  }

  // Fetch the newest uncompleted round (max id AND uncompleted)
  Future<RoundVariableData?> getCurrentRound() async {
    return await (_db.select(_db.roundVariable)
          ..where((tbl) => tbl.completed
              .equals(false)) // Assuming endTime is null if incomplete
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.id)]))
        .getSingleOrNull();
  }

  // Fetch round by ID
  Future<RoundVariableData?> fetchRoundById(String id) async {
    return await (_db.select(_db.roundVariable)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  // Replace round
  Future<void> updateRound(RoundVariableCompanion updatedRound) async {
    await _db.update(_db.roundVariable).replace(updatedRound);
  }

  // Write update (partial)
  Future<void> updateRoundWrite(
      String id, RoundVariableCompanion updatedRound) async {
    await (_db.update(_db.roundVariable)..where((tbl) => tbl.id.equals(id)))
        .write(updatedRound);
  }

  // Delete round by ID
  Future<void> deleteRoundById(String id) async {
    await (_db.delete(_db.roundVariable)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  // Delete all rounds
  Future<void> deleteAllRounds() async {
    await _db.delete(_db.roundVariable).go();
  }
}
