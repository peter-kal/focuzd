import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:focuzd/data/settings_storage/settings_vars.dart';
part 'db_settings.g.dart';


@DriftDatabase(tables: [
  SettingsVariables

])
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
        if (from < 2) {}
      },
      beforeOpen: (details) async {
        if (kDebugMode) {}
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationSupportDirectory();

    final oldPath = File(p.join(directory.path, 'db.sqlite'));
    final newPath = File(p.join(directory.path, 'focuzd_app_db.sqlite'));

    if(await oldPath.exists() && !await newPath.exists()){
      try{
        await oldPath.rename(newPath.path);
      } catch (e) {
        await oldPath.copy(newPath.path);
        await oldPath.delete();
      }
    }

    return driftDatabase(
      name: 'focuzd_app_db',
      native: DriftNativeOptions(databaseDirectory: () async => directory),
    );
  });
}
