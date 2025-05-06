
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'db_tables.dart';
part 'app_db.g.dart';

@DriftDatabase(tables: [SettingsVariables, MemorySessionVariable])
class AppDatabase extends _$AppDatabase {
  static final AppDatabase instance = AppDatabase._internal();

  AppDatabase._internal() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();

        await into(settingsVariables).insert(SettingsVariablesCompanion(
            windowOnTop: Value(false),
            requestedNumberOfSessions: Value(4),
            selectedBreakDurationStored: Value(5),
            selectedLongBreakDurationStored: Value(15),
            selectedWorkDurationStored: Value(25)));
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
    return driftDatabase(
      name: 'focuzd_app_db',
      native: DriftNativeOptions(databaseDirectory: () async => directory),
          );
  });
}
