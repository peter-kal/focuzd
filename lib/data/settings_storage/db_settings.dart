import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:focuzd/data/settings_storage/entities/settings_vars.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:path/path.dart' as p;
part 'db_settings.g.dart';

@DriftDatabase(tables: [SettingsVariables])
class AppDatabase extends _$AppDatabase {
  // static final AppDatabase _instance = AppDatabase();

  static final AppDatabase _instance = AppDatabase();

  static AppDatabase instance() => _instance;

  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await SettingsVariablesEntity.saveSettingsVariablesEntity(
            SettingsVariablesEntity(
                id: 1,
                windowOnTop: false,
                requestedNumberOfSessions: 4,
                selectedBreakDurationStored: 5,
                selectedLongBreakDurationStored: 15,
                selectedWorkDurationStored: 25));
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {}
      },
      beforeOpen: (details) async {
        if (kDebugMode) {
          await validateDatabaseSchema();
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationSupportDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
