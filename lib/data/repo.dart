import 'app_db.dart';

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

  // Delete memory session by ID
  Future<void> deleteMemorySessionById(int id) async {
    await (_db.delete(_db.memorySessionVariable)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
