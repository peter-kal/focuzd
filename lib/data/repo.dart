import 'package:drift/drift.dart';
import 'package:focuzd/extra_widgets/subject_tree_node.dart';

import 'app_db.dart';

class GoalRepository {
  final AppDatabase _db;
  GoalRepository(this._db);
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
    final Map<int, SubjectTreeNode> nodeMap = {};

    // Step 2: Create all nodes and store them in the map
    for (final subject in subjects) {
      nodeMap[subject.id] = SubjectTreeNode(
        title: subject.name,
        id: subject.id,
        subSubjects: subject.subSubjects,
        subject: subject,
        superId:
            subject.superSubjectID, // Add this to your SubjectTreeNode class
        totalTimeSpent: subject.totalTimeSpent,
        updatedAt: subject.updatedAt,
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

  Future<SubjectData?> fetchSubjectByID(int id) async {
    return await (_db.select(_db.subject)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<void> deleteSubjectByID(int id) async {
    _db.delete(_db.subject)
      ..where((tbl) => tbl.id.equals(id))
      ..go();
  }

  Future<void> insertSubject(SubjectCompanion subject) async {
    await _db.into(_db.subject).insert(subject);
  }

  Future<List<SubjectData>> fetchSubSubjects(int id) async {
    return await (_db.select(_db.subject)
          ..where((tbl) => tbl.superSubjectID.equals(id))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .get();
  }

  Future<int> countSubSubjects(int subjectId) async {
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

  Future<void> increaseSubjectTime(int addedTime, int id, int sessionId) async {
    var subject = await fetchSubjectByID(id);
    print("start");
    await editSubjectWrite(
        id,
        SubjectCompanion(
            lastFocuzdOnSessionID: Value(sessionId),
            totalTimeSpent: Value((subject?.totalTimeSpent ?? 0) + addedTime),
            updatedAt: Value(DateTime.now())));

    if (subject!.superSubjectID != null) {
      print("will repeat");
      increaseSubjectTime(addedTime, subject.superSubjectID!, sessionId);
    }
  }

  Future<String> getSubjectAddress(int subjectId) async {
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

  Future<void> editSubjectWrite(int id, SubjectCompanion updatedSubject) async {
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
      int id) async {
    return await (_db.select(_db.outPlanningVariable)
          ..where((tbl) => tbl.memoryCountdownID.equals(id)))
        .get();
  }

  Future<List<OutPlanningVariableData>> fetchAllOutPlannings() async {
    return await _db.select(_db.outPlanningVariable).get();
  }

  Future<void> updateOutPlanning(int outPlanningID,
      OutPlanningVariableCompanion updatedOutPlanning) async {
    await (_db.update(_db.outPlanningVariable)
          ..where((tbl) => tbl.id.equals(outPlanningID)))
        .write(updatedOutPlanning);
  }

  Future<void> insertOutPlanning(
      OutPlanningVariableCompanion outplanning) async {
    await _db.into(_db.outPlanningVariable).insert(outplanning);
  }

  Future<OutPlanningVariableData?> getActiveOutPlanning(int id) async {
    return await (_db.select(_db.outPlanningVariable)
          ..where((tbl) => tbl.memoryCountdownID.equals(id))
          ..where((tbl) => tbl.isActive.equals(true)))
        .getSingleOrNull();
  }
}

class SettingsRepository {
  final AppDatabase _db;

  SettingsRepository(this._db);

  // Fetch settings by ID
  Future<SettingsVariable?> fetchSettingsById(int id) async {
    return await (_db.select(_db.settingsVariables)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  // Update a specific setting
  Future<void> updateSetting(
      int id, SettingsVariablesCompanion updatedSetting) async {
    await (_db.update(_db.settingsVariables)..where((tbl) => tbl.id.equals(id)))
        .write(updatedSetting);
  }

  // Delete settings by ID
  Future<void> deleteSettingsById(int id) async {
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

  Future<List<MemoryCountdownVariableData>> fetchMemoryCountdownsBySubject(
      int id) async {
    return await (_db.select(_db.memoryCountdownVariable)
          ..where((tbl) => tbl.subject.equals(id))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.finishTime)]))
        .get();
  }

  Future<List> fetchMemoryCountdownByRoundID(int roundId) async {
    return await (_db.select(_db.memoryCountdownVariable)
          ..where((tbl) => tbl.roundId.equals(roundId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.finishTime)]))
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
  Future<MemoryCountdownVariableData?> fetchMemorySessionById(int id) async {
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
      int id, MemoryCountdownVariableCompanion updatedSession) async {
    await (_db.update(_db.memoryCountdownVariable)
          ..where((tbl) => tbl.id.equals(id)))
        .write(updatedSession);
  }

  // Delete memory session by ID
  Future<void> deleteMemorySessionById(int id) async {
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
  Future<RoundVariableData?> fetchRoundById(int id) async {
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
      int id, RoundVariableCompanion updatedRound) async {
    await (_db.update(_db.roundVariable)..where((tbl) => tbl.id.equals(id)))
        .write(updatedRound);
  }

  // Delete round by ID
  Future<void> deleteRoundById(int id) async {
    await (_db.delete(_db.roundVariable)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  // Delete all rounds
  Future<void> deleteAllRounds() async {
    await _db.delete(_db.roundVariable).go();
  }
}
