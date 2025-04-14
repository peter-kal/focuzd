// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $SettingsVariablesTable extends SettingsVariables
    with TableInfo<$SettingsVariablesTable, SettingsVariable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsVariablesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _windowOnTopMeta =
      const VerificationMeta('windowOnTop');
  @override
  late final GeneratedColumn<bool> windowOnTop = GeneratedColumn<bool>(
      'window_on_top', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("window_on_top" IN (0, 1))'));
  static const VerificationMeta _requestedNumberOfSessionsMeta =
      const VerificationMeta('requestedNumberOfSessions');
  @override
  late final GeneratedColumn<int> requestedNumberOfSessions =
      GeneratedColumn<int>('requested_number_of_sessions', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _selectedBreakDurationStoredMeta =
      const VerificationMeta('selectedBreakDurationStored');
  @override
  late final GeneratedColumn<int> selectedBreakDurationStored =
      GeneratedColumn<int>('selected_break_duration_stored', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _selectedWorkDurationStoredMeta =
      const VerificationMeta('selectedWorkDurationStored');
  @override
  late final GeneratedColumn<int> selectedWorkDurationStored =
      GeneratedColumn<int>('selected_work_duration_stored', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _selectedLongBreakDurationStoredMeta =
      const VerificationMeta('selectedLongBreakDurationStored');
  @override
  late final GeneratedColumn<int> selectedLongBreakDurationStored =
      GeneratedColumn<int>(
          'selected_long_break_duration_stored', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        windowOnTop,
        requestedNumberOfSessions,
        selectedBreakDurationStored,
        selectedWorkDurationStored,
        selectedLongBreakDurationStored
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings_variables';
  @override
  VerificationContext validateIntegrity(Insertable<SettingsVariable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('window_on_top')) {
      context.handle(
          _windowOnTopMeta,
          windowOnTop.isAcceptableOrUnknown(
              data['window_on_top']!, _windowOnTopMeta));
    } else if (isInserting) {
      context.missing(_windowOnTopMeta);
    }
    if (data.containsKey('requested_number_of_sessions')) {
      context.handle(
          _requestedNumberOfSessionsMeta,
          requestedNumberOfSessions.isAcceptableOrUnknown(
              data['requested_number_of_sessions']!,
              _requestedNumberOfSessionsMeta));
    } else if (isInserting) {
      context.missing(_requestedNumberOfSessionsMeta);
    }
    if (data.containsKey('selected_break_duration_stored')) {
      context.handle(
          _selectedBreakDurationStoredMeta,
          selectedBreakDurationStored.isAcceptableOrUnknown(
              data['selected_break_duration_stored']!,
              _selectedBreakDurationStoredMeta));
    } else if (isInserting) {
      context.missing(_selectedBreakDurationStoredMeta);
    }
    if (data.containsKey('selected_work_duration_stored')) {
      context.handle(
          _selectedWorkDurationStoredMeta,
          selectedWorkDurationStored.isAcceptableOrUnknown(
              data['selected_work_duration_stored']!,
              _selectedWorkDurationStoredMeta));
    } else if (isInserting) {
      context.missing(_selectedWorkDurationStoredMeta);
    }
    if (data.containsKey('selected_long_break_duration_stored')) {
      context.handle(
          _selectedLongBreakDurationStoredMeta,
          selectedLongBreakDurationStored.isAcceptableOrUnknown(
              data['selected_long_break_duration_stored']!,
              _selectedLongBreakDurationStoredMeta));
    } else if (isInserting) {
      context.missing(_selectedLongBreakDurationStoredMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsVariable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsVariable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      windowOnTop: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}window_on_top'])!,
      requestedNumberOfSessions: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}requested_number_of_sessions'])!,
      selectedBreakDurationStored: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}selected_break_duration_stored'])!,
      selectedWorkDurationStored: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}selected_work_duration_stored'])!,
      selectedLongBreakDurationStored: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}selected_long_break_duration_stored'])!,
    );
  }

  @override
  $SettingsVariablesTable createAlias(String alias) {
    return $SettingsVariablesTable(attachedDatabase, alias);
  }
}

