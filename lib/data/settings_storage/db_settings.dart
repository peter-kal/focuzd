import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:focuzd/data/settings_storage/settings_vars.dart';
part 'db_settings.g.dart';

@DriftDatabase(tables: [SettingsVariables])
class AppDatabase extends _$AppDatabase {
  static final AppDatabase instance = AppDatabase._internal();

  AppDatabase._internal() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await into(settingsVariables).insert(SettingsVariablesCompanion(
            windowOnTop: Value(false),
            defaultNumberOfSessionsPerRound: Value(4),
            defaultBreakDurationStored: Value(5),
            defaultLongBreakDurationStored: Value(15),
            defaultFocusDurationStored: Value(25),
            periodofLongBreak: Value(4),
            atWillStart: Value(false)));
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.addColumn(settingsVariables, settingsVariables.atWillStart);
          await m.addColumn(
              settingsVariables, settingsVariables.periodofLongBreak);
        }
      },
      beforeOpen: (details) async {
        if (kDebugMode) {
          print('DB opened. Version: ${details.versionNow}');
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final snapCommon = Platform.environment['SNAP_USER_COMMON'];
    final Directory dbDir;
    if (snapCommon != null && snapCommon.isNotEmpty) {
      dbDir = Directory(snapCommon);
      if (!await dbDir.exists()) {
        await dbDir.create(recursive: true);
      }
    } else {
      dbDir = await getApplicationSupportDirectory();
    }

    final newFile = File(p.join(dbDir.path, 'focuzd_app_db.sqlite'));

    if (!await newFile.exists()) {
      final oldAppSupport = await getApplicationSupportDirectory();
      final oldRevisionDB =
          File(p.join(oldAppSupport.path, 'focuzd_app_db.sqlite'));
      final oldRevisionLegacy = File(p.join(oldAppSupport.path, 'db.sqlite'));

      File? sourceFile;
      if (await oldRevisionDB.exists()) {
        sourceFile = oldRevisionDB;
      } else if (await oldRevisionLegacy.exists()) {
        sourceFile = oldRevisionLegacy;
      }

      if (sourceFile != null) {
        try {
          await sourceFile.copy(newFile.path);
          if (kDebugMode) {
            print('Migrated DB from ${sourceFile.path} to ${newFile.path}');
          }
        } catch (e) {
          if (kDebugMode) {
            print('DB migration failed: $e');
          }
        }
      }
    }

    return driftDatabase(
      name: 'focuzd_app_db',
      native: DriftNativeOptions(databaseDirectory: () async => dbDir),
    );
  });
}
