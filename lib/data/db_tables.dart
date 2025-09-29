import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class SettingsVariables extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  BoolColumn get windowOnTop => boolean()();
  IntColumn get requestedNumberOfSessions => integer()();
  IntColumn get selectedBreakDurationStored => integer()();
  IntColumn get selectedFocusDurationStored => integer()();
  IntColumn get selectedLongBreakDurationStored => integer()();
  BoolColumn get roundPlanningByDefault =>
      boolean().withDefault(Constant(true))();
  @override
  Set<Column> get primaryKey => {id};
}

class RoundVariable extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
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
  @override
  Set<Column> get primaryKey => {id};
}

class MemoryCountdownVariable extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  IntColumn get roundGoal =>
      integer()(); // will be deprecated, keeping it just for testing, an ensuring the session will be part of the right round
  TextColumn get roundId => text()(); //what round it belongs to
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
  TextColumn get subject => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class OutPlanningVariable extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get memoryCountdownID => text()();
  DateTimeColumn get startingTime => dateTime().nullable()();
  DateTimeColumn get finishTime => dateTime().nullable()();
  IntColumn get duration => integer().nullable()();
  TextColumn get type => text().nullable()(); // pause time or reset time
  BoolColumn get isActive => boolean().withDefault(const Constant(false))();
  @override
  Set<Column> get primaryKey => {id};
}

class Subject extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get name => text().unique().withLength(max: 99)();
  TextColumn get address => text().unique()();
  TextColumn get superSubjectID =>
      text().nullable().customConstraint('REFERENCES subject(id)')();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get subSubjects => integer().withDefault(const Constant(0))();
  TextColumn get lastFocuzdOnSessionID =>
      text().nullable().references(MemoryCountdownVariable, #id)();
  TextColumn get linkSub =>
      text().nullable().customConstraint('REFERENCES subject(id)')();
  IntColumn get totalTimeSpent => integer()
      .withDefault(const Constant(0))(); // total time spent on the subject
  IntColumn get optinalFocusTime => integer().nullable()();
  IntColumn get optinalBreakTime => integer().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class Goal extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get codeName => text()();
  IntColumn get type => integer()(); //1,2,3,4,5
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  // two periods of time(days, weeks, months, years)
  // four datetime variables
  // Type 1, 3, 4, will only need period1
  // Type 2, 5 will need both
  DateTimeColumn get startPeriod1 => dateTime().nullable()();
  DateTimeColumn get endPeriod1 => dateTime().nullable()();

  //any period of time ahead of the planning
  DateTimeColumn get startPeriod2 => dateTime()();
  DateTimeColumn get endPeriod2 => dateTime()();

  IntColumn get xSessionsGoal => integer().nullable()();
  IntColumn get ySessionsDone => integer().nullable()(); // in the period2
  // Type 2, 4, 5 only
  RealColumn get plannedRatio =>
      real().nullable()(); // ratio always in comparison to 1(ex. 1.1 to )
  RealColumn get realRatio => real().nullable()();
  IntColumn get xSessionsR =>
      integer().nullable()(); // r period of time +- y type 2,5
  // sybject types
  // Only one subject for type 3, 5
  TextColumn get subjectIdZ => text().nullable()();
  IntColumn get xSessionsZ =>
      integer().nullable()(); // when 5 will become a duplicate
  // For type 4 we need two
  TextColumn get subjectIdF => text().nullable()();
  IntColumn get xSessionsF => integer().nullable()();
  // determined after the deadline of a goal and continiuously updated during the entire life of the goal
  RealColumn get successPercentage => real().withDefault(const Constant(00))();
  @override
  Set<Column> get primaryKey => {id};
}
