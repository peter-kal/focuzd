
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'db_tables.dart';
part 'app_db.g.dart';

@DriftDatabase(tables: [SettingsVariables, MemorySessionVariable])
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
            requestedNumberOfSessions: Value(4),
            selectedBreakDurationStored: Value(5),
            selectedLongBreakDurationStored: Value(15),
            selectedWorkDurationStored: Value(25)));
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.create(memorySessionVariable);
        }
      },
      beforeOpen: (details) async {
        if (kDebugMode) {
          print("testing db ✅✅✅✅");
          await into(memorySessionVariable).insert(
              MemorySessionVariableCompanion(
                  roundGoal: Value(4),
                  runTime: Value(2),
                  expFinishTime: Value(DateTime.now().add(Duration(seconds:1500))),
                  plannedDuration: Value(1500),
                  startingTime: Value(DateTime.now()),
                  subject: Value("testing db"),
                  type: Value("work")));
          print("Test data inserted successfully!");
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() {
    return driftDatabase(
      name: 'app_db',
    );
  });
}