class SettingsVariable extends DataClass
    implements Insertable<SettingsVariable> {
  final int id;
  final bool windowOnTop;
  final int requestedNumberOfSessions;
  final int selectedBreakDurationStored;
  final int selectedWorkDurationStored;
  final int selectedLongBreakDurationStored;
  const SettingsVariable(
      {required this.id,
      required this.windowOnTop,
      required this.requestedNumberOfSessions,
      required this.selectedBreakDurationStored,
      required this.selectedWorkDurationStored,
      required this.selectedLongBreakDurationStored});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['window_on_top'] = Variable<bool>(windowOnTop);
    map['requested_number_of_sessions'] =
        Variable<int>(requestedNumberOfSessions);
    map['selected_break_duration_stored'] =
        Variable<int>(selectedBreakDurationStored);
    map['selected_work_duration_stored'] =
        Variable<int>(selectedWorkDurationStored);
    map['selected_long_break_duration_stored'] =
        Variable<int>(selectedLongBreakDurationStored);
    return map;
  }

  SettingsVariablesCompanion toCompanion(bool nullToAbsent) {
    return SettingsVariablesCompanion(
      id: Value(id),
      windowOnTop: Value(windowOnTop),
      requestedNumberOfSessions: Value(requestedNumberOfSessions),
      selectedBreakDurationStored: Value(selectedBreakDurationStored),
      selectedWorkDurationStored: Value(selectedWorkDurationStored),
      selectedLongBreakDurationStored: Value(selectedLongBreakDurationStored),
    );
  }

  factory SettingsVariable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsVariable(
      id: serializer.fromJson<int>(json['id']),
      windowOnTop: serializer.fromJson<bool>(json['windowOnTop']),
      requestedNumberOfSessions:
          serializer.fromJson<int>(json['requestedNumberOfSessions']),
      selectedBreakDurationStored:
          serializer.fromJson<int>(json['selectedBreakDurationStored']),
      selectedWorkDurationStored:
          serializer.fromJson<int>(json['selectedWorkDurationStored']),
      selectedLongBreakDurationStored:
          serializer.fromJson<int>(json['selectedLongBreakDurationStored']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'windowOnTop': serializer.toJson<bool>(windowOnTop),
      'requestedNumberOfSessions':
          serializer.toJson<int>(requestedNumberOfSessions),
      'selectedBreakDurationStored':
          serializer.toJson<int>(selectedBreakDurationStored),
      'selectedWorkDurationStored':
          serializer.toJson<int>(selectedWorkDurationStored),
      'selectedLongBreakDurationStored':
          serializer.toJson<int>(selectedLongBreakDurationStored),
    };
  }

  SettingsVariable copyWith(
          {int? id,
          bool? windowOnTop,
          int? requestedNumberOfSessions,
          int? selectedBreakDurationStored,
          int? selectedWorkDurationStored,
          int? selectedLongBreakDurationStored}) =>
      SettingsVariable(
        id: id ?? this.id,
        windowOnTop: windowOnTop ?? this.windowOnTop,
        requestedNumberOfSessions:
            requestedNumberOfSessions ?? this.requestedNumberOfSessions,
        selectedBreakDurationStored:
            selectedBreakDurationStored ?? this.selectedBreakDurationStored,
        selectedWorkDurationStored:
            selectedWorkDurationStored ?? this.selectedWorkDurationStored,
        selectedLongBreakDurationStored: selectedLongBreakDurationStored ??
            this.selectedLongBreakDurationStored,
      );
  SettingsVariable copyWithCompanion(SettingsVariablesCompanion data) {
    return SettingsVariable(
      id: data.id.present ? data.id.value : this.id,
      windowOnTop:
          data.windowOnTop.present ? data.windowOnTop.value : this.windowOnTop,
      requestedNumberOfSessions: data.requestedNumberOfSessions.present
          ? data.requestedNumberOfSessions.value
          : this.requestedNumberOfSessions,
      selectedBreakDurationStored: data.selectedBreakDurationStored.present
          ? data.selectedBreakDurationStored.value
          : this.selectedBreakDurationStored,
      selectedWorkDurationStored: data.selectedWorkDurationStored.present
          ? data.selectedWorkDurationStored.value
          : this.selectedWorkDurationStored,
      selectedLongBreakDurationStored:
          data.selectedLongBreakDurationStored.present
              ? data.selectedLongBreakDurationStored.value
              : this.selectedLongBreakDurationStored,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingsVariable(')
          ..write('id: $id, ')
          ..write('windowOnTop: $windowOnTop, ')
          ..write('requestedNumberOfSessions: $requestedNumberOfSessions, ')
          ..write('selectedBreakDurationStored: $selectedBreakDurationStored, ')
          ..write('selectedWorkDurationStored: $selectedWorkDurationStored, ')
          ..write(
              'selectedLongBreakDurationStored: $selectedLongBreakDurationStored')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      windowOnTop,
      requestedNumberOfSessions,
      selectedBreakDurationStored,
      selectedWorkDurationStored,
      selectedLongBreakDurationStored);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsVariable &&
          other.id == this.id &&
          other.windowOnTop == this.windowOnTop &&
          other.requestedNumberOfSessions == this.requestedNumberOfSessions &&
          other.selectedBreakDurationStored ==
              this.selectedBreakDurationStored &&
          other.selectedWorkDurationStored == this.selectedWorkDurationStored &&
          other.selectedLongBreakDurationStored ==
              this.selectedLongBreakDurationStored);
}

