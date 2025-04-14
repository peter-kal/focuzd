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
  BoolColumn get completed =>
      boolean().withDefault(const Constant(false)).nullable()();

  TextColumn get type => text()(); //'work' 'break' 'longbreak'
  IntColumn get subject => integer().nullable()();
}

class SettingsVariables extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get windowOnTop => boolean()();
  IntColumn get requestedNumberOfSessions => integer()();
  IntColumn get selectedBreakDurationStored => integer()();
  IntColumn get selectedWorkDurationStored => integer()();
  IntColumn get selectedLongBreakDurationStored => integer()();
}

class Subject extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique().withLength(max: 100)();
  IntColumn get subjectid =>
      integer().nullable().customConstraint('REFERENCES subject(id)')();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get lastWorkedOnSessionID =>
      integer().references(MemorySessionVariable, #id)();
  TextColumn get notes => text().nullable()();
}
