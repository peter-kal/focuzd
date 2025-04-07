import 'package:drift/drift.dart';

class MemorySessionVariable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get roundGoal => integer()();
  IntColumn get durationLeft => integer().nullable()();
  IntColumn get runTime => integer()();
  IntColumn get plannedDuration => integer()();
  IntColumn get actuallyDoneDuration => integer().nullable()();
  DateTimeColumn get startingTime => dateTime()();
  DateTimeColumn get expFinishTime => dateTime().nullable()();
  DateTimeColumn get finishTime => dateTime().nullable()();

  TextColumn get type => text()(); //'work' 'break' 'longbreak'
  TextColumn get subject => text().nullable()();
}

class SettingsVariables extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get windowOnTop => boolean()();
  IntColumn get requestedNumberOfSessions => integer()();
  IntColumn get selectedBreakDurationStored => integer()();
  IntColumn get selectedWorkDurationStored => integer()();
  IntColumn get selectedLongBreakDurationStored => integer()();
}