class SettingsVariablesCompanion extends UpdateCompanion<SettingsVariable> {
  final Value<int> id;
  final Value<bool> windowOnTop;
  final Value<int> requestedNumberOfSessions;
  final Value<int> selectedBreakDurationStored;
  final Value<int> selectedWorkDurationStored;
  final Value<int> selectedLongBreakDurationStored;
  const SettingsVariablesCompanion({
    this.id = const Value.absent(),
    this.windowOnTop = const Value.absent(),
    this.requestedNumberOfSessions = const Value.absent(),
    this.selectedBreakDurationStored = const Value.absent(),
    this.selectedWorkDurationStored = const Value.absent(),
    this.selectedLongBreakDurationStored = const Value.absent(),
  });
  SettingsVariablesCompanion.insert({
    this.id = const Value.absent(),
    required bool windowOnTop,
    required int requestedNumberOfSessions,
    required int selectedBreakDurationStored,
    required int selectedWorkDurationStored,
    required int selectedLongBreakDurationStored,
  })  : windowOnTop = Value(windowOnTop),
        requestedNumberOfSessions = Value(requestedNumberOfSessions),
        selectedBreakDurationStored = Value(selectedBreakDurationStored),
        selectedWorkDurationStored = Value(selectedWorkDurationStored),
        selectedLongBreakDurationStored =
            Value(selectedLongBreakDurationStored);
  static Insertable<SettingsVariable> custom({
    Expression<int>? id,
    Expression<bool>? windowOnTop,
    Expression<int>? requestedNumberOfSessions,
    Expression<int>? selectedBreakDurationStored,
    Expression<int>? selectedWorkDurationStored,
    Expression<int>? selectedLongBreakDurationStored,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (windowOnTop != null) 'window_on_top': windowOnTop,
      if (requestedNumberOfSessions != null)
        'requested_number_of_sessions': requestedNumberOfSessions,
      if (selectedBreakDurationStored != null)
        'selected_break_duration_stored': selectedBreakDurationStored,
      if (selectedWorkDurationStored != null)
        'selected_work_duration_stored': selectedWorkDurationStored,
      if (selectedLongBreakDurationStored != null)
        'selected_long_break_duration_stored': selectedLongBreakDurationStored,
    });
  }

  SettingsVariablesCompanion copyWith(
      {Value<int>? id,
      Value<bool>? windowOnTop,
      Value<int>? requestedNumberOfSessions,
      Value<int>? selectedBreakDurationStored,
      Value<int>? selectedWorkDurationStored,
      Value<int>? selectedLongBreakDurationStored}) {
    return SettingsVariablesCompanion(
      id: id ?? this.id,
      windowOnTop: windowOnTop ?? this.windowOnTop,
      requestedNumberOfSessions:
          requestedNumberOfSessions ?? this.requestedNumberOfSessions,
      selectedBreakDurationStored:
          selectedBreakDurationStored ?? this.selectedBreakDurationStored,
      selectedWorkDurationStored:
          selectedWorkDurationStored ?? this.selectedWorkDurationStored,
      selectedLongBreakDurationStored: selectedLongBreakDurationStored ??
          this.selectedLongBreakDurationStored,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (windowOnTop.present) {
      map['window_on_top'] = Variable<bool>(windowOnTop.value);
    }
    if (requestedNumberOfSessions.present) {
      map['requested_number_of_sessions'] =
          Variable<int>(requestedNumberOfSessions.value);
    }
    if (selectedBreakDurationStored.present) {
      map['selected_break_duration_stored'] =
          Variable<int>(selectedBreakDurationStored.value);
    }
    if (selectedWorkDurationStored.present) {
      map['selected_work_duration_stored'] =
          Variable<int>(selectedWorkDurationStored.value);
    }
    if (selectedLongBreakDurationStored.present) {
      map['selected_long_break_duration_stored'] =
          Variable<int>(selectedLongBreakDurationStored.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsVariablesCompanion(')
          ..write('id: $id, ')
          ..write('windowOnTop: $windowOnTop, ')
          ..write('requestedNumberOfSessions: $requestedNumberOfSessions, ')
          ..write('selectedBreakDurationStored: $selectedBreakDurationStored, ')
          ..write('selectedWorkDurationStored: $selectedWorkDurationStored, ')
          ..write(
              'selectedLongBreakDurationStored: $selectedLongBreakDurationStored')
          ..write(')'))
        .toString();
  }
}

class $MemorySessionVariableTable extends MemorySessionVariable
    with TableInfo<$MemorySessionVariableTable, MemorySessionVariableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemorySessionVariableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _roundGoalMeta =
      const VerificationMeta('roundGoal');
  @override
  late final GeneratedColumn<int> roundGoal = GeneratedColumn<int>(
      'round_goal', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _durationLeftMeta =
      const VerificationMeta('durationLeft');
  @override
  late final GeneratedColumn<int> durationLeft = GeneratedColumn<int>(
      'duration_left', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _runTimeMeta =
      const VerificationMeta('runTime');
  @override
  late final GeneratedColumn<int> runTime = GeneratedColumn<int>(
      'run_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _plannedDurationMeta =
      const VerificationMeta('plannedDuration');
  @override
  late final GeneratedColumn<int> plannedDuration = GeneratedColumn<int>(
      'planned_duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _actuallyDoneDurationMeta =
      const VerificationMeta('actuallyDoneDuration');
  @override
  late final GeneratedColumn<int> actuallyDoneDuration = GeneratedColumn<int>(
      'actually_done_duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _startingTimeMeta =
      const VerificationMeta('startingTime');
  @override
  late final GeneratedColumn<DateTime> startingTime = GeneratedColumn<DateTime>(
      'starting_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _expFinishTimeMeta =
      const VerificationMeta('expFinishTime');
  @override
  late final GeneratedColumn<DateTime> expFinishTime =
      GeneratedColumn<DateTime>('exp_finish_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _finishTimeMeta =
      const VerificationMeta('finishTime');
  @override
  late final GeneratedColumn<DateTime> finishTime = GeneratedColumn<DateTime>(
      'finish_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
      'completed', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<int> subject = GeneratedColumn<int>(
      'subject', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        roundGoal,
        durationLeft,
        runTime,
        plannedDuration,
        actuallyDoneDuration,
        startingTime,
        expFinishTime,
        finishTime,
        completed,
        type,
        subject
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'memory_session_variable';
  @override
  VerificationContext validateIntegrity(
      Insertable<MemorySessionVariableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('round_goal')) {
      context.handle(_roundGoalMeta,
          roundGoal.isAcceptableOrUnknown(data['round_goal']!, _roundGoalMeta));
    } else if (isInserting) {
      context.missing(_roundGoalMeta);
    }
    if (data.containsKey('duration_left')) {
      context.handle(
          _durationLeftMeta,
          durationLeft.isAcceptableOrUnknown(
              data['duration_left']!, _durationLeftMeta));
    }
    if (data.containsKey('run_time')) {
      context.handle(_runTimeMeta,
          runTime.isAcceptableOrUnknown(data['run_time']!, _runTimeMeta));
    } else if (isInserting) {
      context.missing(_runTimeMeta);
    }
    if (data.containsKey('planned_duration')) {
      context.handle(
          _plannedDurationMeta,
          plannedDuration.isAcceptableOrUnknown(
              data['planned_duration']!, _plannedDurationMeta));
    } else if (isInserting) {
      context.missing(_plannedDurationMeta);
    }
    if (data.containsKey('actually_done_duration')) {
      context.handle(
          _actuallyDoneDurationMeta,
          actuallyDoneDuration.isAcceptableOrUnknown(
              data['actually_done_duration']!, _actuallyDoneDurationMeta));
    }
    if (data.containsKey('starting_time')) {
      context.handle(
          _startingTimeMeta,
          startingTime.isAcceptableOrUnknown(
              data['starting_time']!, _startingTimeMeta));
    } else if (isInserting) {
      context.missing(_startingTimeMeta);
    }
    if (data.containsKey('exp_finish_time')) {
      context.handle(
          _expFinishTimeMeta,
          expFinishTime.isAcceptableOrUnknown(
              data['exp_finish_time']!, _expFinishTimeMeta));
    }
    if (data.containsKey('finish_time')) {
      context.handle(
          _finishTimeMeta,
          finishTime.isAcceptableOrUnknown(
              data['finish_time']!, _finishTimeMeta));
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MemorySessionVariableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MemorySessionVariableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      roundGoal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}round_goal'])!,
      durationLeft: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_left']),
      runTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}run_time'])!,
      plannedDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}planned_duration'])!,
      actuallyDoneDuration: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}actually_done_duration']),
      startingTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}starting_time'])!,
      expFinishTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}exp_finish_time']),
      finishTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish_time']),
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subject']),
    );
  }

  @override
  $MemorySessionVariableTable createAlias(String alias) {
    return $MemorySessionVariableTable(attachedDatabase, alias);
  }
}

class MemorySessionVariableData extends DataClass
    implements Insertable<MemorySessionVariableData> {
  final int id;
  final int roundGoal;
  final int? durationLeft;
  final int runTime;
  final int plannedDuration;
  final int? actuallyDoneDuration;
  final DateTime startingTime;
  final DateTime? expFinishTime;
  final DateTime? finishTime;
  final bool? completed;
  final String type;
  final int? subject;
  const MemorySessionVariableData(
      {required this.id,
      required this.roundGoal,
      this.durationLeft,
      required this.runTime,
      required this.plannedDuration,
      this.actuallyDoneDuration,
      required this.startingTime,
      this.expFinishTime,
      this.finishTime,
      this.completed,
      required this.type,
      this.subject});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['round_goal'] = Variable<int>(roundGoal);
    if (!nullToAbsent || durationLeft != null) {
      map['duration_left'] = Variable<int>(durationLeft);
    }
    map['run_time'] = Variable<int>(runTime);
    map['planned_duration'] = Variable<int>(plannedDuration);
    if (!nullToAbsent || actuallyDoneDuration != null) {
      map['actually_done_duration'] = Variable<int>(actuallyDoneDuration);
    }
    map['starting_time'] = Variable<DateTime>(startingTime);
    if (!nullToAbsent || expFinishTime != null) {
      map['exp_finish_time'] = Variable<DateTime>(expFinishTime);
    }
    if (!nullToAbsent || finishTime != null) {
      map['finish_time'] = Variable<DateTime>(finishTime);
    }
    if (!nullToAbsent || completed != null) {
      map['completed'] = Variable<bool>(completed);
    }
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || subject != null) {
      map['subject'] = Variable<int>(subject);
    }
    return map;
  }

  MemorySessionVariableCompanion toCompanion(bool nullToAbsent) {
    return MemorySessionVariableCompanion(
      id: Value(id),
      roundGoal: Value(roundGoal),
      durationLeft: durationLeft == null && nullToAbsent
          ? const Value.absent()
          : Value(durationLeft),
      runTime: Value(runTime),
      plannedDuration: Value(plannedDuration),
      actuallyDoneDuration: actuallyDoneDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(actuallyDoneDuration),
      startingTime: Value(startingTime),
      expFinishTime: expFinishTime == null && nullToAbsent
          ? const Value.absent()
          : Value(expFinishTime),
      finishTime: finishTime == null && nullToAbsent
          ? const Value.absent()
          : Value(finishTime),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
      type: Value(type),
      subject: subject == null && nullToAbsent
          ? const Value.absent()
          : Value(subject),
    );
  }

  factory MemorySessionVariableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemorySessionVariableData(
      id: serializer.fromJson<int>(json['id']),
      roundGoal: serializer.fromJson<int>(json['roundGoal']),
      durationLeft: serializer.fromJson<int?>(json['durationLeft']),
      runTime: serializer.fromJson<int>(json['runTime']),
      plannedDuration: serializer.fromJson<int>(json['plannedDuration']),
      actuallyDoneDuration:
          serializer.fromJson<int?>(json['actuallyDoneDuration']),
      startingTime: serializer.fromJson<DateTime>(json['startingTime']),
      expFinishTime: serializer.fromJson<DateTime?>(json['expFinishTime']),
      finishTime: serializer.fromJson<DateTime?>(json['finishTime']),
      completed: serializer.fromJson<bool?>(json['completed']),
      type: serializer.fromJson<String>(json['type']),
      subject: serializer.fromJson<int?>(json['subject']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'roundGoal': serializer.toJson<int>(roundGoal),
      'durationLeft': serializer.toJson<int?>(durationLeft),
      'runTime': serializer.toJson<int>(runTime),
      'plannedDuration': serializer.toJson<int>(plannedDuration),
      'actuallyDoneDuration': serializer.toJson<int?>(actuallyDoneDuration),
      'startingTime': serializer.toJson<DateTime>(startingTime),
      'expFinishTime': serializer.toJson<DateTime?>(expFinishTime),
      'finishTime': serializer.toJson<DateTime?>(finishTime),
      'completed': serializer.toJson<bool?>(completed),
      'type': serializer.toJson<String>(type),
      'subject': serializer.toJson<int?>(subject),
    };
  }

  MemorySessionVariableData copyWith(
          {int? id,
          int? roundGoal,
          Value<int?> durationLeft = const Value.absent(),
          int? runTime,
          int? plannedDuration,
          Value<int?> actuallyDoneDuration = const Value.absent(),
          DateTime? startingTime,
          Value<DateTime?> expFinishTime = const Value.absent(),
          Value<DateTime?> finishTime = const Value.absent(),
          Value<bool?> completed = const Value.absent(),
          String? type,
          Value<int?> subject = const Value.absent()}) =>
      MemorySessionVariableData(
        id: id ?? this.id,
        roundGoal: roundGoal ?? this.roundGoal,
        durationLeft:
            durationLeft.present ? durationLeft.value : this.durationLeft,
        runTime: runTime ?? this.runTime,
        plannedDuration: plannedDuration ?? this.plannedDuration,
        actuallyDoneDuration: actuallyDoneDuration.present
            ? actuallyDoneDuration.value
            : this.actuallyDoneDuration,
        startingTime: startingTime ?? this.startingTime,
        expFinishTime:
            expFinishTime.present ? expFinishTime.value : this.expFinishTime,
        finishTime: finishTime.present ? finishTime.value : this.finishTime,
        completed: completed.present ? completed.value : this.completed,
        type: type ?? this.type,
        subject: subject.present ? subject.value : this.subject,
      );
  MemorySessionVariableData copyWithCompanion(
      MemorySessionVariableCompanion data) {
    return MemorySessionVariableData(
      id: data.id.present ? data.id.value : this.id,
      roundGoal: data.roundGoal.present ? data.roundGoal.value : this.roundGoal,
      durationLeft: data.durationLeft.present
          ? data.durationLeft.value
          : this.durationLeft,
      runTime: data.runTime.present ? data.runTime.value : this.runTime,
      plannedDuration: data.plannedDuration.present
          ? data.plannedDuration.value
          : this.plannedDuration,
      actuallyDoneDuration: data.actuallyDoneDuration.present
          ? data.actuallyDoneDuration.value
          : this.actuallyDoneDuration,
      startingTime: data.startingTime.present
          ? data.startingTime.value
          : this.startingTime,
      expFinishTime: data.expFinishTime.present
          ? data.expFinishTime.value
          : this.expFinishTime,
      finishTime:
          data.finishTime.present ? data.finishTime.value : this.finishTime,
      completed: data.completed.present ? data.completed.value : this.completed,
      type: data.type.present ? data.type.value : this.type,
      subject: data.subject.present ? data.subject.value : this.subject,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MemorySessionVariableData(')
          ..write('id: $id, ')
          ..write('roundGoal: $roundGoal, ')
          ..write('durationLeft: $durationLeft, ')
          ..write('runTime: $runTime, ')
          ..write('plannedDuration: $plannedDuration, ')
          ..write('actuallyDoneDuration: $actuallyDoneDuration, ')
          ..write('startingTime: $startingTime, ')
          ..write('expFinishTime: $expFinishTime, ')
          ..write('finishTime: $finishTime, ')
          ..write('completed: $completed, ')
          ..write('type: $type, ')
          ..write('subject: $subject')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      roundGoal,
      durationLeft,
      runTime,
      plannedDuration,
      actuallyDoneDuration,
      startingTime,
      expFinishTime,
      finishTime,
      completed,
      type,
      subject);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemorySessionVariableData &&
          other.id == this.id &&
          other.roundGoal == this.roundGoal &&
          other.durationLeft == this.durationLeft &&
          other.runTime == this.runTime &&
          other.plannedDuration == this.plannedDuration &&
          other.actuallyDoneDuration == this.actuallyDoneDuration &&
          other.startingTime == this.startingTime &&
          other.expFinishTime == this.expFinishTime &&
          other.finishTime == this.finishTime &&
          other.completed == this.completed &&
          other.type == this.type &&
          other.subject == this.subject);
}

class MemorySessionVariableCompanion
    extends UpdateCompanion<MemorySessionVariableData> {
  final Value<int> id;
  final Value<int> roundGoal;
  final Value<int?> durationLeft;
  final Value<int> runTime;
  final Value<int> plannedDuration;
  final Value<int?> actuallyDoneDuration;
  final Value<DateTime> startingTime;
  final Value<DateTime?> expFinishTime;
  final Value<DateTime?> finishTime;
  final Value<bool?> completed;
  final Value<String> type;
  final Value<int?> subject;
  const MemorySessionVariableCompanion({
    this.id = const Value.absent(),
    this.roundGoal = const Value.absent(),
    this.durationLeft = const Value.absent(),
    this.runTime = const Value.absent(),
    this.plannedDuration = const Value.absent(),
    this.actuallyDoneDuration = const Value.absent(),
    this.startingTime = const Value.absent(),
    this.expFinishTime = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.completed = const Value.absent(),
    this.type = const Value.absent(),
    this.subject = const Value.absent(),
  });
  MemorySessionVariableCompanion.insert({
    this.id = const Value.absent(),
    required int roundGoal,
    this.durationLeft = const Value.absent(),
    required int runTime,
    required int plannedDuration,
    this.actuallyDoneDuration = const Value.absent(),
    required DateTime startingTime,
    this.expFinishTime = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.completed = const Value.absent(),
    required String type,
    this.subject = const Value.absent(),
  })  : roundGoal = Value(roundGoal),
        runTime = Value(runTime),
        plannedDuration = Value(plannedDuration),
        startingTime = Value(startingTime),
        type = Value(type);
  static Insertable<MemorySessionVariableData> custom({
    Expression<int>? id,
    Expression<int>? roundGoal,
    Expression<int>? durationLeft,
    Expression<int>? runTime,
    Expression<int>? plannedDuration,
    Expression<int>? actuallyDoneDuration,
    Expression<DateTime>? startingTime,
    Expression<DateTime>? expFinishTime,
    Expression<DateTime>? finishTime,
    Expression<bool>? completed,
    Expression<String>? type,
    Expression<int>? subject,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roundGoal != null) 'round_goal': roundGoal,
      if (durationLeft != null) 'duration_left': durationLeft,
      if (runTime != null) 'run_time': runTime,
      if (plannedDuration != null) 'planned_duration': plannedDuration,
      if (actuallyDoneDuration != null)
        'actually_done_duration': actuallyDoneDuration,
      if (startingTime != null) 'starting_time': startingTime,
      if (expFinishTime != null) 'exp_finish_time': expFinishTime,
      if (finishTime != null) 'finish_time': finishTime,
      if (completed != null) 'completed': completed,
      if (type != null) 'type': type,
      if (subject != null) 'subject': subject,
    });
  }

  MemorySessionVariableCompanion copyWith(
      {Value<int>? id,
      Value<int>? roundGoal,
      Value<int?>? durationLeft,
      Value<int>? runTime,
      Value<int>? plannedDuration,
      Value<int?>? actuallyDoneDuration,
      Value<DateTime>? startingTime,
      Value<DateTime?>? expFinishTime,
      Value<DateTime?>? finishTime,
      Value<bool?>? completed,
      Value<String>? type,
      Value<int?>? subject}) {
    return MemorySessionVariableCompanion(
      id: id ?? this.id,
      roundGoal: roundGoal ?? this.roundGoal,
      durationLeft: durationLeft ?? this.durationLeft,
      runTime: runTime ?? this.runTime,
      plannedDuration: plannedDuration ?? this.plannedDuration,
      actuallyDoneDuration: actuallyDoneDuration ?? this.actuallyDoneDuration,
      startingTime: startingTime ?? this.startingTime,
      expFinishTime: expFinishTime ?? this.expFinishTime,
      finishTime: finishTime ?? this.finishTime,
      completed: completed ?? this.completed,
      type: type ?? this.type,
      subject: subject ?? this.subject,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (roundGoal.present) {
      map['round_goal'] = Variable<int>(roundGoal.value);
    }
    if (durationLeft.present) {
      map['duration_left'] = Variable<int>(durationLeft.value);
    }
    if (runTime.present) {
      map['run_time'] = Variable<int>(runTime.value);
    }
    if (plannedDuration.present) {
      map['planned_duration'] = Variable<int>(plannedDuration.value);
    }
    if (actuallyDoneDuration.present) {
      map['actually_done_duration'] = Variable<int>(actuallyDoneDuration.value);
    }
    if (startingTime.present) {
      map['starting_time'] = Variable<DateTime>(startingTime.value);
    }
    if (expFinishTime.present) {
      map['exp_finish_time'] = Variable<DateTime>(expFinishTime.value);
    }
    if (finishTime.present) {
      map['finish_time'] = Variable<DateTime>(finishTime.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (subject.present) {
      map['subject'] = Variable<int>(subject.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemorySessionVariableCompanion(')
          ..write('id: $id, ')
          ..write('roundGoal: $roundGoal, ')
          ..write('durationLeft: $durationLeft, ')
          ..write('runTime: $runTime, ')
          ..write('plannedDuration: $plannedDuration, ')
          ..write('actuallyDoneDuration: $actuallyDoneDuration, ')
          ..write('startingTime: $startingTime, ')
          ..write('expFinishTime: $expFinishTime, ')
          ..write('finishTime: $finishTime, ')
          ..write('completed: $completed, ')
          ..write('type: $type, ')
          ..write('subject: $subject')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SettingsVariablesTable settingsVariables =
      $SettingsVariablesTable(this);
  late final $MemorySessionVariableTable memorySessionVariable =
      $MemorySessionVariableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [settingsVariables, memorySessionVariable];
}

typedef $$SettingsVariablesTableCreateCompanionBuilder
    = SettingsVariablesCompanion Function({
  Value<int> id,
  required bool windowOnTop,
  required int requestedNumberOfSessions,
  required int selectedBreakDurationStored,
  required int selectedWorkDurationStored,
  required int selectedLongBreakDurationStored,
});
typedef $$SettingsVariablesTableUpdateCompanionBuilder
    = SettingsVariablesCompanion Function({
  Value<int> id,
  Value<bool> windowOnTop,
  Value<int> requestedNumberOfSessions,
  Value<int> selectedBreakDurationStored,
  Value<int> selectedWorkDurationStored,
  Value<int> selectedLongBreakDurationStored,
});

class $$SettingsVariablesTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsVariablesTable> {
  $$SettingsVariablesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get windowOnTop => $composableBuilder(
      column: $table.windowOnTop, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get requestedNumberOfSessions => $composableBuilder(
      column: $table.requestedNumberOfSessions,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get selectedBreakDurationStored => $composableBuilder(
      column: $table.selectedBreakDurationStored,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get selectedWorkDurationStored => $composableBuilder(
      column: $table.selectedWorkDurationStored,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get selectedLongBreakDurationStored => $composableBuilder(
      column: $table.selectedLongBreakDurationStored,
      builder: (column) => ColumnFilters(column));
}

class $$SettingsVariablesTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsVariablesTable> {
  $$SettingsVariablesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get windowOnTop => $composableBuilder(
      column: $table.windowOnTop, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get requestedNumberOfSessions => $composableBuilder(
      column: $table.requestedNumberOfSessions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get selectedBreakDurationStored => $composableBuilder(
      column: $table.selectedBreakDurationStored,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get selectedWorkDurationStored => $composableBuilder(
      column: $table.selectedWorkDurationStored,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get selectedLongBreakDurationStored =>
      $composableBuilder(
          column: $table.selectedLongBreakDurationStored,
          builder: (column) => ColumnOrderings(column));
}

class $$SettingsVariablesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsVariablesTable> {
  $$SettingsVariablesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get windowOnTop => $composableBuilder(
      column: $table.windowOnTop, builder: (column) => column);

  GeneratedColumn<int> get requestedNumberOfSessions => $composableBuilder(
      column: $table.requestedNumberOfSessions, builder: (column) => column);

  GeneratedColumn<int> get selectedBreakDurationStored => $composableBuilder(
      column: $table.selectedBreakDurationStored, builder: (column) => column);

  GeneratedColumn<int> get selectedWorkDurationStored => $composableBuilder(
      column: $table.selectedWorkDurationStored, builder: (column) => column);

  GeneratedColumn<int> get selectedLongBreakDurationStored =>
      $composableBuilder(
          column: $table.selectedLongBreakDurationStored,
          builder: (column) => column);
}

class $$SettingsVariablesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingsVariablesTable,
    SettingsVariable,
    $$SettingsVariablesTableFilterComposer,
    $$SettingsVariablesTableOrderingComposer,
    $$SettingsVariablesTableAnnotationComposer,
    $$SettingsVariablesTableCreateCompanionBuilder,
    $$SettingsVariablesTableUpdateCompanionBuilder,
    (
      SettingsVariable,
      BaseReferences<_$AppDatabase, $SettingsVariablesTable, SettingsVariable>
    ),
    SettingsVariable,
    PrefetchHooks Function()> {
  $$SettingsVariablesTableTableManager(
      _$AppDatabase db, $SettingsVariablesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsVariablesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsVariablesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsVariablesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> windowOnTop = const Value.absent(),
            Value<int> requestedNumberOfSessions = const Value.absent(),
            Value<int> selectedBreakDurationStored = const Value.absent(),
            Value<int> selectedWorkDurationStored = const Value.absent(),
            Value<int> selectedLongBreakDurationStored = const Value.absent(),
          }) =>
              SettingsVariablesCompanion(
            id: id,
            windowOnTop: windowOnTop,
            requestedNumberOfSessions: requestedNumberOfSessions,
            selectedBreakDurationStored: selectedBreakDurationStored,
            selectedWorkDurationStored: selectedWorkDurationStored,
            selectedLongBreakDurationStored: selectedLongBreakDurationStored,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required bool windowOnTop,
            required int requestedNumberOfSessions,
            required int selectedBreakDurationStored,
            required int selectedWorkDurationStored,
            required int selectedLongBreakDurationStored,
          }) =>
              SettingsVariablesCompanion.insert(
            id: id,
            windowOnTop: windowOnTop,
            requestedNumberOfSessions: requestedNumberOfSessions,
            selectedBreakDurationStored: selectedBreakDurationStored,
            selectedWorkDurationStored: selectedWorkDurationStored,
            selectedLongBreakDurationStored: selectedLongBreakDurationStored,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SettingsVariablesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SettingsVariablesTable,
    SettingsVariable,
    $$SettingsVariablesTableFilterComposer,
    $$SettingsVariablesTableOrderingComposer,
    $$SettingsVariablesTableAnnotationComposer,
    $$SettingsVariablesTableCreateCompanionBuilder,
    $$SettingsVariablesTableUpdateCompanionBuilder,
    (
      SettingsVariable,
      BaseReferences<_$AppDatabase, $SettingsVariablesTable, SettingsVariable>
    ),
    SettingsVariable,
    PrefetchHooks Function()>;
typedef $$MemorySessionVariableTableCreateCompanionBuilder
    = MemorySessionVariableCompanion Function({
  Value<int> id,
  required int roundGoal,
  Value<int?> durationLeft,
  required int runTime,
  required int plannedDuration,
  Value<int?> actuallyDoneDuration,
  required DateTime startingTime,
  Value<DateTime?> expFinishTime,
  Value<DateTime?> finishTime,
  Value<bool?> completed,
  required String type,
  Value<int?> subject,
});
typedef $$MemorySessionVariableTableUpdateCompanionBuilder
    = MemorySessionVariableCompanion Function({
  Value<int> id,
  Value<int> roundGoal,
  Value<int?> durationLeft,
  Value<int> runTime,
  Value<int> plannedDuration,
  Value<int?> actuallyDoneDuration,
  Value<DateTime> startingTime,
  Value<DateTime?> expFinishTime,
  Value<DateTime?> finishTime,
  Value<bool?> completed,
  Value<String> type,
  Value<int?> subject,
});

class $$MemorySessionVariableTableFilterComposer
    extends Composer<_$AppDatabase, $MemorySessionVariableTable> {
  $$MemorySessionVariableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get roundGoal => $composableBuilder(
      column: $table.roundGoal, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationLeft => $composableBuilder(
      column: $table.durationLeft, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get runTime => $composableBuilder(
      column: $table.runTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get plannedDuration => $composableBuilder(
      column: $table.plannedDuration,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get actuallyDoneDuration => $composableBuilder(
      column: $table.actuallyDoneDuration,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startingTime => $composableBuilder(
      column: $table.startingTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expFinishTime => $composableBuilder(
      column: $table.expFinishTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get finishTime => $composableBuilder(
      column: $table.finishTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));
}

class $$MemorySessionVariableTableOrderingComposer
    extends Composer<_$AppDatabase, $MemorySessionVariableTable> {
  $$MemorySessionVariableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get roundGoal => $composableBuilder(
      column: $table.roundGoal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationLeft => $composableBuilder(
      column: $table.durationLeft,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get runTime => $composableBuilder(
      column: $table.runTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get plannedDuration => $composableBuilder(
      column: $table.plannedDuration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get actuallyDoneDuration => $composableBuilder(
      column: $table.actuallyDoneDuration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startingTime => $composableBuilder(
      column: $table.startingTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expFinishTime => $composableBuilder(
      column: $table.expFinishTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get finishTime => $composableBuilder(
      column: $table.finishTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));
}

class $$MemorySessionVariableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MemorySessionVariableTable> {
  $$MemorySessionVariableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get roundGoal =>
      $composableBuilder(column: $table.roundGoal, builder: (column) => column);

  GeneratedColumn<int> get durationLeft => $composableBuilder(
      column: $table.durationLeft, builder: (column) => column);

  GeneratedColumn<int> get runTime =>
      $composableBuilder(column: $table.runTime, builder: (column) => column);

  GeneratedColumn<int> get plannedDuration => $composableBuilder(
      column: $table.plannedDuration, builder: (column) => column);

  GeneratedColumn<int> get actuallyDoneDuration => $composableBuilder(
      column: $table.actuallyDoneDuration, builder: (column) => column);

  GeneratedColumn<DateTime> get startingTime => $composableBuilder(
      column: $table.startingTime, builder: (column) => column);

  GeneratedColumn<DateTime> get expFinishTime => $composableBuilder(
      column: $table.expFinishTime, builder: (column) => column);

  GeneratedColumn<DateTime> get finishTime => $composableBuilder(
      column: $table.finishTime, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);
}

class $$MemorySessionVariableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MemorySessionVariableTable,
    MemorySessionVariableData,
    $$MemorySessionVariableTableFilterComposer,
    $$MemorySessionVariableTableOrderingComposer,
    $$MemorySessionVariableTableAnnotationComposer,
    $$MemorySessionVariableTableCreateCompanionBuilder,
    $$MemorySessionVariableTableUpdateCompanionBuilder,
    (
      MemorySessionVariableData,
      BaseReferences<_$AppDatabase, $MemorySessionVariableTable,
          MemorySessionVariableData>
    ),
    MemorySessionVariableData,
    PrefetchHooks Function()> {
  $$MemorySessionVariableTableTableManager(
      _$AppDatabase db, $MemorySessionVariableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MemorySessionVariableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$MemorySessionVariableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemorySessionVariableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> roundGoal = const Value.absent(),
            Value<int?> durationLeft = const Value.absent(),
            Value<int> runTime = const Value.absent(),
            Value<int> plannedDuration = const Value.absent(),
            Value<int?> actuallyDoneDuration = const Value.absent(),
            Value<DateTime> startingTime = const Value.absent(),
            Value<DateTime?> expFinishTime = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<bool?> completed = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int?> subject = const Value.absent(),
          }) =>
              MemorySessionVariableCompanion(
            id: id,
            roundGoal: roundGoal,
            durationLeft: durationLeft,
            runTime: runTime,
            plannedDuration: plannedDuration,
            actuallyDoneDuration: actuallyDoneDuration,
            startingTime: startingTime,
            expFinishTime: expFinishTime,
            finishTime: finishTime,
            completed: completed,
            type: type,
            subject: subject,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int roundGoal,
            Value<int?> durationLeft = const Value.absent(),
            required int runTime,
            required int plannedDuration,
            Value<int?> actuallyDoneDuration = const Value.absent(),
            required DateTime startingTime,
            Value<DateTime?> expFinishTime = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<bool?> completed = const Value.absent(),
            required String type,
            Value<int?> subject = const Value.absent(),
          }) =>
              MemorySessionVariableCompanion.insert(
            id: id,
            roundGoal: roundGoal,
            durationLeft: durationLeft,
            runTime: runTime,
            plannedDuration: plannedDuration,
            actuallyDoneDuration: actuallyDoneDuration,
            startingTime: startingTime,
            expFinishTime: expFinishTime,
            finishTime: finishTime,
            completed: completed,
            type: type,
            subject: subject,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MemorySessionVariableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $MemorySessionVariableTable,
        MemorySessionVariableData,
        $$MemorySessionVariableTableFilterComposer,
        $$MemorySessionVariableTableOrderingComposer,
        $$MemorySessionVariableTableAnnotationComposer,
        $$MemorySessionVariableTableCreateCompanionBuilder,
        $$MemorySessionVariableTableUpdateCompanionBuilder,
        (
          MemorySessionVariableData,
          BaseReferences<_$AppDatabase, $MemorySessionVariableTable,
              MemorySessionVariableData>
        ),
        MemorySessionVariableData,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SettingsVariablesTableTableManager get settingsVariables =>
      $$SettingsVariablesTableTableManager(_db, _db.settingsVariables);
  $$MemorySessionVariableTableTableManager get memorySessionVariable =>
      $$MemorySessionVariableTableTableManager(_db, _db.memorySessionVariable);
}
