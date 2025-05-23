import 'package:drift/drift.dart';

class SettingsVariables extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get windowOnTop => boolean()();
  IntColumn get requestedNumberOfSessions => integer()();
  IntColumn get selectedBreakDurationStored => integer()();
  IntColumn get selectedWorkDurationStored => integer()();
  IntColumn get selectedLongBreakDurationStored => integer()();
  BoolColumn get roundPlanningByDefault =>
      boolean().withDefault(Constant(true))();
}

class RoundVariable extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get completed =>
      boolean().withDefault(const Constant(false)).nullable()();
  TextColumn get propableCause =>
      text().nullable()(); // to be used when the round hasn't gone as planned
  // similar to session's
  IntColumn get plannedDuration => integer()();
  IntColumn get actuallyDoneDuration => integer().nullable()();
  DateTimeColumn get startingTime => dateTime()();
  DateTimeColumn get expFinishTime => dateTime()
      .nullable()(); // in the round-centric approach that can also be called planedFinishTime
  DateTimeColumn get finishTime => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
}

class MemorySessionVariable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get roundGoal =>
      integer()(); // will be deprecated, keeping it just for testing
  IntColumn get roundId => integer()(); //what round it belongs to
  IntColumn get durationLeft => integer().nullable()();
  IntColumn get runTime => integer()();
  IntColumn get plannedDuration => integer()();
  IntColumn get actuallyDoneDuration => integer().nullable()();
  DateTimeColumn get expStartingTime => dateTime()();
  DateTimeColumn get startingTime => dateTime()();
  DateTimeColumn get expFinishTime => dateTime()
      .nullable()(); // in the round-centric approach that can also be called planedFinishTime
  DateTimeColumn get finishTime => dateTime().nullable()();
  BoolColumn get completed =>
      boolean().withDefault(const Constant(false)).nullable()();

  TextColumn get type => text()(); //'work' 'break' 'longbreak'
  IntColumn get subject => integer().nullable()();
}

class Subject extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique().withLength(max: 99)();
  IntColumn get subjectid =>
      integer().nullable().customConstraint('REFERENCES subject(id)')();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get lastWorkedOnSessionID =>
      integer().nullable().references(MemorySessionVariable, #id)();
  TextColumn get notes => text().nullable()();
}
