import 'package:focuzd/data/settings_storage/db_settings.dart';

class SettingsRepository {
  final AppDatabase _db;

  SettingsRepository(this._db);

  Future<SettingsVariable?> fetchSettings() async {
    return await (_db.select(_db.settingsVariables).getSingleOrNull());
  }

  Future<void> updateSetting(
      int id, SettingsVariablesCompanion updatedSetting) async {
    await (_db.update(_db.settingsVariables)..where((tbl) => tbl.id.equals(id)))
        .write(updatedSetting);
  }
  // Fetch settings by ID

  // Delete settings by ID
  Future<void> deleteSettingsById(int id) async {
    await (_db.delete(_db.settingsVariables)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}