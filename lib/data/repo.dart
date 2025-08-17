import 'package:drift/drift.dart';
import 'package:focuzd/l10n/app_localizations.dart';

import 'app_db.dart';

class SubjectRepository {
  final AppDatabase _db;
  SubjectRepository(this._db);
  // TASK: Write a function that will insert sub-subjects time into the super-subjects, after updating in the Bloc

  Future<SubjectData?> fetchSubjectByID(int id) async {
    return await (_db.select(_db.subject)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<void> editSubjectWrite(int id, SubjectCompanion updatedSubject) async {
    await (_db.update(_db.subject)..where((tbl) => tbl.id.equals(id)))
        .write(updatedSubject);
  }

  Future<List<SubjectData>> fetchAllSubjects() async {
    return await _db.select(_db.subject).get();
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

  Future<void> updateOutPlanning(
      int outPlanningID, OutPlanningVariableCompanion updatedOutPlanning) async {
    await (_db.update(_db.outPlanningVariable)
          ..where((tbl) => tbl.id.equals(outPlanningID)))
        .write(updatedOutPlanning);
  }

  Future<void> insertOutPlanning(
      OutPlanningVariableCompanion outplanning) async {
    await _db.into(_db.outPlanningVariable).insert(outplanning);
  }

  Future<OutPlanningVariableData?> getActiveOutPlanning(int id)
  async {
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
    return await _db.select(_db.roundVariable).get();
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
