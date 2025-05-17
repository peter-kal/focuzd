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
  static const VerificationMeta _roundPlanningByDefaultMeta =
      const VerificationMeta('roundPlanningByDefault');
  @override
  late final GeneratedColumn<bool> roundPlanningByDefault =
      GeneratedColumn<bool>('round_planning_by_default', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("round_planning_by_default" IN (0, 1))'),
          defaultValue: Constant(true));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        windowOnTop,
        requestedNumberOfSessions,
        selectedBreakDurationStored,
        selectedWorkDurationStored,
        selectedLongBreakDurationStored,
        roundPlanningByDefault
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
    if (data.containsKey('round_planning_by_default')) {
      context.handle(
          _roundPlanningByDefaultMeta,
          roundPlanningByDefault.isAcceptableOrUnknown(
              data['round_planning_by_default']!, _roundPlanningByDefaultMeta));
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
      roundPlanningByDefault: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}round_planning_by_default'])!,
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
  final bool roundPlanningByDefault;
  const SettingsVariable(
      {required this.id,
      required this.windowOnTop,
      required this.requestedNumberOfSessions,
      required this.selectedBreakDurationStored,
      required this.selectedWorkDurationStored,
      required this.selectedLongBreakDurationStored,
      required this.roundPlanningByDefault});
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
    map['round_planning_by_default'] = Variable<bool>(roundPlanningByDefault);
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
      roundPlanningByDefault: Value(roundPlanningByDefault),
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
      roundPlanningByDefault:
          serializer.fromJson<bool>(json['roundPlanningByDefault']),
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
      'roundPlanningByDefault': serializer.toJson<bool>(roundPlanningByDefault),
    };
  }

  SettingsVariable copyWith(
          {int? id,
          bool? windowOnTop,
          int? requestedNumberOfSessions,
          int? selectedBreakDurationStored,
          int? selectedWorkDurationStored,
          int? selectedLongBreakDurationStored,
          bool? roundPlanningByDefault}) =>
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
        roundPlanningByDefault:
            roundPlanningByDefault ?? this.roundPlanningByDefault,
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
      roundPlanningByDefault: data.roundPlanningByDefault.present
          ? data.roundPlanningByDefault.value
          : this.roundPlanningByDefault,
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
              'selectedLongBreakDurationStored: $selectedLongBreakDurationStored, ')
          ..write('roundPlanningByDefault: $roundPlanningByDefault')
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
      selectedLongBreakDurationStored,
      roundPlanningByDefault);
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
              this.selectedLongBreakDurationStored &&
          other.roundPlanningByDefault == this.roundPlanningByDefault);
}

