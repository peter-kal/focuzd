import 'package:drift/drift.dart';

import 'app_db.dart';

class SubjectRepository {
  final AppDatabase _db;
  SubjectRepository(this._db);

  Future<List<SubjectData>> fetchAllSubjects() async {
    return await _db.select(_db.subject).get();
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
      MemorySessionVariableCompanion session) async {
    await _db.into(_db.memorySessionVariable).insert(session);
  }

  // Fetch all memory sessions
  Future<List<MemorySessionVariableData>> fetchAllMemorySessions() async {
    return await _db.select(_db.memorySessionVariable).get();
  }

  // fetch the newest uncompleted memory session (max id AND uncompleted false )
  Future<MemorySessionVariableData?> getCurrentSession() async {
    return await (_db.select(_db.memorySessionVariable)
          ..where((tbl) => tbl.finishTime.isNull()) // Uncompleted sessions
          ..orderBy([
            (tbl) =>
                OrderingTerm.desc(tbl.id) // Sort by highest ID (or other field)
          ]))
        .getSingleOrNull(); // Return the single top result or null if none exist
  }

  // Fetch memory session by ID
  Future<MemorySessionVariableData?> fetchMemorySessionById(int id) async {
    return await (_db.select(_db.memorySessionVariable)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  // Update a memory session
  Future<void> updateMemorySession(
      MemorySessionVariableCompanion updatedSession) async {
    await _db.update(_db.memorySessionVariable).replace(updatedSession);
  }

  // edit specific with write not replace
  Future<void> updateMemorySessionWrite(
      int id, MemorySessionVariableCompanion updatedSession) async {
    await (_db.update(_db.memorySessionVariable)
          ..where((tbl) => tbl.id.equals(id)))
        .write(updatedSession);
  }

  // Delete memory session by ID
  Future<void> deleteMemorySessionById(int id) async {
    await (_db.delete(_db.memorySessionVariable)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  //Delete all memory sessions
  Future<void> deleteAllMemorySessions() async {
    await _db.delete(_db.memorySessionVariable).go();
  }
}
