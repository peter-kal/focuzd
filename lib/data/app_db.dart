import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'db_tables.dart';
part 'app_db.g.dart';

@DriftDatabase(tables: [
  SettingsVariables,
  MemoryCountdownVariable,
  RoundVariable,
  Subject,
  OutPlanningVariable,
  Goal,
  GoalGroup,
  GroupLink
])
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
        await into(goal).insert(GoalCompanion(
          codeName: Value("writing18000"),
          type: Value(1),
          expired: Value(false),
          createdAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
          xSessionsGoal: Value(180),
          startPeriod2: Value(DateTime(2025, 9, 5, 15)),
          endPeriod2: Value(DateTime(2026, 5, 30, 15)),
        ));
        await into(subject).insert(SubjectCompanion(
            name: Value("Mathematics"),
            address: Value("> Mathematics"),
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now())));
        await into(subject).insert(SubjectCompanion(
            name: Value("Ergotherapy"),
            address: Value("> Ergotherapy"),
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now())));
        await into(settingsVariables).insert(SettingsVariablesCompanion(
            windowOnTop: Value(false),
            defaultNumberOfSessionsPerRound: Value(4),
            defaultBreakDurationStored: Value(5),
            defaultLongBreakDurationStored: Value(15),
            defaultFocusDurationStored: Value(25)));
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