class SettingsVariablesCompanion extends UpdateCompanion<SettingsVariable> {
  final Value<int> id;
  final Value<bool> windowOnTop;
  final Value<int> requestedNumberOfSessions;
  final Value<int> selectedBreakDurationStored;
  final Value<int> selectedWorkDurationStored;
  final Value<int> selectedLongBreakDurationStored;
  final Value<bool> roundPlanningByDefault;
  const SettingsVariablesCompanion({
    this.id = const Value.absent(),
    this.windowOnTop = const Value.absent(),
    this.requestedNumberOfSessions = const Value.absent(),
    this.selectedBreakDurationStored = const Value.absent(),
    this.selectedWorkDurationStored = const Value.absent(),
    this.selectedLongBreakDurationStored = const Value.absent(),
    this.roundPlanningByDefault = const Value.absent(),
  });
  SettingsVariablesCompanion.insert({
    this.id = const Value.absent(),
    required bool windowOnTop,
    required int requestedNumberOfSessions,
    required int selectedBreakDurationStored,
    required int selectedWorkDurationStored,
    required int selectedLongBreakDurationStored,
    this.roundPlanningByDefault = const Value.absent(),
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
    Expression<bool>? roundPlanningByDefault,
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
      if (roundPlanningByDefault != null)
        'round_planning_by_default': roundPlanningByDefault,
    });
  }

  SettingsVariablesCompanion copyWith(
      {Value<int>? id,
      Value<bool>? windowOnTop,
      Value<int>? requestedNumberOfSessions,
      Value<int>? selectedBreakDurationStored,
      Value<int>? selectedWorkDurationStored,
      Value<int>? selectedLongBreakDurationStored,
      Value<bool>? roundPlanningByDefault}) {
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
      roundPlanningByDefault:
          roundPlanningByDefault ?? this.roundPlanningByDefault,
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
    if (roundPlanningByDefault.present) {
      map['round_planning_by_default'] =
          Variable<bool>(roundPlanningByDefault.value);
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
              'selectedLongBreakDurationStored: $selectedLongBreakDurationStored, ')
          ..write('roundPlanningByDefault: $roundPlanningByDefault')
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
  static const VerificationMeta _roundIdMeta =
      const VerificationMeta('roundId');
  @override
  late final GeneratedColumn<int> roundId = GeneratedColumn<int>(
      'round_id', aliasedName, false,
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
  static const VerificationMeta _expStartingTimeMeta =
      const VerificationMeta('expStartingTime');
  @override
  late final GeneratedColumn<DateTime> expStartingTime =
      GeneratedColumn<DateTime>('exp_starting_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
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
        roundId,
        durationLeft,
        runTime,
        plannedDuration,
        actuallyDoneDuration,
        expStartingTime,
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
    if (data.containsKey('round_id')) {
      context.handle(_roundIdMeta,
          roundId.isAcceptableOrUnknown(data['round_id']!, _roundIdMeta));
    } else if (isInserting) {
      context.missing(_roundIdMeta);
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
    if (data.containsKey('exp_starting_time')) {
      context.handle(
          _expStartingTimeMeta,
          expStartingTime.isAcceptableOrUnknown(
              data['exp_starting_time']!, _expStartingTimeMeta));
    } else if (isInserting) {
      context.missing(_expStartingTimeMeta);
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
      roundId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}round_id'])!,
      durationLeft: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_left']),
      runTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}run_time'])!,
      plannedDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}planned_duration'])!,
      actuallyDoneDuration: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}actually_done_duration']),
      expStartingTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}exp_starting_time'])!,
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
  final int roundId;
  final int? durationLeft;
  final int runTime;
  final int plannedDuration;
  final int? actuallyDoneDuration;
  final DateTime expStartingTime;
  final DateTime startingTime;
  final DateTime? expFinishTime;
  final DateTime? finishTime;
  final bool? completed;
  final String type;
  final int? subject;
  const MemorySessionVariableData(
      {required this.id,
      required this.roundGoal,
      required this.roundId,
      this.durationLeft,
      required this.runTime,
      required this.plannedDuration,
      this.actuallyDoneDuration,
      required this.expStartingTime,
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
    map['round_id'] = Variable<int>(roundId);
    if (!nullToAbsent || durationLeft != null) {
      map['duration_left'] = Variable<int>(durationLeft);
    }
    map['run_time'] = Variable<int>(runTime);
    map['planned_duration'] = Variable<int>(plannedDuration);
    if (!nullToAbsent || actuallyDoneDuration != null) {
      map['actually_done_duration'] = Variable<int>(actuallyDoneDuration);
    }
    map['exp_starting_time'] = Variable<DateTime>(expStartingTime);
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
      roundId: Value(roundId),
      durationLeft: durationLeft == null && nullToAbsent
          ? const Value.absent()
          : Value(durationLeft),
      runTime: Value(runTime),
      plannedDuration: Value(plannedDuration),
      actuallyDoneDuration: actuallyDoneDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(actuallyDoneDuration),
      expStartingTime: Value(expStartingTime),
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
      roundId: serializer.fromJson<int>(json['roundId']),
      durationLeft: serializer.fromJson<int?>(json['durationLeft']),
      runTime: serializer.fromJson<int>(json['runTime']),
      plannedDuration: serializer.fromJson<int>(json['plannedDuration']),
      actuallyDoneDuration:
          serializer.fromJson<int?>(json['actuallyDoneDuration']),
      expStartingTime: serializer.fromJson<DateTime>(json['expStartingTime']),
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
      'roundId': serializer.toJson<int>(roundId),
      'durationLeft': serializer.toJson<int?>(durationLeft),
      'runTime': serializer.toJson<int>(runTime),
      'plannedDuration': serializer.toJson<int>(plannedDuration),
      'actuallyDoneDuration': serializer.toJson<int?>(actuallyDoneDuration),
      'expStartingTime': serializer.toJson<DateTime>(expStartingTime),
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
          int? roundId,
          Value<int?> durationLeft = const Value.absent(),
          int? runTime,
          int? plannedDuration,
          Value<int?> actuallyDoneDuration = const Value.absent(),
          DateTime? expStartingTime,
          DateTime? startingTime,
          Value<DateTime?> expFinishTime = const Value.absent(),
          Value<DateTime?> finishTime = const Value.absent(),
          Value<bool?> completed = const Value.absent(),
          String? type,
          Value<int?> subject = const Value.absent()}) =>
      MemorySessionVariableData(
        id: id ?? this.id,
        roundGoal: roundGoal ?? this.roundGoal,
        roundId: roundId ?? this.roundId,
        durationLeft:
            durationLeft.present ? durationLeft.value : this.durationLeft,
        runTime: runTime ?? this.runTime,
        plannedDuration: plannedDuration ?? this.plannedDuration,
        actuallyDoneDuration: actuallyDoneDuration.present
            ? actuallyDoneDuration.value
            : this.actuallyDoneDuration,
        expStartingTime: expStartingTime ?? this.expStartingTime,
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
      roundId: data.roundId.present ? data.roundId.value : this.roundId,
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
      expStartingTime: data.expStartingTime.present
          ? data.expStartingTime.value
          : this.expStartingTime,
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
          ..write('roundId: $roundId, ')
          ..write('durationLeft: $durationLeft, ')
          ..write('runTime: $runTime, ')
          ..write('plannedDuration: $plannedDuration, ')
          ..write('actuallyDoneDuration: $actuallyDoneDuration, ')
          ..write('expStartingTime: $expStartingTime, ')
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
      roundId,
      durationLeft,
      runTime,
      plannedDuration,
      actuallyDoneDuration,
      expStartingTime,
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
          other.roundId == this.roundId &&
          other.durationLeft == this.durationLeft &&
          other.runTime == this.runTime &&
          other.plannedDuration == this.plannedDuration &&
          other.actuallyDoneDuration == this.actuallyDoneDuration &&
          other.expStartingTime == this.expStartingTime &&
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
  final Value<int> roundId;
  final Value<int?> durationLeft;
  final Value<int> runTime;
  final Value<int> plannedDuration;
  final Value<int?> actuallyDoneDuration;
  final Value<DateTime> expStartingTime;
  final Value<DateTime> startingTime;
  final Value<DateTime?> expFinishTime;
  final Value<DateTime?> finishTime;
  final Value<bool?> completed;
  final Value<String> type;
  final Value<int?> subject;
  const MemorySessionVariableCompanion({
    this.id = const Value.absent(),
    this.roundGoal = const Value.absent(),
    this.roundId = const Value.absent(),
    this.durationLeft = const Value.absent(),
    this.runTime = const Value.absent(),
    this.plannedDuration = const Value.absent(),
    this.actuallyDoneDuration = const Value.absent(),
    this.expStartingTime = const Value.absent(),
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
    required int roundId,
    this.durationLeft = const Value.absent(),
    required int runTime,
    required int plannedDuration,
    this.actuallyDoneDuration = const Value.absent(),
    required DateTime expStartingTime,
    required DateTime startingTime,
    this.expFinishTime = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.completed = const Value.absent(),
    required String type,
    this.subject = const Value.absent(),
  })  : roundGoal = Value(roundGoal),
        roundId = Value(roundId),
        runTime = Value(runTime),
        plannedDuration = Value(plannedDuration),
        expStartingTime = Value(expStartingTime),
        startingTime = Value(startingTime),
        type = Value(type);
  static Insertable<MemorySessionVariableData> custom({
    Expression<int>? id,
    Expression<int>? roundGoal,
    Expression<int>? roundId,
    Expression<int>? durationLeft,
    Expression<int>? runTime,
    Expression<int>? plannedDuration,
    Expression<int>? actuallyDoneDuration,
    Expression<DateTime>? expStartingTime,
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
      if (roundId != null) 'round_id': roundId,
      if (durationLeft != null) 'duration_left': durationLeft,
      if (runTime != null) 'run_time': runTime,
      if (plannedDuration != null) 'planned_duration': plannedDuration,
      if (actuallyDoneDuration != null)
        'actually_done_duration': actuallyDoneDuration,
      if (expStartingTime != null) 'exp_starting_time': expStartingTime,
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
      Value<int>? roundId,
      Value<int?>? durationLeft,
      Value<int>? runTime,
      Value<int>? plannedDuration,
      Value<int?>? actuallyDoneDuration,
      Value<DateTime>? expStartingTime,
      Value<DateTime>? startingTime,
      Value<DateTime?>? expFinishTime,
      Value<DateTime?>? finishTime,
      Value<bool?>? completed,
      Value<String>? type,
      Value<int?>? subject}) {
    return MemorySessionVariableCompanion(
      id: id ?? this.id,
      roundGoal: roundGoal ?? this.roundGoal,
      roundId: roundId ?? this.roundId,
      durationLeft: durationLeft ?? this.durationLeft,
      runTime: runTime ?? this.runTime,
      plannedDuration: plannedDuration ?? this.plannedDuration,
      actuallyDoneDuration: actuallyDoneDuration ?? this.actuallyDoneDuration,
      expStartingTime: expStartingTime ?? this.expStartingTime,
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
    if (roundId.present) {
      map['round_id'] = Variable<int>(roundId.value);
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
    if (expStartingTime.present) {
      map['exp_starting_time'] = Variable<DateTime>(expStartingTime.value);
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
          ..write('roundId: $roundId, ')
          ..write('durationLeft: $durationLeft, ')
          ..write('runTime: $runTime, ')
          ..write('plannedDuration: $plannedDuration, ')
          ..write('actuallyDoneDuration: $actuallyDoneDuration, ')
          ..write('expStartingTime: $expStartingTime, ')
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

class $RoundVariableTable extends RoundVariable
    with TableInfo<$RoundVariableTable, RoundVariableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoundVariableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
  static const VerificationMeta _propableCauseMeta =
      const VerificationMeta('propableCause');
  @override
  late final GeneratedColumn<String> propableCause = GeneratedColumn<String>(
      'propable_cause', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        completed,
        propableCause,
        plannedDuration,
        actuallyDoneDuration,
        startingTime,
        expFinishTime,
        finishTime,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'round_variable';
  @override
  VerificationContext validateIntegrity(Insertable<RoundVariableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    if (data.containsKey('propable_cause')) {
      context.handle(
          _propableCauseMeta,
          propableCause.isAcceptableOrUnknown(
              data['propable_cause']!, _propableCauseMeta));
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
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoundVariableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoundVariableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed']),
      propableCause: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}propable_cause']),
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
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $RoundVariableTable createAlias(String alias) {
    return $RoundVariableTable(attachedDatabase, alias);
  }
}

class RoundVariableData extends DataClass
    implements Insertable<RoundVariableData> {
  final int id;
  final bool? completed;
  final String? propableCause;
  final int plannedDuration;
  final int? actuallyDoneDuration;
  final DateTime startingTime;
  final DateTime? expFinishTime;
  final DateTime? finishTime;
  final String? notes;
  const RoundVariableData(
      {required this.id,
      this.completed,
      this.propableCause,
      required this.plannedDuration,
      this.actuallyDoneDuration,
      required this.startingTime,
      this.expFinishTime,
      this.finishTime,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || completed != null) {
      map['completed'] = Variable<bool>(completed);
    }
    if (!nullToAbsent || propableCause != null) {
      map['propable_cause'] = Variable<String>(propableCause);
    }
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
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  RoundVariableCompanion toCompanion(bool nullToAbsent) {
    return RoundVariableCompanion(
      id: Value(id),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
      propableCause: propableCause == null && nullToAbsent
          ? const Value.absent()
          : Value(propableCause),
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
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory RoundVariableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoundVariableData(
      id: serializer.fromJson<int>(json['id']),
      completed: serializer.fromJson<bool?>(json['completed']),
      propableCause: serializer.fromJson<String?>(json['propableCause']),
      plannedDuration: serializer.fromJson<int>(json['plannedDuration']),
      actuallyDoneDuration:
          serializer.fromJson<int?>(json['actuallyDoneDuration']),
      startingTime: serializer.fromJson<DateTime>(json['startingTime']),
      expFinishTime: serializer.fromJson<DateTime?>(json['expFinishTime']),
      finishTime: serializer.fromJson<DateTime?>(json['finishTime']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'completed': serializer.toJson<bool?>(completed),
      'propableCause': serializer.toJson<String?>(propableCause),
      'plannedDuration': serializer.toJson<int>(plannedDuration),
      'actuallyDoneDuration': serializer.toJson<int?>(actuallyDoneDuration),
      'startingTime': serializer.toJson<DateTime>(startingTime),
      'expFinishTime': serializer.toJson<DateTime?>(expFinishTime),
      'finishTime': serializer.toJson<DateTime?>(finishTime),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  RoundVariableData copyWith(
          {int? id,
          Value<bool?> completed = const Value.absent(),
          Value<String?> propableCause = const Value.absent(),
          int? plannedDuration,
          Value<int?> actuallyDoneDuration = const Value.absent(),
          DateTime? startingTime,
          Value<DateTime?> expFinishTime = const Value.absent(),
          Value<DateTime?> finishTime = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      RoundVariableData(
        id: id ?? this.id,
        completed: completed.present ? completed.value : this.completed,
        propableCause:
            propableCause.present ? propableCause.value : this.propableCause,
        plannedDuration: plannedDuration ?? this.plannedDuration,
        actuallyDoneDuration: actuallyDoneDuration.present
            ? actuallyDoneDuration.value
            : this.actuallyDoneDuration,
        startingTime: startingTime ?? this.startingTime,
        expFinishTime:
            expFinishTime.present ? expFinishTime.value : this.expFinishTime,
        finishTime: finishTime.present ? finishTime.value : this.finishTime,
        notes: notes.present ? notes.value : this.notes,
      );
  RoundVariableData copyWithCompanion(RoundVariableCompanion data) {
    return RoundVariableData(
      id: data.id.present ? data.id.value : this.id,
      completed: data.completed.present ? data.completed.value : this.completed,
      propableCause: data.propableCause.present
          ? data.propableCause.value
          : this.propableCause,
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
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoundVariableData(')
          ..write('id: $id, ')
          ..write('completed: $completed, ')
          ..write('propableCause: $propableCause, ')
          ..write('plannedDuration: $plannedDuration, ')
          ..write('actuallyDoneDuration: $actuallyDoneDuration, ')
          ..write('startingTime: $startingTime, ')
          ..write('expFinishTime: $expFinishTime, ')
          ..write('finishTime: $finishTime, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, completed, propableCause, plannedDuration,
      actuallyDoneDuration, startingTime, expFinishTime, finishTime, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoundVariableData &&
          other.id == this.id &&
          other.completed == this.completed &&
          other.propableCause == this.propableCause &&
          other.plannedDuration == this.plannedDuration &&
          other.actuallyDoneDuration == this.actuallyDoneDuration &&
          other.startingTime == this.startingTime &&
          other.expFinishTime == this.expFinishTime &&
          other.finishTime == this.finishTime &&
          other.notes == this.notes);
}

class RoundVariableCompanion extends UpdateCompanion<RoundVariableData> {
  final Value<int> id;
  final Value<bool?> completed;
  final Value<String?> propableCause;
  final Value<int> plannedDuration;
  final Value<int?> actuallyDoneDuration;
  final Value<DateTime> startingTime;
  final Value<DateTime?> expFinishTime;
  final Value<DateTime?> finishTime;
  final Value<String?> notes;
  const RoundVariableCompanion({
    this.id = const Value.absent(),
    this.completed = const Value.absent(),
    this.propableCause = const Value.absent(),
    this.plannedDuration = const Value.absent(),
    this.actuallyDoneDuration = const Value.absent(),
    this.startingTime = const Value.absent(),
    this.expFinishTime = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.notes = const Value.absent(),
  });
  RoundVariableCompanion.insert({
    this.id = const Value.absent(),
    this.completed = const Value.absent(),
    this.propableCause = const Value.absent(),
    required int plannedDuration,
    this.actuallyDoneDuration = const Value.absent(),
    required DateTime startingTime,
    this.expFinishTime = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.notes = const Value.absent(),
  })  : plannedDuration = Value(plannedDuration),
        startingTime = Value(startingTime);
  static Insertable<RoundVariableData> custom({
    Expression<int>? id,
    Expression<bool>? completed,
    Expression<String>? propableCause,
    Expression<int>? plannedDuration,
    Expression<int>? actuallyDoneDuration,
    Expression<DateTime>? startingTime,
    Expression<DateTime>? expFinishTime,
    Expression<DateTime>? finishTime,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (completed != null) 'completed': completed,
      if (propableCause != null) 'propable_cause': propableCause,
      if (plannedDuration != null) 'planned_duration': plannedDuration,
      if (actuallyDoneDuration != null)
        'actually_done_duration': actuallyDoneDuration,
      if (startingTime != null) 'starting_time': startingTime,
      if (expFinishTime != null) 'exp_finish_time': expFinishTime,
      if (finishTime != null) 'finish_time': finishTime,
      if (notes != null) 'notes': notes,
    });
  }

  RoundVariableCompanion copyWith(
      {Value<int>? id,
      Value<bool?>? completed,
      Value<String?>? propableCause,
      Value<int>? plannedDuration,
      Value<int?>? actuallyDoneDuration,
      Value<DateTime>? startingTime,
      Value<DateTime?>? expFinishTime,
      Value<DateTime?>? finishTime,
      Value<String?>? notes}) {
    return RoundVariableCompanion(
      id: id ?? this.id,
      completed: completed ?? this.completed,
      propableCause: propableCause ?? this.propableCause,
      plannedDuration: plannedDuration ?? this.plannedDuration,
      actuallyDoneDuration: actuallyDoneDuration ?? this.actuallyDoneDuration,
      startingTime: startingTime ?? this.startingTime,
      expFinishTime: expFinishTime ?? this.expFinishTime,
      finishTime: finishTime ?? this.finishTime,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (propableCause.present) {
      map['propable_cause'] = Variable<String>(propableCause.value);
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
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoundVariableCompanion(')
          ..write('id: $id, ')
          ..write('completed: $completed, ')
          ..write('propableCause: $propableCause, ')
          ..write('plannedDuration: $plannedDuration, ')
          ..write('actuallyDoneDuration: $actuallyDoneDuration, ')
          ..write('startingTime: $startingTime, ')
          ..write('expFinishTime: $expFinishTime, ')
          ..write('finishTime: $finishTime, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $SubjectTable extends Subject with TableInfo<$SubjectTable, SubjectData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 99),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _subjectidMeta =
      const VerificationMeta('subjectid');
  @override
  late final GeneratedColumn<int> subjectid = GeneratedColumn<int>(
      'subjectid', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES subject(id)');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastWorkedOnSessionIDMeta =
      const VerificationMeta('lastWorkedOnSessionID');
  @override
  late final GeneratedColumn<int> lastWorkedOnSessionID = GeneratedColumn<int>(
      'last_worked_on_session_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES memory_session_variable (id)'));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, subjectid, createdAt, updatedAt, lastWorkedOnSessionID, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subject';
  @override
  VerificationContext validateIntegrity(Insertable<SubjectData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('subjectid')) {
      context.handle(_subjectidMeta,
          subjectid.isAcceptableOrUnknown(data['subjectid']!, _subjectidMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('last_worked_on_session_i_d')) {
      context.handle(
          _lastWorkedOnSessionIDMeta,
          lastWorkedOnSessionID.isAcceptableOrUnknown(
              data['last_worked_on_session_i_d']!, _lastWorkedOnSessionIDMeta));
    } else if (isInserting) {
      context.missing(_lastWorkedOnSessionIDMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubjectData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubjectData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      subjectid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subjectid']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      lastWorkedOnSessionID: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}last_worked_on_session_i_d'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $SubjectTable createAlias(String alias) {
    return $SubjectTable(attachedDatabase, alias);
  }
}

class SubjectData extends DataClass implements Insertable<SubjectData> {
  final int id;
  final String name;
  final int? subjectid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int lastWorkedOnSessionID;
  final String? notes;
  const SubjectData(
      {required this.id,
      required this.name,
      this.subjectid,
      required this.createdAt,
      required this.updatedAt,
      required this.lastWorkedOnSessionID,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || subjectid != null) {
      map['subjectid'] = Variable<int>(subjectid);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['last_worked_on_session_i_d'] = Variable<int>(lastWorkedOnSessionID);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  SubjectCompanion toCompanion(bool nullToAbsent) {
    return SubjectCompanion(
      id: Value(id),
      name: Value(name),
      subjectid: subjectid == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      lastWorkedOnSessionID: Value(lastWorkedOnSessionID),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory SubjectData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubjectData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subjectid: serializer.fromJson<int?>(json['subjectid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      lastWorkedOnSessionID:
          serializer.fromJson<int>(json['lastWorkedOnSessionID']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'subjectid': serializer.toJson<int?>(subjectid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'lastWorkedOnSessionID': serializer.toJson<int>(lastWorkedOnSessionID),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  SubjectData copyWith(
          {int? id,
          String? name,
          Value<int?> subjectid = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          int? lastWorkedOnSessionID,
          Value<String?> notes = const Value.absent()}) =>
      SubjectData(
        id: id ?? this.id,
        name: name ?? this.name,
        subjectid: subjectid.present ? subjectid.value : this.subjectid,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        lastWorkedOnSessionID:
            lastWorkedOnSessionID ?? this.lastWorkedOnSessionID,
        notes: notes.present ? notes.value : this.notes,
      );
  SubjectData copyWithCompanion(SubjectCompanion data) {
    return SubjectData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      subjectid: data.subjectid.present ? data.subjectid.value : this.subjectid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastWorkedOnSessionID: data.lastWorkedOnSessionID.present
          ? data.lastWorkedOnSessionID.value
          : this.lastWorkedOnSessionID,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubjectData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subjectid: $subjectid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastWorkedOnSessionID: $lastWorkedOnSessionID, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, subjectid, createdAt, updatedAt, lastWorkedOnSessionID, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubjectData &&
          other.id == this.id &&
          other.name == this.name &&
          other.subjectid == this.subjectid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.lastWorkedOnSessionID == this.lastWorkedOnSessionID &&
          other.notes == this.notes);
}

class SubjectCompanion extends UpdateCompanion<SubjectData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> subjectid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> lastWorkedOnSessionID;
  final Value<String?> notes;
  const SubjectCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subjectid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastWorkedOnSessionID = const Value.absent(),
    this.notes = const Value.absent(),
  });
  SubjectCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.subjectid = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    required int lastWorkedOnSessionID,
    this.notes = const Value.absent(),
  })  : name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        lastWorkedOnSessionID = Value(lastWorkedOnSessionID);
  static Insertable<SubjectData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? subjectid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? lastWorkedOnSessionID,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subjectid != null) 'subjectid': subjectid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (lastWorkedOnSessionID != null)
        'last_worked_on_session_i_d': lastWorkedOnSessionID,
      if (notes != null) 'notes': notes,
    });
  }

  SubjectCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int?>? subjectid,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? lastWorkedOnSessionID,
      Value<String?>? notes}) {
    return SubjectCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subjectid: subjectid ?? this.subjectid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastWorkedOnSessionID:
          lastWorkedOnSessionID ?? this.lastWorkedOnSessionID,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (subjectid.present) {
      map['subjectid'] = Variable<int>(subjectid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (lastWorkedOnSessionID.present) {
      map['last_worked_on_session_i_d'] =
          Variable<int>(lastWorkedOnSessionID.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subjectid: $subjectid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastWorkedOnSessionID: $lastWorkedOnSessionID, ')
          ..write('notes: $notes')
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
  late final $RoundVariableTable roundVariable = $RoundVariableTable(this);
  late final $SubjectTable subject = $SubjectTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [settingsVariables, memorySessionVariable, roundVariable, subject];
}

typedef $$SettingsVariablesTableCreateCompanionBuilder
    = SettingsVariablesCompanion Function({
  Value<int> id,
  required bool windowOnTop,
  required int requestedNumberOfSessions,
  required int selectedBreakDurationStored,
  required int selectedWorkDurationStored,
  required int selectedLongBreakDurationStored,
  Value<bool> roundPlanningByDefault,
});
typedef $$SettingsVariablesTableUpdateCompanionBuilder
    = SettingsVariablesCompanion Function({
  Value<int> id,
  Value<bool> windowOnTop,
  Value<int> requestedNumberOfSessions,
  Value<int> selectedBreakDurationStored,
  Value<int> selectedWorkDurationStored,
  Value<int> selectedLongBreakDurationStored,
  Value<bool> roundPlanningByDefault,
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

  ColumnFilters<bool> get roundPlanningByDefault => $composableBuilder(
      column: $table.roundPlanningByDefault,
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

  ColumnOrderings<bool> get roundPlanningByDefault => $composableBuilder(
      column: $table.roundPlanningByDefault,
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

  GeneratedColumn<bool> get roundPlanningByDefault => $composableBuilder(
      column: $table.roundPlanningByDefault, builder: (column) => column);
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
            Value<bool> roundPlanningByDefault = const Value.absent(),
          }) =>
              SettingsVariablesCompanion(
            id: id,
            windowOnTop: windowOnTop,
            requestedNumberOfSessions: requestedNumberOfSessions,
            selectedBreakDurationStored: selectedBreakDurationStored,
            selectedWorkDurationStored: selectedWorkDurationStored,
            selectedLongBreakDurationStored: selectedLongBreakDurationStored,
            roundPlanningByDefault: roundPlanningByDefault,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required bool windowOnTop,
            required int requestedNumberOfSessions,
            required int selectedBreakDurationStored,
            required int selectedWorkDurationStored,
            required int selectedLongBreakDurationStored,
            Value<bool> roundPlanningByDefault = const Value.absent(),
          }) =>
              SettingsVariablesCompanion.insert(
            id: id,
            windowOnTop: windowOnTop,
            requestedNumberOfSessions: requestedNumberOfSessions,
            selectedBreakDurationStored: selectedBreakDurationStored,
            selectedWorkDurationStored: selectedWorkDurationStored,
            selectedLongBreakDurationStored: selectedLongBreakDurationStored,
            roundPlanningByDefault: roundPlanningByDefault,
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
  required int roundId,
  Value<int?> durationLeft,
  required int runTime,
  required int plannedDuration,
  Value<int?> actuallyDoneDuration,
  required DateTime expStartingTime,
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
  Value<int> roundId,
  Value<int?> durationLeft,
  Value<int> runTime,
  Value<int> plannedDuration,
  Value<int?> actuallyDoneDuration,
  Value<DateTime> expStartingTime,
  Value<DateTime> startingTime,
  Value<DateTime?> expFinishTime,
  Value<DateTime?> finishTime,
  Value<bool?> completed,
  Value<String> type,
  Value<int?> subject,
});

final class $$MemorySessionVariableTableReferences extends BaseReferences<
    _$AppDatabase, $MemorySessionVariableTable, MemorySessionVariableData> {
  $$MemorySessionVariableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SubjectTable, List<SubjectData>>
      _subjectRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.subject,
          aliasName: $_aliasNameGenerator(
              db.memorySessionVariable.id, db.subject.lastWorkedOnSessionID));

  $$SubjectTableProcessedTableManager get subjectRefs {
    final manager = $$SubjectTableTableManager($_db, $_db.subject).filter(
        (f) => f.lastWorkedOnSessionID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_subjectRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

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

  ColumnFilters<int> get roundId => $composableBuilder(
      column: $table.roundId, builder: (column) => ColumnFilters(column));

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

  ColumnFilters<DateTime> get expStartingTime => $composableBuilder(
      column: $table.expStartingTime,
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

  Expression<bool> subjectRefs(
      Expression<bool> Function($$SubjectTableFilterComposer f) f) {
    final $$SubjectTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.subject,
        getReferencedColumn: (t) => t.lastWorkedOnSessionID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SubjectTableFilterComposer(
              $db: $db,
              $table: $db.subject,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
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

  ColumnOrderings<int> get roundId => $composableBuilder(
      column: $table.roundId, builder: (column) => ColumnOrderings(column));

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

  ColumnOrderings<DateTime> get expStartingTime => $composableBuilder(
      column: $table.expStartingTime,
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

  GeneratedColumn<int> get roundId =>
      $composableBuilder(column: $table.roundId, builder: (column) => column);

  GeneratedColumn<int> get durationLeft => $composableBuilder(
      column: $table.durationLeft, builder: (column) => column);

  GeneratedColumn<int> get runTime =>
      $composableBuilder(column: $table.runTime, builder: (column) => column);

  GeneratedColumn<int> get plannedDuration => $composableBuilder(
      column: $table.plannedDuration, builder: (column) => column);

  GeneratedColumn<int> get actuallyDoneDuration => $composableBuilder(
      column: $table.actuallyDoneDuration, builder: (column) => column);

  GeneratedColumn<DateTime> get expStartingTime => $composableBuilder(
      column: $table.expStartingTime, builder: (column) => column);

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

  Expression<T> subjectRefs<T extends Object>(
      Expression<T> Function($$SubjectTableAnnotationComposer a) f) {
    final $$SubjectTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.subject,
        getReferencedColumn: (t) => t.lastWorkedOnSessionID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SubjectTableAnnotationComposer(
              $db: $db,
              $table: $db.subject,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
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
    (MemorySessionVariableData, $$MemorySessionVariableTableReferences),
    MemorySessionVariableData,
    PrefetchHooks Function({bool subjectRefs})> {
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
            Value<int> roundId = const Value.absent(),
            Value<int?> durationLeft = const Value.absent(),
            Value<int> runTime = const Value.absent(),
            Value<int> plannedDuration = const Value.absent(),
            Value<int?> actuallyDoneDuration = const Value.absent(),
            Value<DateTime> expStartingTime = const Value.absent(),
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
            roundId: roundId,
            durationLeft: durationLeft,
            runTime: runTime,
            plannedDuration: plannedDuration,
            actuallyDoneDuration: actuallyDoneDuration,
            expStartingTime: expStartingTime,
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
            required int roundId,
            Value<int?> durationLeft = const Value.absent(),
            required int runTime,
            required int plannedDuration,
            Value<int?> actuallyDoneDuration = const Value.absent(),
            required DateTime expStartingTime,
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
            roundId: roundId,
            durationLeft: durationLeft,
            runTime: runTime,
            plannedDuration: plannedDuration,
            actuallyDoneDuration: actuallyDoneDuration,
            expStartingTime: expStartingTime,
            startingTime: startingTime,
            expFinishTime: expFinishTime,
            finishTime: finishTime,
            completed: completed,
            type: type,
            subject: subject,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MemorySessionVariableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({subjectRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (subjectRefs) db.subject],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (subjectRefs)
                    await $_getPrefetchedData<MemorySessionVariableData,
                            $MemorySessionVariableTable, SubjectData>(
                        currentTable: table,
                        referencedTable: $$MemorySessionVariableTableReferences
                            ._subjectRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MemorySessionVariableTableReferences(
                                    db, table, p0)
                                .subjectRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.lastWorkedOnSessionID == item.id),
                        typedResults: items)
                ];
              },
            );
          },
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
        (MemorySessionVariableData, $$MemorySessionVariableTableReferences),
        MemorySessionVariableData,
        PrefetchHooks Function({bool subjectRefs})>;
typedef $$RoundVariableTableCreateCompanionBuilder = RoundVariableCompanion
    Function({
  Value<int> id,
  Value<bool?> completed,
  Value<String?> propableCause,
  required int plannedDuration,
  Value<int?> actuallyDoneDuration,
  required DateTime startingTime,
  Value<DateTime?> expFinishTime,
  Value<DateTime?> finishTime,
  Value<String?> notes,
});
typedef $$RoundVariableTableUpdateCompanionBuilder = RoundVariableCompanion
    Function({
  Value<int> id,
  Value<bool?> completed,
  Value<String?> propableCause,
  Value<int> plannedDuration,
  Value<int?> actuallyDoneDuration,
  Value<DateTime> startingTime,
  Value<DateTime?> expFinishTime,
  Value<DateTime?> finishTime,
  Value<String?> notes,
});

class $$RoundVariableTableFilterComposer
    extends Composer<_$AppDatabase, $RoundVariableTable> {
  $$RoundVariableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get propableCause => $composableBuilder(
      column: $table.propableCause, builder: (column) => ColumnFilters(column));

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

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$RoundVariableTableOrderingComposer
    extends Composer<_$AppDatabase, $RoundVariableTable> {
  $$RoundVariableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get propableCause => $composableBuilder(
      column: $table.propableCause,
      builder: (column) => ColumnOrderings(column));

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

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$RoundVariableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoundVariableTable> {
  $$RoundVariableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<String> get propableCause => $composableBuilder(
      column: $table.propableCause, builder: (column) => column);

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

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$RoundVariableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoundVariableTable,
    RoundVariableData,
    $$RoundVariableTableFilterComposer,
    $$RoundVariableTableOrderingComposer,
    $$RoundVariableTableAnnotationComposer,
    $$RoundVariableTableCreateCompanionBuilder,
    $$RoundVariableTableUpdateCompanionBuilder,
    (
      RoundVariableData,
      BaseReferences<_$AppDatabase, $RoundVariableTable, RoundVariableData>
    ),
    RoundVariableData,
    PrefetchHooks Function()> {
  $$RoundVariableTableTableManager(_$AppDatabase db, $RoundVariableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoundVariableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoundVariableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoundVariableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool?> completed = const Value.absent(),
            Value<String?> propableCause = const Value.absent(),
            Value<int> plannedDuration = const Value.absent(),
            Value<int?> actuallyDoneDuration = const Value.absent(),
            Value<DateTime> startingTime = const Value.absent(),
            Value<DateTime?> expFinishTime = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              RoundVariableCompanion(
            id: id,
            completed: completed,
            propableCause: propableCause,
            plannedDuration: plannedDuration,
            actuallyDoneDuration: actuallyDoneDuration,
            startingTime: startingTime,
            expFinishTime: expFinishTime,
            finishTime: finishTime,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool?> completed = const Value.absent(),
            Value<String?> propableCause = const Value.absent(),
            required int plannedDuration,
            Value<int?> actuallyDoneDuration = const Value.absent(),
            required DateTime startingTime,
            Value<DateTime?> expFinishTime = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              RoundVariableCompanion.insert(
            id: id,
            completed: completed,
            propableCause: propableCause,
            plannedDuration: plannedDuration,
            actuallyDoneDuration: actuallyDoneDuration,
            startingTime: startingTime,
            expFinishTime: expFinishTime,
            finishTime: finishTime,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RoundVariableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoundVariableTable,
    RoundVariableData,
    $$RoundVariableTableFilterComposer,
    $$RoundVariableTableOrderingComposer,
    $$RoundVariableTableAnnotationComposer,
    $$RoundVariableTableCreateCompanionBuilder,
    $$RoundVariableTableUpdateCompanionBuilder,
    (
      RoundVariableData,
      BaseReferences<_$AppDatabase, $RoundVariableTable, RoundVariableData>
    ),
    RoundVariableData,
    PrefetchHooks Function()>;
typedef $$SubjectTableCreateCompanionBuilder = SubjectCompanion Function({
  Value<int> id,
  required String name,
  Value<int?> subjectid,
  required DateTime createdAt,
  required DateTime updatedAt,
  required int lastWorkedOnSessionID,
  Value<String?> notes,
});
typedef $$SubjectTableUpdateCompanionBuilder = SubjectCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int?> subjectid,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> lastWorkedOnSessionID,
  Value<String?> notes,
});

final class $$SubjectTableReferences
    extends BaseReferences<_$AppDatabase, $SubjectTable, SubjectData> {
  $$SubjectTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MemorySessionVariableTable _lastWorkedOnSessionIDTable(
          _$AppDatabase db) =>
      db.memorySessionVariable.createAlias($_aliasNameGenerator(
          db.subject.lastWorkedOnSessionID, db.memorySessionVariable.id));

  $$MemorySessionVariableTableProcessedTableManager get lastWorkedOnSessionID {
    final $_column = $_itemColumn<int>('last_worked_on_session_i_d')!;

    final manager = $$MemorySessionVariableTableTableManager(
            $_db, $_db.memorySessionVariable)
        .filter((f) => f.id.sqlEquals($_column));
    final item =
        $_typedResult.readTableOrNull(_lastWorkedOnSessionIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$SubjectTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectTable> {
  $$SubjectTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subjectid => $composableBuilder(
      column: $table.subjectid, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$MemorySessionVariableTableFilterComposer get lastWorkedOnSessionID {
    final $$MemorySessionVariableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.lastWorkedOnSessionID,
            referencedTable: $db.memorySessionVariable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MemorySessionVariableTableFilterComposer(
                  $db: $db,
                  $table: $db.memorySessionVariable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$SubjectTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectTable> {
  $$SubjectTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subjectid => $composableBuilder(
      column: $table.subjectid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$MemorySessionVariableTableOrderingComposer get lastWorkedOnSessionID {
    final $$MemorySessionVariableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.lastWorkedOnSessionID,
            referencedTable: $db.memorySessionVariable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MemorySessionVariableTableOrderingComposer(
                  $db: $db,
                  $table: $db.memorySessionVariable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$SubjectTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectTable> {
  $$SubjectTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get subjectid =>
      $composableBuilder(column: $table.subjectid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$MemorySessionVariableTableAnnotationComposer get lastWorkedOnSessionID {
    final $$MemorySessionVariableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.lastWorkedOnSessionID,
            referencedTable: $db.memorySessionVariable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MemorySessionVariableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.memorySessionVariable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$SubjectTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubjectTable,
    SubjectData,
    $$SubjectTableFilterComposer,
    $$SubjectTableOrderingComposer,
    $$SubjectTableAnnotationComposer,
    $$SubjectTableCreateCompanionBuilder,
    $$SubjectTableUpdateCompanionBuilder,
    (SubjectData, $$SubjectTableReferences),
    SubjectData,
    PrefetchHooks Function({bool lastWorkedOnSessionID})> {
  $$SubjectTableTableManager(_$AppDatabase db, $SubjectTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int?> subjectid = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> lastWorkedOnSessionID = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              SubjectCompanion(
            id: id,
            name: name,
            subjectid: subjectid,
            createdAt: createdAt,
            updatedAt: updatedAt,
            lastWorkedOnSessionID: lastWorkedOnSessionID,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<int?> subjectid = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            required int lastWorkedOnSessionID,
            Value<String?> notes = const Value.absent(),
          }) =>
              SubjectCompanion.insert(
            id: id,
            name: name,
            subjectid: subjectid,
            createdAt: createdAt,
            updatedAt: updatedAt,
            lastWorkedOnSessionID: lastWorkedOnSessionID,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$SubjectTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({lastWorkedOnSessionID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (lastWorkedOnSessionID) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.lastWorkedOnSessionID,
                    referencedTable: $$SubjectTableReferences
                        ._lastWorkedOnSessionIDTable(db),
                    referencedColumn: $$SubjectTableReferences
                        ._lastWorkedOnSessionIDTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$SubjectTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SubjectTable,
    SubjectData,
    $$SubjectTableFilterComposer,
    $$SubjectTableOrderingComposer,
    $$SubjectTableAnnotationComposer,
    $$SubjectTableCreateCompanionBuilder,
    $$SubjectTableUpdateCompanionBuilder,
    (SubjectData, $$SubjectTableReferences),
    SubjectData,
    PrefetchHooks Function({bool lastWorkedOnSessionID})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SettingsVariablesTableTableManager get settingsVariables =>
      $$SettingsVariablesTableTableManager(_db, _db.settingsVariables);
  $$MemorySessionVariableTableTableManager get memorySessionVariable =>
      $$MemorySessionVariableTableTableManager(_db, _db.memorySessionVariable);
  $$RoundVariableTableTableManager get roundVariable =>
      $$RoundVariableTableTableManager(_db, _db.roundVariable);
  $$SubjectTableTableManager get subject =>
      $$SubjectTableTableManager(_db, _db.subject);
}
