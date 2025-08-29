import 'package:drift/drift.dart';

class SettingsVariables extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get windowOnTop => boolean()();
  IntColumn get requestedNumberOfSessions => integer()();
  IntColumn get selectedBreakDurationStored => integer()();
  IntColumn get selectedFocusDurationStored => integer()();
  IntColumn get selectedLongBreakDurationStored => integer()();
  BoolColumn get roundPlanningByDefault =>
      boolean().withDefault(Constant(true))();
}

class RoundVariable extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  TextColumn get propableCause =>
      text().nullable()(); // to be used when the round hasn't gone as planned
  // similar to session's
  IntColumn get plannedDuration => integer()();
  IntColumn get actuallyDoneDuration => integer().nullable()();
  DateTimeColumn get startingTime => dateTime()();
  DateTimeColumn get expFinishTime => dateTime()
      .nullable()(); // in the round-centric approach that can also be called plannedFinishTime
  DateTimeColumn get finishTime => dateTime().nullable()();
}

class MemoryCountdownVariable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get roundGoal =>
      integer()(); // will be deprecated, keeping it just for testing, an ensuring the session will be part of the right round
  IntColumn get roundId => integer()(); //what round it belongs to
  TextColumn get propableCause =>
      text().nullable()(); // to be used when the session hasn't gone as planned
  IntColumn get durationLeft => integer().nullable()();
  IntColumn get roundRunTime =>
      integer()(); // in roundcentric that's it's pos is the list, prev runTime
  IntColumn get plannedDuration => integer()();
  IntColumn get actuallyDoneDuration => integer()
      .nullable()(); // if actually done duration is 0 then the session never happened
  DateTimeColumn get expStartingTime => dateTime()();
  DateTimeColumn get startingTime => dateTime().nullable()();
  DateTimeColumn get expFinishTime => dateTime()
      .nullable()(); // in the round-centric approach that can also be called planedFinishTime
  DateTimeColumn get finishTime => dateTime().nullable()();
  BoolColumn get completed =>
      boolean().withDefault(const Constant(false)).nullable()();
  BoolColumn get active => boolean().withDefault(const Constant(
      false))(); //opposites with completed in some form, in completed true active must be false
  TextColumn get type => text()(); //'focus' 'break' 'longbreak'
  IntColumn get subject => integer().nullable()();
}

class OutPlanningVariable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get memoryCountdownID => integer()();
  DateTimeColumn get startingTime => dateTime().nullable()();
  DateTimeColumn get finishTime => dateTime().nullable()();
  IntColumn get duration => integer().nullable()();
  TextColumn get type => text().nullable()(); // pause time or reset time
  BoolColumn get isActive => boolean().withDefault(const Constant(false))();
}

class Subject extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique().withLength(max: 99)();
  TextColumn get address => text().unique()();
  IntColumn get superSubjectID =>
      integer().nullable().customConstraint('REFERENCES subject(id)')();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get subSubjects => integer().withDefault(const Constant(0))();
  IntColumn get lastFocuzdOnSessionID =>
      integer().nullable().references(MemoryCountdownVariable, #id)();
  IntColumn get totalTimeSpent => integer()
      .withDefault(const Constant(0))(); // total time spent on the subject
}
