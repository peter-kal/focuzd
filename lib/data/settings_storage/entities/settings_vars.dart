import 'dart:core';
import 'package:drift/drift.dart';
import 'package:focuzd/data/settings_storage/db_settings.dart';

@UseRowClass(SettingsVariablesEntity)
class SettingsVariables extends Table {
  IntColumn get id => integer().autoIncrement()();

  BoolColumn get windowOnTop => boolean()();

  IntColumn get requestedNumberOfSessions => integer()();

  IntColumn get selectedBreakDurationStored => integer()();

  IntColumn get selectedWorkDurationStored => integer()();

  IntColumn get selectedLongBreakDurationStored => integer()();
}

class SettingsVariablesEntity {
  int? id;
  bool? windowOnTop;
  int? requestedNumberOfSessions;
  int? selectedBreakDurationStored;
  int? selectedLongBreakDurationStored;
  int? selectedWorkDurationStored;
  SettingsVariablesEntity({
    this.id,
    this.windowOnTop,
    this.requestedNumberOfSessions,
    this.selectedBreakDurationStored,
    this.selectedLongBreakDurationStored,
    this.selectedWorkDurationStored,
  });

  SettingsVariablesEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    windowOnTop = json['windowOnTop'];
    requestedNumberOfSessions = json['requestedNumberOfSessions'];
    selectedBreakDurationStored = json['selectedBreakDurationStored'];
    selectedLongBreakDurationStored = json['selectedLongBreakDurationStored'];
    selectedWorkDurationStored = json['selectedWorkDurationStored'];
  }

  SettingsVariablesCompanion toCompanion() {
    return SettingsVariablesCompanion(
      id: Value(id ?? -1),
      windowOnTop: Value(windowOnTop ?? false),
      requestedNumberOfSessions: Value(requestedNumberOfSessions ?? 0),
      selectedBreakDurationStored: Value(selectedBreakDurationStored ?? 0),
      selectedLongBreakDurationStored:
          Value(selectedLongBreakDurationStored ?? 0),
      selectedWorkDurationStored: Value(selectedLongBreakDurationStored ?? 0),
    );
  }

  static Future<void> saveSettingsVariablesEntity(
      SettingsVariablesEntity entity) async {
    AppDatabase db = AppDatabase.instance();

    await db
        .into(db.settingsVariables)
        .insertOnConflictUpdate(entity.toCompanion());
  }

  static Future<SettingsVariablesEntity?> querySetVarById(int setvarId) async {
    AppDatabase db = AppDatabase.instance();
    SettingsVariablesEntity? setvarEntity =
        await (db.select(db.settingsVariables)
              ..where((tbl) => tbl.id.equals(setvarId)))
            .getSingleOrNull();

    return setvarEntity;
  }
}
