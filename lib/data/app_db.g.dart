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
  static const VerificationMeta _selectedFocusDurationStoredMeta =
      const VerificationMeta('selectedFocusDurationStored');
  @override
  late final GeneratedColumn<int> selectedFocusDurationStored =
      GeneratedColumn<int>('selected_focus_duration_stored', aliasedName, false,
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
        selectedFocusDurationStored,
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
    if (data.containsKey('selected_focus_duration_stored')) {
      context.handle(
          _selectedFocusDurationStoredMeta,
          selectedFocusDurationStored.isAcceptableOrUnknown(
              data['selected_focus_duration_stored']!,
              _selectedFocusDurationStoredMeta));
    } else if (isInserting) {
      context.missing(_selectedFocusDurationStoredMeta);
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
      selectedFocusDurationStored: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}selected_focus_duration_stored'])!,
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
  final int selectedFocusDurationStored;
  final int selectedLongBreakDurationStored;
  final bool roundPlanningByDefault;
  const SettingsVariable(
      {required this.id,
      required this.windowOnTop,
      required this.requestedNumberOfSessions,
      required this.selectedBreakDurationStored,
      required this.selectedFocusDurationStored,
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
    map['selected_focus_duration_stored'] =
        Variable<int>(selectedFocusDurationStored);
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
      selectedFocusDurationStored: Value(selectedFocusDurationStored),
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
      selectedFocusDurationStored:
          serializer.fromJson<int>(json['selectedFocusDurationStored']),
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
      'selectedFocusDurationStored':
          serializer.toJson<int>(selectedFocusDurationStored),
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
          int? selectedFocusDurationStored,
          int? selectedLongBreakDurationStored,
          bool? roundPlanningByDefault}) =>
      SettingsVariable(
        id: id ?? this.id,
        windowOnTop: windowOnTop ?? this.windowOnTop,
        requestedNumberOfSessions:
            requestedNumberOfSessions ?? this.requestedNumberOfSessions,
        selectedBreakDurationStored:
            selectedBreakDurationStored ?? this.selectedBreakDurationStored,
        selectedFocusDurationStored:
            selectedFocusDurationStored ?? this.selectedFocusDurationStored,
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
      selectedFocusDurationStored: data.selectedFocusDurationStored.present
          ? data.selectedFocusDurationStored.value
          : this.selectedFocusDurationStored,
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
          ..write('selectedFocusDurationStored: $selectedFocusDurationStored, ')
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
      selectedFocusDurationStored,
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
          other.selectedFocusDurationStored ==
              this.selectedFocusDurationStored &&
          other.selectedLongBreakDurationStored ==
              this.selectedLongBreakDurationStored &&
          other.roundPlanningByDefault == this.roundPlanningByDefault);
}

class SettingsVariablesCompanion extends UpdateCompanion<SettingsVariable> {
  final Value<int> id;
  final Value<bool> windowOnTop;
  final Value<int> requestedNumberOfSessions;
  final Value<int> selectedBreakDurationStored;
  final Value<int> selectedFocusDurationStored;
  final Value<int> selectedLongBreakDurationStored;
  final Value<bool> roundPlanningByDefault;
  const SettingsVariablesCompanion({
    this.id = const Value.absent(),
    this.windowOnTop = const Value.absent(),
    this.requestedNumberOfSessions = const Value.absent(),
    this.selectedBreakDurationStored = const Value.absent(),
    this.selectedFocusDurationStored = const Value.absent(),
    this.selectedLongBreakDurationStored = const Value.absent(),
    this.roundPlanningByDefault = const Value.absent(),
  });
  SettingsVariablesCompanion.insert({
    this.id = const Value.absent(),
    required bool windowOnTop,
    required int requestedNumberOfSessions,
    required int selectedBreakDurationStored,
    required int selectedFocusDurationStored,
    required int selectedLongBreakDurationStored,
    this.roundPlanningByDefault = const Value.absent(),
  })  : windowOnTop = Value(windowOnTop),
        requestedNumberOfSessions = Value(requestedNumberOfSessions),
        selectedBreakDurationStored = Value(selectedBreakDurationStored),
        selectedFocusDurationStored = Value(selectedFocusDurationStored),
        selectedLongBreakDurationStored =
            Value(selectedLongBreakDurationStored);
  static Insertable<SettingsVariable> custom({
    Expression<int>? id,
    Expression<bool>? windowOnTop,
    Expression<int>? requestedNumberOfSessions,
    Expression<int>? selectedBreakDurationStored,
    Expression<int>? selectedFocusDurationStored,
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
      if (selectedFocusDurationStored != null)
        'selected_focus_duration_stored': selectedFocusDurationStored,
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
      Value<int>? selectedFocusDurationStored,
      Value<int>? selectedLongBreakDurationStored,
      Value<bool>? roundPlanningByDefault}) {
    return SettingsVariablesCompanion(
      id: id ?? this.id,
      windowOnTop: windowOnTop ?? this.windowOnTop,
      requestedNumberOfSessions:
          requestedNumberOfSessions ?? this.requestedNumberOfSessions,
      selectedBreakDurationStored:
          selectedBreakDurationStored ?? this.selectedBreakDurationStored,
      selectedFocusDurationStored:
          selectedFocusDurationStored ?? this.selectedFocusDurationStored,
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
    if (selectedFocusDurationStored.present) {
      map['selected_focus_duration_stored'] =
          Variable<int>(selectedFocusDurationStored.value);
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
          ..write('selectedFocusDurationStored: $selectedFocusDurationStored, ')
          ..write(
              'selectedLongBreakDurationStored: $selectedLongBreakDurationStored, ')
          ..write('roundPlanningByDefault: $roundPlanningByDefault')
          ..write(')'))
        .toString();
  }
}

class $MemoryCountdownVariableTable extends MemoryCountdownVariable
    with TableInfo<$MemoryCountdownVariableTable, MemoryCountdownVariableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemoryCountdownVariableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _propableCauseMeta =
      const VerificationMeta('propableCause');
  @override
  late final GeneratedColumn<String> propableCause = GeneratedColumn<String>(
      'propable_cause', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _durationLeftMeta =
      const VerificationMeta('durationLeft');
  @override
  late final GeneratedColumn<int> durationLeft = GeneratedColumn<int>(
      'duration_left', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _roundRunTimeMeta =
      const VerificationMeta('roundRunTime');
  @override
  late final GeneratedColumn<int> roundRunTime = GeneratedColumn<int>(
      'round_run_time', aliasedName, false,
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
      'starting_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
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
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
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
        propableCause,
        durationLeft,
        roundRunTime,
        plannedDuration,
        actuallyDoneDuration,
        expStartingTime,
        startingTime,
        expFinishTime,
        finishTime,
        completed,
        active,
        type,
        subject
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'memory_countdown_variable';
  @override
  VerificationContext validateIntegrity(
      Insertable<MemoryCountdownVariableData> instance,
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
    if (data.containsKey('propable_cause')) {
      context.handle(
          _propableCauseMeta,
          propableCause.isAcceptableOrUnknown(
              data['propable_cause']!, _propableCauseMeta));
    }
    if (data.containsKey('duration_left')) {
      context.handle(
          _durationLeftMeta,
          durationLeft.isAcceptableOrUnknown(
              data['duration_left']!, _durationLeftMeta));
    }
    if (data.containsKey('round_run_time')) {
      context.handle(
          _roundRunTimeMeta,
          roundRunTime.isAcceptableOrUnknown(
              data['round_run_time']!, _roundRunTimeMeta));
    } else if (isInserting) {
      context.missing(_roundRunTimeMeta);
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
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
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
  MemoryCountdownVariableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MemoryCountdownVariableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      roundGoal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}round_goal'])!,
      roundId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}round_id'])!,
      propableCause: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}propable_cause']),
      durationLeft: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_left']),
      roundRunTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}round_run_time'])!,
      plannedDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}planned_duration'])!,
      actuallyDoneDuration: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}actually_done_duration']),
      expStartingTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}exp_starting_time'])!,
      startingTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}starting_time']),
      expFinishTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}exp_finish_time']),
      finishTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish_time']),
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed']),
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subject']),
    );
  }

  @override
  $MemoryCountdownVariableTable createAlias(String alias) {
    return $MemoryCountdownVariableTable(attachedDatabase, alias);
  }
}

class MemoryCountdownVariableData extends DataClass
    implements Insertable<MemoryCountdownVariableData> {
  final int id;
  final int roundGoal;
  final int roundId;
  final String? propableCause;
  final int? durationLeft;
  final int roundRunTime;
  final int plannedDuration;
  final int? actuallyDoneDuration;
  final DateTime expStartingTime;
  final DateTime? startingTime;
  final DateTime? expFinishTime;
  final DateTime? finishTime;
  final bool? completed;
  final bool active;
  final String type;
  final int? subject;
  const MemoryCountdownVariableData(
      {required this.id,
      required this.roundGoal,
      required this.roundId,
      this.propableCause,
      this.durationLeft,
      required this.roundRunTime,
      required this.plannedDuration,
      this.actuallyDoneDuration,
      required this.expStartingTime,
      this.startingTime,
      this.expFinishTime,
      this.finishTime,
      this.completed,
      required this.active,
      required this.type,
      this.subject});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['round_goal'] = Variable<int>(roundGoal);
    map['round_id'] = Variable<int>(roundId);
    if (!nullToAbsent || propableCause != null) {
      map['propable_cause'] = Variable<String>(propableCause);
    }
    if (!nullToAbsent || durationLeft != null) {
      map['duration_left'] = Variable<int>(durationLeft);
    }
    map['round_run_time'] = Variable<int>(roundRunTime);
    map['planned_duration'] = Variable<int>(plannedDuration);
    if (!nullToAbsent || actuallyDoneDuration != null) {
      map['actually_done_duration'] = Variable<int>(actuallyDoneDuration);
    }
    map['exp_starting_time'] = Variable<DateTime>(expStartingTime);
    if (!nullToAbsent || startingTime != null) {
      map['starting_time'] = Variable<DateTime>(startingTime);
    }
    if (!nullToAbsent || expFinishTime != null) {
      map['exp_finish_time'] = Variable<DateTime>(expFinishTime);
    }
    if (!nullToAbsent || finishTime != null) {
      map['finish_time'] = Variable<DateTime>(finishTime);
    }
    if (!nullToAbsent || completed != null) {
      map['completed'] = Variable<bool>(completed);
    }
    map['active'] = Variable<bool>(active);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || subject != null) {
      map['subject'] = Variable<int>(subject);
    }
    return map;
  }

  MemoryCountdownVariableCompanion toCompanion(bool nullToAbsent) {
    return MemoryCountdownVariableCompanion(
      id: Value(id),
      roundGoal: Value(roundGoal),
      roundId: Value(roundId),
      propableCause: propableCause == null && nullToAbsent
          ? const Value.absent()
          : Value(propableCause),
      durationLeft: durationLeft == null && nullToAbsent
          ? const Value.absent()
          : Value(durationLeft),
      roundRunTime: Value(roundRunTime),
      plannedDuration: Value(plannedDuration),
      actuallyDoneDuration: actuallyDoneDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(actuallyDoneDuration),
      expStartingTime: Value(expStartingTime),
      startingTime: startingTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startingTime),
      expFinishTime: expFinishTime == null && nullToAbsent
          ? const Value.absent()
          : Value(expFinishTime),
      finishTime: finishTime == null && nullToAbsent
          ? const Value.absent()
          : Value(finishTime),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
      active: Value(active),
      type: Value(type),
      subject: subject == null && nullToAbsent
          ? const Value.absent()
          : Value(subject),
    );
  }

  factory MemoryCountdownVariableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemoryCountdownVariableData(
      id: serializer.fromJson<int>(json['id']),
      roundGoal: serializer.fromJson<int>(json['roundGoal']),
      roundId: serializer.fromJson<int>(json['roundId']),
      propableCause: serializer.fromJson<String?>(json['propableCause']),
      durationLeft: serializer.fromJson<int?>(json['durationLeft']),
      roundRunTime: serializer.fromJson<int>(json['roundRunTime']),
      plannedDuration: serializer.fromJson<int>(json['plannedDuration']),
      actuallyDoneDuration:
          serializer.fromJson<int?>(json['actuallyDoneDuration']),
      expStartingTime: serializer.fromJson<DateTime>(json['expStartingTime']),
      startingTime: serializer.fromJson<DateTime?>(json['startingTime']),
      expFinishTime: serializer.fromJson<DateTime?>(json['expFinishTime']),
      finishTime: serializer.fromJson<DateTime?>(json['finishTime']),
      completed: serializer.fromJson<bool?>(json['completed']),
      active: serializer.fromJson<bool>(json['active']),
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
      'propableCause': serializer.toJson<String?>(propableCause),
      'durationLeft': serializer.toJson<int?>(durationLeft),
      'roundRunTime': serializer.toJson<int>(roundRunTime),
      'plannedDuration': serializer.toJson<int>(plannedDuration),
      'actuallyDoneDuration': serializer.toJson<int?>(actuallyDoneDuration),
      'expStartingTime': serializer.toJson<DateTime>(expStartingTime),
      'startingTime': serializer.toJson<DateTime?>(startingTime),
      'expFinishTime': serializer.toJson<DateTime?>(expFinishTime),
      'finishTime': serializer.toJson<DateTime?>(finishTime),
      'completed': serializer.toJson<bool?>(completed),
      'active': serializer.toJson<bool>(active),
      'type': serializer.toJson<String>(type),
      'subject': serializer.toJson<int?>(subject),
    };
  }

  MemoryCountdownVariableData copyWith(
          {int? id,
          int? roundGoal,
          int? roundId,
          Value<String?> propableCause = const Value.absent(),
          Value<int?> durationLeft = const Value.absent(),
          int? roundRunTime,
          int? plannedDuration,
          Value<int?> actuallyDoneDuration = const Value.absent(),
          DateTime? expStartingTime,
          Value<DateTime?> startingTime = const Value.absent(),
          Value<DateTime?> expFinishTime = const Value.absent(),
          Value<DateTime?> finishTime = const Value.absent(),
          Value<bool?> completed = const Value.absent(),
          bool? active,
          String? type,
          Value<int?> subject = const Value.absent()}) =>
      MemoryCountdownVariableData(
        id: id ?? this.id,
        roundGoal: roundGoal ?? this.roundGoal,
        roundId: roundId ?? this.roundId,
        propableCause:
            propableCause.present ? propableCause.value : this.propableCause,
        durationLeft:
            durationLeft.present ? durationLeft.value : this.durationLeft,
        roundRunTime: roundRunTime ?? this.roundRunTime,
        plannedDuration: plannedDuration ?? this.plannedDuration,
        actuallyDoneDuration: actuallyDoneDuration.present
            ? actuallyDoneDuration.value
            : this.actuallyDoneDuration,
        expStartingTime: expStartingTime ?? this.expStartingTime,
        startingTime:
            startingTime.present ? startingTime.value : this.startingTime,
        expFinishTime:
            expFinishTime.present ? expFinishTime.value : this.expFinishTime,
        finishTime: finishTime.present ? finishTime.value : this.finishTime,
        completed: completed.present ? completed.value : this.completed,
        active: active ?? this.active,
        type: type ?? this.type,
        subject: subject.present ? subject.value : this.subject,
      );
  MemoryCountdownVariableData copyWithCompanion(
      MemoryCountdownVariableCompanion data) {
    return MemoryCountdownVariableData(
      id: data.id.present ? data.id.value : this.id,
      roundGoal: data.roundGoal.present ? data.roundGoal.value : this.roundGoal,
      roundId: data.roundId.present ? data.roundId.value : this.roundId,
      propableCause: data.propableCause.present
          ? data.propableCause.value
          : this.propableCause,
      durationLeft: data.durationLeft.present
          ? data.durationLeft.value
          : this.durationLeft,
      roundRunTime: data.roundRunTime.present
          ? data.roundRunTime.value
          : this.roundRunTime,
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
      active: data.active.present ? data.active.value : this.active,
      type: data.type.present ? data.type.value : this.type,
      subject: data.subject.present ? data.subject.value : this.subject,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MemoryCountdownVariableData(')
          ..write('id: $id, ')
          ..write('roundGoal: $roundGoal, ')
          ..write('roundId: $roundId, ')
          ..write('propableCause: $propableCause, ')
          ..write('durationLeft: $durationLeft, ')
          ..write('roundRunTime: $roundRunTime, ')
          ..write('plannedDuration: $plannedDuration, ')
          ..write('actuallyDoneDuration: $actuallyDoneDuration, ')
          ..write('expStartingTime: $expStartingTime, ')
          ..write('startingTime: $startingTime, ')
          ..write('expFinishTime: $expFinishTime, ')
          ..write('finishTime: $finishTime, ')
          ..write('completed: $completed, ')
          ..write('active: $active, ')
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
      propableCause,
      durationLeft,
      roundRunTime,
      plannedDuration,
      actuallyDoneDuration,
      expStartingTime,
      startingTime,
      expFinishTime,
      finishTime,
      completed,
      active,
      type,
      subject);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemoryCountdownVariableData &&
          other.id == this.id &&
          other.roundGoal == this.roundGoal &&
          other.roundId == this.roundId &&
          other.propableCause == this.propableCause &&
          other.durationLeft == this.durationLeft &&
          other.roundRunTime == this.roundRunTime &&
          other.plannedDuration == this.plannedDuration &&
          other.actuallyDoneDuration == this.actuallyDoneDuration &&
          other.expStartingTime == this.expStartingTime &&
          other.startingTime == this.startingTime &&
          other.expFinishTime == this.expFinishTime &&
          other.finishTime == this.finishTime &&
          other.completed == this.completed &&
          other.active == this.active &&
          other.type == this.type &&
          other.subject == this.subject);
}

class MemoryCountdownVariableCompanion
    extends UpdateCompanion<MemoryCountdownVariableData> {
  final Value<int> id;
  final Value<int> roundGoal;
  final Value<int> roundId;
  final Value<String?> propableCause;
  final Value<int?> durationLeft;
  final Value<int> roundRunTime;
  final Value<int> plannedDuration;
  final Value<int?> actuallyDoneDuration;
  final Value<DateTime> expStartingTime;
  final Value<DateTime?> startingTime;
  final Value<DateTime?> expFinishTime;
  final Value<DateTime?> finishTime;
  final Value<bool?> completed;
  final Value<bool> active;
  final Value<String> type;
  final Value<int?> subject;
  const MemoryCountdownVariableCompanion({
    this.id = const Value.absent(),
    this.roundGoal = const Value.absent(),
    this.roundId = const Value.absent(),
    this.propableCause = const Value.absent(),
    this.durationLeft = const Value.absent(),
    this.roundRunTime = const Value.absent(),
    this.plannedDuration = const Value.absent(),
    this.actuallyDoneDuration = const Value.absent(),
    this.expStartingTime = const Value.absent(),
    this.startingTime = const Value.absent(),
    this.expFinishTime = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.completed = const Value.absent(),
    this.active = const Value.absent(),
    this.type = const Value.absent(),
    this.subject = const Value.absent(),
  });
  MemoryCountdownVariableCompanion.insert({
    this.id = const Value.absent(),
    required int roundGoal,
    required int roundId,
    this.propableCause = const Value.absent(),
    this.durationLeft = const Value.absent(),
    required int roundRunTime,
    required int plannedDuration,
    this.actuallyDoneDuration = const Value.absent(),
    required DateTime expStartingTime,
    this.startingTime = const Value.absent(),
    this.expFinishTime = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.completed = const Value.absent(),
    this.active = const Value.absent(),
    required String type,
    this.subject = const Value.absent(),
  })  : roundGoal = Value(roundGoal),
        roundId = Value(roundId),
        roundRunTime = Value(roundRunTime),
        plannedDuration = Value(plannedDuration),
        expStartingTime = Value(expStartingTime),
        type = Value(type);
  static Insertable<MemoryCountdownVariableData> custom({
    Expression<int>? id,
    Expression<int>? roundGoal,
    Expression<int>? roundId,
    Expression<String>? propableCause,
    Expression<int>? durationLeft,
    Expression<int>? roundRunTime,
    Expression<int>? plannedDuration,
    Expression<int>? actuallyDoneDuration,
    Expression<DateTime>? expStartingTime,
    Expression<DateTime>? startingTime,
    Expression<DateTime>? expFinishTime,
    Expression<DateTime>? finishTime,
    Expression<bool>? completed,
    Expression<bool>? active,
    Expression<String>? type,
    Expression<int>? subject,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roundGoal != null) 'round_goal': roundGoal,
      if (roundId != null) 'round_id': roundId,
      if (propableCause != null) 'propable_cause': propableCause,
      if (durationLeft != null) 'duration_left': durationLeft,
      if (roundRunTime != null) 'round_run_time': roundRunTime,
      if (plannedDuration != null) 'planned_duration': plannedDuration,
      if (actuallyDoneDuration != null)
        'actually_done_duration': actuallyDoneDuration,
      if (expStartingTime != null) 'exp_starting_time': expStartingTime,
      if (startingTime != null) 'starting_time': startingTime,
      if (expFinishTime != null) 'exp_finish_time': expFinishTime,
      if (finishTime != null) 'finish_time': finishTime,
      if (completed != null) 'completed': completed,
      if (active != null) 'active': active,
      if (type != null) 'type': type,
      if (subject != null) 'subject': subject,
    });
  }

  MemoryCountdownVariableCompanion copyWith(
      {Value<int>? id,
      Value<int>? roundGoal,
      Value<int>? roundId,
      Value<String?>? propableCause,
      Value<int?>? durationLeft,
      Value<int>? roundRunTime,
      Value<int>? plannedDuration,
      Value<int?>? actuallyDoneDuration,
      Value<DateTime>? expStartingTime,
      Value<DateTime?>? startingTime,
      Value<DateTime?>? expFinishTime,
      Value<DateTime?>? finishTime,
      Value<bool?>? completed,
      Value<bool>? active,
      Value<String>? type,
      Value<int?>? subject}) {
    return MemoryCountdownVariableCompanion(
      id: id ?? this.id,
      roundGoal: roundGoal ?? this.roundGoal,
      roundId: roundId ?? this.roundId,
      propableCause: propableCause ?? this.propableCause,
      durationLeft: durationLeft ?? this.durationLeft,
      roundRunTime: roundRunTime ?? this.roundRunTime,
      plannedDuration: plannedDuration ?? this.plannedDuration,
      actuallyDoneDuration: actuallyDoneDuration ?? this.actuallyDoneDuration,
      expStartingTime: expStartingTime ?? this.expStartingTime,
      startingTime: startingTime ?? this.startingTime,
      expFinishTime: expFinishTime ?? this.expFinishTime,
      finishTime: finishTime ?? this.finishTime,
      completed: completed ?? this.completed,
      active: active ?? this.active,
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
    if (propableCause.present) {
      map['propable_cause'] = Variable<String>(propableCause.value);
    }
    if (durationLeft.present) {
      map['duration_left'] = Variable<int>(durationLeft.value);
    }
    if (roundRunTime.present) {
      map['round_run_time'] = Variable<int>(roundRunTime.value);
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
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
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
    return (StringBuffer('MemoryCountdownVariableCompanion(')
          ..write('id: $id, ')
          ..write('roundGoal: $roundGoal, ')
          ..write('roundId: $roundId, ')
          ..write('propableCause: $propableCause, ')
          ..write('durationLeft: $durationLeft, ')
          ..write('roundRunTime: $roundRunTime, ')
          ..write('plannedDuration: $plannedDuration, ')
          ..write('actuallyDoneDuration: $actuallyDoneDuration, ')
          ..write('expStartingTime: $expStartingTime, ')
          ..write('startingTime: $startingTime, ')
          ..write('expFinishTime: $expFinishTime, ')
          ..write('finishTime: $finishTime, ')
          ..write('completed: $completed, ')
          ..write('active: $active, ')
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
      'completed', aliasedName, false,
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        completed,
        propableCause,
        plannedDuration,
        actuallyDoneDuration,
        startingTime,
        expFinishTime,
        finishTime
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
          .read(DriftSqlType.bool, data['${effectivePrefix}completed'])!,
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
  final bool completed;
  final String? propableCause;
  final int plannedDuration;
  final int? actuallyDoneDuration;
  final DateTime startingTime;
  final DateTime? expFinishTime;
  final DateTime? finishTime;
  const RoundVariableData(
      {required this.id,
      required this.completed,
      this.propableCause,
      required this.plannedDuration,
      this.actuallyDoneDuration,
      required this.startingTime,
      this.expFinishTime,
      this.finishTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['completed'] = Variable<bool>(completed);
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
    return map;
  }

  RoundVariableCompanion toCompanion(bool nullToAbsent) {
    return RoundVariableCompanion(
      id: Value(id),
      completed: Value(completed),
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
    );
  }

  factory RoundVariableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoundVariableData(
      id: serializer.fromJson<int>(json['id']),
      completed: serializer.fromJson<bool>(json['completed']),
      propableCause: serializer.fromJson<String?>(json['propableCause']),
      plannedDuration: serializer.fromJson<int>(json['plannedDuration']),
      actuallyDoneDuration:
          serializer.fromJson<int?>(json['actuallyDoneDuration']),
      startingTime: serializer.fromJson<DateTime>(json['startingTime']),
      expFinishTime: serializer.fromJson<DateTime?>(json['expFinishTime']),
      finishTime: serializer.fromJson<DateTime?>(json['finishTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'completed': serializer.toJson<bool>(completed),
      'propableCause': serializer.toJson<String?>(propableCause),
      'plannedDuration': serializer.toJson<int>(plannedDuration),
      'actuallyDoneDuration': serializer.toJson<int?>(actuallyDoneDuration),
      'startingTime': serializer.toJson<DateTime>(startingTime),
      'expFinishTime': serializer.toJson<DateTime?>(expFinishTime),
      'finishTime': serializer.toJson<DateTime?>(finishTime),
    };
  }

  RoundVariableData copyWith(
          {int? id,
          bool? completed,
          Value<String?> propableCause = const Value.absent(),
          int? plannedDuration,
          Value<int?> actuallyDoneDuration = const Value.absent(),
          DateTime? startingTime,
          Value<DateTime?> expFinishTime = const Value.absent(),
          Value<DateTime?> finishTime = const Value.absent()}) =>
      RoundVariableData(
        id: id ?? this.id,
        completed: completed ?? this.completed,
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
          ..write('finishTime: $finishTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, completed, propableCause, plannedDuration,
      actuallyDoneDuration, startingTime, expFinishTime, finishTime);
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
          other.finishTime == this.finishTime);
}

class RoundVariableCompanion extends UpdateCompanion<RoundVariableData> {
  final Value<int> id;
  final Value<bool> completed;
  final Value<String?> propableCause;
  final Value<int> plannedDuration;
  final Value<int?> actuallyDoneDuration;
  final Value<DateTime> startingTime;
  final Value<DateTime?> expFinishTime;
  final Value<DateTime?> finishTime;
  const RoundVariableCompanion({
    this.id = const Value.absent(),
    this.completed = const Value.absent(),
    this.propableCause = const Value.absent(),
    this.plannedDuration = const Value.absent(),
    this.actuallyDoneDuration = const Value.absent(),
    this.startingTime = const Value.absent(),
    this.expFinishTime = const Value.absent(),
    this.finishTime = const Value.absent(),
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
    });
  }

  RoundVariableCompanion copyWith(
      {Value<int>? id,
      Value<bool>? completed,
      Value<String?>? propableCause,
      Value<int>? plannedDuration,
      Value<int?>? actuallyDoneDuration,
      Value<DateTime>? startingTime,
      Value<DateTime?>? expFinishTime,
      Value<DateTime?>? finishTime}) {
    return RoundVariableCompanion(
      id: id ?? this.id,
      completed: completed ?? this.completed,
      propableCause: propableCause ?? this.propableCause,
      plannedDuration: plannedDuration ?? this.plannedDuration,
      actuallyDoneDuration: actuallyDoneDuration ?? this.actuallyDoneDuration,
      startingTime: startingTime ?? this.startingTime,
      expFinishTime: expFinishTime ?? this.expFinishTime,
      finishTime: finishTime ?? this.finishTime,
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
          ..write('finishTime: $finishTime')
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
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _superSubjectIDMeta =
      const VerificationMeta('superSubjectID');
  @override
  late final GeneratedColumn<int> superSubjectID = GeneratedColumn<int>(
      'super_subject_i_d', aliasedName, true,
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
  static const VerificationMeta _subSubjectsMeta =
      const VerificationMeta('subSubjects');
  @override
  late final GeneratedColumn<int> subSubjects = GeneratedColumn<int>(
      'sub_subjects', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastFocuzdOnSessionIDMeta =
      const VerificationMeta('lastFocuzdOnSessionID');
  @override
  late final GeneratedColumn<int> lastFocuzdOnSessionID = GeneratedColumn<int>(
      'last_focuzd_on_session_i_d', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES memory_countdown_variable (id)'));
  static const VerificationMeta _totalTimeSpentMeta =
      const VerificationMeta('totalTimeSpent');
  @override
  late final GeneratedColumn<int> totalTimeSpent = GeneratedColumn<int>(
      'total_time_spent', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        address,
        superSubjectID,
        createdAt,
        updatedAt,
        subSubjects,
        lastFocuzdOnSessionID,
        totalTimeSpent
      ];
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
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('super_subject_i_d')) {
      context.handle(
          _superSubjectIDMeta,
          superSubjectID.isAcceptableOrUnknown(
              data['super_subject_i_d']!, _superSubjectIDMeta));
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
    if (data.containsKey('sub_subjects')) {
      context.handle(
          _subSubjectsMeta,
          subSubjects.isAcceptableOrUnknown(
              data['sub_subjects']!, _subSubjectsMeta));
    }
    if (data.containsKey('last_focuzd_on_session_i_d')) {
      context.handle(
          _lastFocuzdOnSessionIDMeta,
          lastFocuzdOnSessionID.isAcceptableOrUnknown(
              data['last_focuzd_on_session_i_d']!, _lastFocuzdOnSessionIDMeta));
    }
    if (data.containsKey('total_time_spent')) {
      context.handle(
          _totalTimeSpentMeta,
          totalTimeSpent.isAcceptableOrUnknown(
              data['total_time_spent']!, _totalTimeSpentMeta));
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
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      superSubjectID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}super_subject_i_d']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      subSubjects: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sub_subjects'])!,
      lastFocuzdOnSessionID: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}last_focuzd_on_session_i_d']),
      totalTimeSpent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_time_spent'])!,
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
  final String address;
  final int? superSubjectID;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int subSubjects;
  final int? lastFocuzdOnSessionID;
  final int totalTimeSpent;
  const SubjectData(
      {required this.id,
      required this.name,
      required this.address,
      this.superSubjectID,
      required this.createdAt,
      required this.updatedAt,
      required this.subSubjects,
      this.lastFocuzdOnSessionID,
      required this.totalTimeSpent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    if (!nullToAbsent || superSubjectID != null) {
      map['super_subject_i_d'] = Variable<int>(superSubjectID);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sub_subjects'] = Variable<int>(subSubjects);
    if (!nullToAbsent || lastFocuzdOnSessionID != null) {
      map['last_focuzd_on_session_i_d'] = Variable<int>(lastFocuzdOnSessionID);
    }
    map['total_time_spent'] = Variable<int>(totalTimeSpent);
    return map;
  }

  SubjectCompanion toCompanion(bool nullToAbsent) {
    return SubjectCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
      superSubjectID: superSubjectID == null && nullToAbsent
          ? const Value.absent()
          : Value(superSubjectID),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      subSubjects: Value(subSubjects),
      lastFocuzdOnSessionID: lastFocuzdOnSessionID == null && nullToAbsent
          ? const Value.absent()
          : Value(lastFocuzdOnSessionID),
      totalTimeSpent: Value(totalTimeSpent),
    );
  }

  factory SubjectData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubjectData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      superSubjectID: serializer.fromJson<int?>(json['superSubjectID']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      subSubjects: serializer.fromJson<int>(json['subSubjects']),
      lastFocuzdOnSessionID:
          serializer.fromJson<int?>(json['lastFocuzdOnSessionID']),
      totalTimeSpent: serializer.fromJson<int>(json['totalTimeSpent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'superSubjectID': serializer.toJson<int?>(superSubjectID),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'subSubjects': serializer.toJson<int>(subSubjects),
      'lastFocuzdOnSessionID': serializer.toJson<int?>(lastFocuzdOnSessionID),
      'totalTimeSpent': serializer.toJson<int>(totalTimeSpent),
    };
  }

  SubjectData copyWith(
          {int? id,
          String? name,
          String? address,
          Value<int?> superSubjectID = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          int? subSubjects,
          Value<int?> lastFocuzdOnSessionID = const Value.absent(),
          int? totalTimeSpent}) =>
      SubjectData(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        superSubjectID:
            superSubjectID.present ? superSubjectID.value : this.superSubjectID,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        subSubjects: subSubjects ?? this.subSubjects,
        lastFocuzdOnSessionID: lastFocuzdOnSessionID.present
            ? lastFocuzdOnSessionID.value
            : this.lastFocuzdOnSessionID,
        totalTimeSpent: totalTimeSpent ?? this.totalTimeSpent,
      );
  SubjectData copyWithCompanion(SubjectCompanion data) {
    return SubjectData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      superSubjectID: data.superSubjectID.present
          ? data.superSubjectID.value
          : this.superSubjectID,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      subSubjects:
          data.subSubjects.present ? data.subSubjects.value : this.subSubjects,
      lastFocuzdOnSessionID: data.lastFocuzdOnSessionID.present
          ? data.lastFocuzdOnSessionID.value
          : this.lastFocuzdOnSessionID,
      totalTimeSpent: data.totalTimeSpent.present
          ? data.totalTimeSpent.value
          : this.totalTimeSpent,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubjectData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('superSubjectID: $superSubjectID, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('subSubjects: $subSubjects, ')
          ..write('lastFocuzdOnSessionID: $lastFocuzdOnSessionID, ')
          ..write('totalTimeSpent: $totalTimeSpent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, address, superSubjectID, createdAt,
      updatedAt, subSubjects, lastFocuzdOnSessionID, totalTimeSpent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubjectData &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.superSubjectID == this.superSubjectID &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.subSubjects == this.subSubjects &&
          other.lastFocuzdOnSessionID == this.lastFocuzdOnSessionID &&
          other.totalTimeSpent == this.totalTimeSpent);
}

class SubjectCompanion extends UpdateCompanion<SubjectData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> address;
  final Value<int?> superSubjectID;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> subSubjects;
  final Value<int?> lastFocuzdOnSessionID;
  final Value<int> totalTimeSpent;
  const SubjectCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.superSubjectID = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.subSubjects = const Value.absent(),
    this.lastFocuzdOnSessionID = const Value.absent(),
    this.totalTimeSpent = const Value.absent(),
  });
  SubjectCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String address,
    this.superSubjectID = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.subSubjects = const Value.absent(),
    this.lastFocuzdOnSessionID = const Value.absent(),
    this.totalTimeSpent = const Value.absent(),
  })  : name = Value(name),
        address = Value(address),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<SubjectData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<int>? superSubjectID,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? subSubjects,
    Expression<int>? lastFocuzdOnSessionID,
    Expression<int>? totalTimeSpent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (superSubjectID != null) 'super_subject_i_d': superSubjectID,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (subSubjects != null) 'sub_subjects': subSubjects,
      if (lastFocuzdOnSessionID != null)
        'last_focuzd_on_session_i_d': lastFocuzdOnSessionID,
      if (totalTimeSpent != null) 'total_time_spent': totalTimeSpent,
    });
  }

  SubjectCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? address,
      Value<int?>? superSubjectID,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? subSubjects,
      Value<int?>? lastFocuzdOnSessionID,
      Value<int>? totalTimeSpent}) {
    return SubjectCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      superSubjectID: superSubjectID ?? this.superSubjectID,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      subSubjects: subSubjects ?? this.subSubjects,
      lastFocuzdOnSessionID:
          lastFocuzdOnSessionID ?? this.lastFocuzdOnSessionID,
      totalTimeSpent: totalTimeSpent ?? this.totalTimeSpent,
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
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (superSubjectID.present) {
      map['super_subject_i_d'] = Variable<int>(superSubjectID.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (subSubjects.present) {
      map['sub_subjects'] = Variable<int>(subSubjects.value);
    }
    if (lastFocuzdOnSessionID.present) {
      map['last_focuzd_on_session_i_d'] =
          Variable<int>(lastFocuzdOnSessionID.value);
    }
    if (totalTimeSpent.present) {
      map['total_time_spent'] = Variable<int>(totalTimeSpent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('superSubjectID: $superSubjectID, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('subSubjects: $subSubjects, ')
          ..write('lastFocuzdOnSessionID: $lastFocuzdOnSessionID, ')
          ..write('totalTimeSpent: $totalTimeSpent')
          ..write(')'))
        .toString();
  }
}

class $OutPlanningVariableTable extends OutPlanningVariable
    with TableInfo<$OutPlanningVariableTable, OutPlanningVariableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutPlanningVariableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _memoryCountdownIDMeta =
      const VerificationMeta('memoryCountdownID');
  @override
  late final GeneratedColumn<int> memoryCountdownID = GeneratedColumn<int>(
      'memory_countdown_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startingTimeMeta =
      const VerificationMeta('startingTime');
  @override
  late final GeneratedColumn<DateTime> startingTime = GeneratedColumn<DateTime>(
      'starting_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _finishTimeMeta =
      const VerificationMeta('finishTime');
  @override
  late final GeneratedColumn<DateTime> finishTime = GeneratedColumn<DateTime>(
      'finish_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        memoryCountdownID,
        startingTime,
        finishTime,
        duration,
        type,
        isActive
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'out_planning_variable';
  @override
  VerificationContext validateIntegrity(
      Insertable<OutPlanningVariableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('memory_countdown_i_d')) {
      context.handle(
          _memoryCountdownIDMeta,
          memoryCountdownID.isAcceptableOrUnknown(
              data['memory_countdown_i_d']!, _memoryCountdownIDMeta));
    } else if (isInserting) {
      context.missing(_memoryCountdownIDMeta);
    }
    if (data.containsKey('starting_time')) {
      context.handle(
          _startingTimeMeta,
          startingTime.isAcceptableOrUnknown(
              data['starting_time']!, _startingTimeMeta));
    }
    if (data.containsKey('finish_time')) {
      context.handle(
          _finishTimeMeta,
          finishTime.isAcceptableOrUnknown(
              data['finish_time']!, _finishTimeMeta));
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OutPlanningVariableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutPlanningVariableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      memoryCountdownID: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}memory_countdown_i_d'])!,
      startingTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}starting_time']),
      finishTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish_time']),
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $OutPlanningVariableTable createAlias(String alias) {
    return $OutPlanningVariableTable(attachedDatabase, alias);
  }
}

class OutPlanningVariableData extends DataClass
    implements Insertable<OutPlanningVariableData> {
  final int id;
  final int memoryCountdownID;
  final DateTime? startingTime;
  final DateTime? finishTime;
  final int? duration;
  final String? type;
  final bool isActive;
  const OutPlanningVariableData(
      {required this.id,
      required this.memoryCountdownID,
      this.startingTime,
      this.finishTime,
      this.duration,
      this.type,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['memory_countdown_i_d'] = Variable<int>(memoryCountdownID);
    if (!nullToAbsent || startingTime != null) {
      map['starting_time'] = Variable<DateTime>(startingTime);
    }
    if (!nullToAbsent || finishTime != null) {
      map['finish_time'] = Variable<DateTime>(finishTime);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  OutPlanningVariableCompanion toCompanion(bool nullToAbsent) {
    return OutPlanningVariableCompanion(
      id: Value(id),
      memoryCountdownID: Value(memoryCountdownID),
      startingTime: startingTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startingTime),
      finishTime: finishTime == null && nullToAbsent
          ? const Value.absent()
          : Value(finishTime),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      isActive: Value(isActive),
    );
  }

  factory OutPlanningVariableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OutPlanningVariableData(
      id: serializer.fromJson<int>(json['id']),
      memoryCountdownID: serializer.fromJson<int>(json['memoryCountdownID']),
      startingTime: serializer.fromJson<DateTime?>(json['startingTime']),
      finishTime: serializer.fromJson<DateTime?>(json['finishTime']),
      duration: serializer.fromJson<int?>(json['duration']),
      type: serializer.fromJson<String?>(json['type']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'memoryCountdownID': serializer.toJson<int>(memoryCountdownID),
      'startingTime': serializer.toJson<DateTime?>(startingTime),
      'finishTime': serializer.toJson<DateTime?>(finishTime),
      'duration': serializer.toJson<int?>(duration),
      'type': serializer.toJson<String?>(type),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  OutPlanningVariableData copyWith(
          {int? id,
          int? memoryCountdownID,
          Value<DateTime?> startingTime = const Value.absent(),
          Value<DateTime?> finishTime = const Value.absent(),
          Value<int?> duration = const Value.absent(),
          Value<String?> type = const Value.absent(),
          bool? isActive}) =>
      OutPlanningVariableData(
        id: id ?? this.id,
        memoryCountdownID: memoryCountdownID ?? this.memoryCountdownID,
        startingTime:
            startingTime.present ? startingTime.value : this.startingTime,
        finishTime: finishTime.present ? finishTime.value : this.finishTime,
        duration: duration.present ? duration.value : this.duration,
        type: type.present ? type.value : this.type,
        isActive: isActive ?? this.isActive,
      );
  OutPlanningVariableData copyWithCompanion(OutPlanningVariableCompanion data) {
    return OutPlanningVariableData(
      id: data.id.present ? data.id.value : this.id,
      memoryCountdownID: data.memoryCountdownID.present
          ? data.memoryCountdownID.value
          : this.memoryCountdownID,
      startingTime: data.startingTime.present
          ? data.startingTime.value
          : this.startingTime,
      finishTime:
          data.finishTime.present ? data.finishTime.value : this.finishTime,
      duration: data.duration.present ? data.duration.value : this.duration,
      type: data.type.present ? data.type.value : this.type,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OutPlanningVariableData(')
          ..write('id: $id, ')
          ..write('memoryCountdownID: $memoryCountdownID, ')
          ..write('startingTime: $startingTime, ')
          ..write('finishTime: $finishTime, ')
          ..write('duration: $duration, ')
          ..write('type: $type, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, memoryCountdownID, startingTime,
      finishTime, duration, type, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutPlanningVariableData &&
          other.id == this.id &&
          other.memoryCountdownID == this.memoryCountdownID &&
          other.startingTime == this.startingTime &&
          other.finishTime == this.finishTime &&
          other.duration == this.duration &&
          other.type == this.type &&
          other.isActive == this.isActive);
}

class OutPlanningVariableCompanion
    extends UpdateCompanion<OutPlanningVariableData> {
  final Value<int> id;
  final Value<int> memoryCountdownID;
  final Value<DateTime?> startingTime;
  final Value<DateTime?> finishTime;
  final Value<int?> duration;
  final Value<String?> type;
  final Value<bool> isActive;
  const OutPlanningVariableCompanion({
    this.id = const Value.absent(),
    this.memoryCountdownID = const Value.absent(),
    this.startingTime = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.duration = const Value.absent(),
    this.type = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  OutPlanningVariableCompanion.insert({
    this.id = const Value.absent(),
    required int memoryCountdownID,
    this.startingTime = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.duration = const Value.absent(),
    this.type = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : memoryCountdownID = Value(memoryCountdownID);
  static Insertable<OutPlanningVariableData> custom({
    Expression<int>? id,
    Expression<int>? memoryCountdownID,
    Expression<DateTime>? startingTime,
    Expression<DateTime>? finishTime,
    Expression<int>? duration,
    Expression<String>? type,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memoryCountdownID != null) 'memory_countdown_i_d': memoryCountdownID,
      if (startingTime != null) 'starting_time': startingTime,
      if (finishTime != null) 'finish_time': finishTime,
      if (duration != null) 'duration': duration,
      if (type != null) 'type': type,
      if (isActive != null) 'is_active': isActive,
    });
  }

  OutPlanningVariableCompanion copyWith(
      {Value<int>? id,
      Value<int>? memoryCountdownID,
      Value<DateTime?>? startingTime,
      Value<DateTime?>? finishTime,
      Value<int?>? duration,
      Value<String?>? type,
      Value<bool>? isActive}) {
    return OutPlanningVariableCompanion(
      id: id ?? this.id,
      memoryCountdownID: memoryCountdownID ?? this.memoryCountdownID,
      startingTime: startingTime ?? this.startingTime,
      finishTime: finishTime ?? this.finishTime,
      duration: duration ?? this.duration,
      type: type ?? this.type,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (memoryCountdownID.present) {
      map['memory_countdown_i_d'] = Variable<int>(memoryCountdownID.value);
    }
    if (startingTime.present) {
      map['starting_time'] = Variable<DateTime>(startingTime.value);
    }
    if (finishTime.present) {
      map['finish_time'] = Variable<DateTime>(finishTime.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutPlanningVariableCompanion(')
          ..write('id: $id, ')
          ..write('memoryCountdownID: $memoryCountdownID, ')
          ..write('startingTime: $startingTime, ')
          ..write('finishTime: $finishTime, ')
          ..write('duration: $duration, ')
          ..write('type: $type, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $GoalTable extends Goal with TableInfo<$GoalTable, GoalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _codeNameMeta =
      const VerificationMeta('codeName');
  @override
  late final GeneratedColumn<String> codeName = GeneratedColumn<String>(
      'code_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  static const VerificationMeta _startPeriod1Meta =
      const VerificationMeta('startPeriod1');
  @override
  late final GeneratedColumn<DateTime> startPeriod1 = GeneratedColumn<DateTime>(
      'start_period1', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endPeriod1Meta =
      const VerificationMeta('endPeriod1');
  @override
  late final GeneratedColumn<DateTime> endPeriod1 = GeneratedColumn<DateTime>(
      'end_period1', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startPeriod2Meta =
      const VerificationMeta('startPeriod2');
  @override
  late final GeneratedColumn<DateTime> startPeriod2 = GeneratedColumn<DateTime>(
      'start_period2', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endPeriod2Meta =
      const VerificationMeta('endPeriod2');
  @override
  late final GeneratedColumn<DateTime> endPeriod2 = GeneratedColumn<DateTime>(
      'end_period2', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _xSessionsGoalMeta =
      const VerificationMeta('xSessionsGoal');
  @override
  late final GeneratedColumn<int> xSessionsGoal = GeneratedColumn<int>(
      'x_sessions_goal', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _ySessionsDoneMeta =
      const VerificationMeta('ySessionsDone');
  @override
  late final GeneratedColumn<int> ySessionsDone = GeneratedColumn<int>(
      'y_sessions_done', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _plannedRatioMeta =
      const VerificationMeta('plannedRatio');
  @override
  late final GeneratedColumn<double> plannedRatio = GeneratedColumn<double>(
      'planned_ratio', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _realRatioMeta =
      const VerificationMeta('realRatio');
  @override
  late final GeneratedColumn<double> realRatio = GeneratedColumn<double>(
      'real_ratio', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _xSessionsRMeta =
      const VerificationMeta('xSessionsR');
  @override
  late final GeneratedColumn<int> xSessionsR = GeneratedColumn<int>(
      'x_sessions_r', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _subjectIdZMeta =
      const VerificationMeta('subjectIdZ');
  @override
  late final GeneratedColumn<int> subjectIdZ = GeneratedColumn<int>(
      'subject_id_z', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _xSessionsZMeta =
      const VerificationMeta('xSessionsZ');
  @override
  late final GeneratedColumn<int> xSessionsZ = GeneratedColumn<int>(
      'x_sessions_z', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _subjectIdFMeta =
      const VerificationMeta('subjectIdF');
  @override
  late final GeneratedColumn<int> subjectIdF = GeneratedColumn<int>(
      'subject_id_f', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _xSessionsFMeta =
      const VerificationMeta('xSessionsF');
  @override
  late final GeneratedColumn<int> xSessionsF = GeneratedColumn<int>(
      'x_sessions_f', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _successPercentageMeta =
      const VerificationMeta('successPercentage');
  @override
  late final GeneratedColumn<double> successPercentage =
      GeneratedColumn<double>('success_percentage', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(00));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        codeName,
        type,
        createdAt,
        updatedAt,
        startPeriod1,
        endPeriod1,
        startPeriod2,
        endPeriod2,
        xSessionsGoal,
        ySessionsDone,
        plannedRatio,
        realRatio,
        xSessionsR,
        subjectIdZ,
        xSessionsZ,
        subjectIdF,
        xSessionsF,
        successPercentage
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goal';
  @override
  VerificationContext validateIntegrity(Insertable<GoalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code_name')) {
      context.handle(_codeNameMeta,
          codeName.isAcceptableOrUnknown(data['code_name']!, _codeNameMeta));
    } else if (isInserting) {
      context.missing(_codeNameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
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
    if (data.containsKey('start_period1')) {
      context.handle(
          _startPeriod1Meta,
          startPeriod1.isAcceptableOrUnknown(
              data['start_period1']!, _startPeriod1Meta));
    }
    if (data.containsKey('end_period1')) {
      context.handle(
          _endPeriod1Meta,
          endPeriod1.isAcceptableOrUnknown(
              data['end_period1']!, _endPeriod1Meta));
    }
    if (data.containsKey('start_period2')) {
      context.handle(
          _startPeriod2Meta,
          startPeriod2.isAcceptableOrUnknown(
              data['start_period2']!, _startPeriod2Meta));
    } else if (isInserting) {
      context.missing(_startPeriod2Meta);
    }
    if (data.containsKey('end_period2')) {
      context.handle(
          _endPeriod2Meta,
          endPeriod2.isAcceptableOrUnknown(
              data['end_period2']!, _endPeriod2Meta));
    } else if (isInserting) {
      context.missing(_endPeriod2Meta);
    }
    if (data.containsKey('x_sessions_goal')) {
      context.handle(
          _xSessionsGoalMeta,
          xSessionsGoal.isAcceptableOrUnknown(
              data['x_sessions_goal']!, _xSessionsGoalMeta));
    }
    if (data.containsKey('y_sessions_done')) {
      context.handle(
          _ySessionsDoneMeta,
          ySessionsDone.isAcceptableOrUnknown(
              data['y_sessions_done']!, _ySessionsDoneMeta));
    }
    if (data.containsKey('planned_ratio')) {
      context.handle(
          _plannedRatioMeta,
          plannedRatio.isAcceptableOrUnknown(
              data['planned_ratio']!, _plannedRatioMeta));
    }
    if (data.containsKey('real_ratio')) {
      context.handle(_realRatioMeta,
          realRatio.isAcceptableOrUnknown(data['real_ratio']!, _realRatioMeta));
    }
    if (data.containsKey('x_sessions_r')) {
      context.handle(
          _xSessionsRMeta,
          xSessionsR.isAcceptableOrUnknown(
              data['x_sessions_r']!, _xSessionsRMeta));
    }
    if (data.containsKey('subject_id_z')) {
      context.handle(
          _subjectIdZMeta,
          subjectIdZ.isAcceptableOrUnknown(
              data['subject_id_z']!, _subjectIdZMeta));
    }
    if (data.containsKey('x_sessions_z')) {
      context.handle(
          _xSessionsZMeta,
          xSessionsZ.isAcceptableOrUnknown(
              data['x_sessions_z']!, _xSessionsZMeta));
    }
    if (data.containsKey('subject_id_f')) {
      context.handle(
          _subjectIdFMeta,
          subjectIdF.isAcceptableOrUnknown(
              data['subject_id_f']!, _subjectIdFMeta));
    }
    if (data.containsKey('x_sessions_f')) {
      context.handle(
          _xSessionsFMeta,
          xSessionsF.isAcceptableOrUnknown(
              data['x_sessions_f']!, _xSessionsFMeta));
    }
    if (data.containsKey('success_percentage')) {
      context.handle(
          _successPercentageMeta,
          successPercentage.isAcceptableOrUnknown(
              data['success_percentage']!, _successPercentageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      codeName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code_name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      startPeriod1: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_period1']),
      endPeriod1: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_period1']),
      startPeriod2: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}start_period2'])!,
      endPeriod2: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_period2'])!,
      xSessionsGoal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}x_sessions_goal']),
      ySessionsDone: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}y_sessions_done']),
      plannedRatio: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}planned_ratio']),
      realRatio: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}real_ratio']),
      xSessionsR: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}x_sessions_r']),
      subjectIdZ: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subject_id_z']),
      xSessionsZ: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}x_sessions_z']),
      subjectIdF: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subject_id_f']),
      xSessionsF: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}x_sessions_f']),
      successPercentage: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}success_percentage'])!,
    );
  }

  @override
  $GoalTable createAlias(String alias) {
    return $GoalTable(attachedDatabase, alias);
  }
}

class GoalData extends DataClass implements Insertable<GoalData> {
  final int id;
  final String codeName;
  final int type;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? startPeriod1;
  final DateTime? endPeriod1;
  final DateTime startPeriod2;
  final DateTime endPeriod2;
  final int? xSessionsGoal;
  final int? ySessionsDone;
  final double? plannedRatio;
  final double? realRatio;
  final int? xSessionsR;
  final int? subjectIdZ;
  final int? xSessionsZ;
  final int? subjectIdF;
  final int? xSessionsF;
  final double successPercentage;
  const GoalData(
      {required this.id,
      required this.codeName,
      required this.type,
      required this.createdAt,
      required this.updatedAt,
      this.startPeriod1,
      this.endPeriod1,
      required this.startPeriod2,
      required this.endPeriod2,
      this.xSessionsGoal,
      this.ySessionsDone,
      this.plannedRatio,
      this.realRatio,
      this.xSessionsR,
      this.subjectIdZ,
      this.xSessionsZ,
      this.subjectIdF,
      this.xSessionsF,
      required this.successPercentage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code_name'] = Variable<String>(codeName);
    map['type'] = Variable<int>(type);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || startPeriod1 != null) {
      map['start_period1'] = Variable<DateTime>(startPeriod1);
    }
    if (!nullToAbsent || endPeriod1 != null) {
      map['end_period1'] = Variable<DateTime>(endPeriod1);
    }
    map['start_period2'] = Variable<DateTime>(startPeriod2);
    map['end_period2'] = Variable<DateTime>(endPeriod2);
    if (!nullToAbsent || xSessionsGoal != null) {
      map['x_sessions_goal'] = Variable<int>(xSessionsGoal);
    }
    if (!nullToAbsent || ySessionsDone != null) {
      map['y_sessions_done'] = Variable<int>(ySessionsDone);
    }
    if (!nullToAbsent || plannedRatio != null) {
      map['planned_ratio'] = Variable<double>(plannedRatio);
    }
    if (!nullToAbsent || realRatio != null) {
      map['real_ratio'] = Variable<double>(realRatio);
    }
    if (!nullToAbsent || xSessionsR != null) {
      map['x_sessions_r'] = Variable<int>(xSessionsR);
    }
    if (!nullToAbsent || subjectIdZ != null) {
      map['subject_id_z'] = Variable<int>(subjectIdZ);
    }
    if (!nullToAbsent || xSessionsZ != null) {
      map['x_sessions_z'] = Variable<int>(xSessionsZ);
    }
    if (!nullToAbsent || subjectIdF != null) {
      map['subject_id_f'] = Variable<int>(subjectIdF);
    }
    if (!nullToAbsent || xSessionsF != null) {
      map['x_sessions_f'] = Variable<int>(xSessionsF);
    }
    map['success_percentage'] = Variable<double>(successPercentage);
    return map;
  }

  GoalCompanion toCompanion(bool nullToAbsent) {
    return GoalCompanion(
      id: Value(id),
      codeName: Value(codeName),
      type: Value(type),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      startPeriod1: startPeriod1 == null && nullToAbsent
          ? const Value.absent()
          : Value(startPeriod1),
      endPeriod1: endPeriod1 == null && nullToAbsent
          ? const Value.absent()
          : Value(endPeriod1),
      startPeriod2: Value(startPeriod2),
      endPeriod2: Value(endPeriod2),
      xSessionsGoal: xSessionsGoal == null && nullToAbsent
          ? const Value.absent()
          : Value(xSessionsGoal),
      ySessionsDone: ySessionsDone == null && nullToAbsent
          ? const Value.absent()
          : Value(ySessionsDone),
      plannedRatio: plannedRatio == null && nullToAbsent
          ? const Value.absent()
          : Value(plannedRatio),
      realRatio: realRatio == null && nullToAbsent
          ? const Value.absent()
          : Value(realRatio),
      xSessionsR: xSessionsR == null && nullToAbsent
          ? const Value.absent()
          : Value(xSessionsR),
      subjectIdZ: subjectIdZ == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectIdZ),
      xSessionsZ: xSessionsZ == null && nullToAbsent
          ? const Value.absent()
          : Value(xSessionsZ),
      subjectIdF: subjectIdF == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectIdF),
      xSessionsF: xSessionsF == null && nullToAbsent
          ? const Value.absent()
          : Value(xSessionsF),
      successPercentage: Value(successPercentage),
    );
  }

  factory GoalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalData(
      id: serializer.fromJson<int>(json['id']),
      codeName: serializer.fromJson<String>(json['codeName']),
      type: serializer.fromJson<int>(json['type']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      startPeriod1: serializer.fromJson<DateTime?>(json['startPeriod1']),
      endPeriod1: serializer.fromJson<DateTime?>(json['endPeriod1']),
      startPeriod2: serializer.fromJson<DateTime>(json['startPeriod2']),
      endPeriod2: serializer.fromJson<DateTime>(json['endPeriod2']),
      xSessionsGoal: serializer.fromJson<int?>(json['xSessionsGoal']),
      ySessionsDone: serializer.fromJson<int?>(json['ySessionsDone']),
      plannedRatio: serializer.fromJson<double?>(json['plannedRatio']),
      realRatio: serializer.fromJson<double?>(json['realRatio']),
      xSessionsR: serializer.fromJson<int?>(json['xSessionsR']),
      subjectIdZ: serializer.fromJson<int?>(json['subjectIdZ']),
      xSessionsZ: serializer.fromJson<int?>(json['xSessionsZ']),
      subjectIdF: serializer.fromJson<int?>(json['subjectIdF']),
      xSessionsF: serializer.fromJson<int?>(json['xSessionsF']),
      successPercentage: serializer.fromJson<double>(json['successPercentage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'codeName': serializer.toJson<String>(codeName),
      'type': serializer.toJson<int>(type),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'startPeriod1': serializer.toJson<DateTime?>(startPeriod1),
      'endPeriod1': serializer.toJson<DateTime?>(endPeriod1),
      'startPeriod2': serializer.toJson<DateTime>(startPeriod2),
      'endPeriod2': serializer.toJson<DateTime>(endPeriod2),
      'xSessionsGoal': serializer.toJson<int?>(xSessionsGoal),
      'ySessionsDone': serializer.toJson<int?>(ySessionsDone),
      'plannedRatio': serializer.toJson<double?>(plannedRatio),
      'realRatio': serializer.toJson<double?>(realRatio),
      'xSessionsR': serializer.toJson<int?>(xSessionsR),
      'subjectIdZ': serializer.toJson<int?>(subjectIdZ),
      'xSessionsZ': serializer.toJson<int?>(xSessionsZ),
      'subjectIdF': serializer.toJson<int?>(subjectIdF),
      'xSessionsF': serializer.toJson<int?>(xSessionsF),
      'successPercentage': serializer.toJson<double>(successPercentage),
    };
  }

  GoalData copyWith(
          {int? id,
          String? codeName,
          int? type,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> startPeriod1 = const Value.absent(),
          Value<DateTime?> endPeriod1 = const Value.absent(),
          DateTime? startPeriod2,
          DateTime? endPeriod2,
          Value<int?> xSessionsGoal = const Value.absent(),
          Value<int?> ySessionsDone = const Value.absent(),
          Value<double?> plannedRatio = const Value.absent(),
          Value<double?> realRatio = const Value.absent(),
          Value<int?> xSessionsR = const Value.absent(),
          Value<int?> subjectIdZ = const Value.absent(),
          Value<int?> xSessionsZ = const Value.absent(),
          Value<int?> subjectIdF = const Value.absent(),
          Value<int?> xSessionsF = const Value.absent(),
          double? successPercentage}) =>
      GoalData(
        id: id ?? this.id,
        codeName: codeName ?? this.codeName,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        startPeriod1:
            startPeriod1.present ? startPeriod1.value : this.startPeriod1,
        endPeriod1: endPeriod1.present ? endPeriod1.value : this.endPeriod1,
        startPeriod2: startPeriod2 ?? this.startPeriod2,
        endPeriod2: endPeriod2 ?? this.endPeriod2,
        xSessionsGoal:
            xSessionsGoal.present ? xSessionsGoal.value : this.xSessionsGoal,
        ySessionsDone:
            ySessionsDone.present ? ySessionsDone.value : this.ySessionsDone,
        plannedRatio:
            plannedRatio.present ? plannedRatio.value : this.plannedRatio,
        realRatio: realRatio.present ? realRatio.value : this.realRatio,
        xSessionsR: xSessionsR.present ? xSessionsR.value : this.xSessionsR,
        subjectIdZ: subjectIdZ.present ? subjectIdZ.value : this.subjectIdZ,
        xSessionsZ: xSessionsZ.present ? xSessionsZ.value : this.xSessionsZ,
        subjectIdF: subjectIdF.present ? subjectIdF.value : this.subjectIdF,
        xSessionsF: xSessionsF.present ? xSessionsF.value : this.xSessionsF,
        successPercentage: successPercentage ?? this.successPercentage,
      );
  GoalData copyWithCompanion(GoalCompanion data) {
    return GoalData(
      id: data.id.present ? data.id.value : this.id,
      codeName: data.codeName.present ? data.codeName.value : this.codeName,
      type: data.type.present ? data.type.value : this.type,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      startPeriod1: data.startPeriod1.present
          ? data.startPeriod1.value
          : this.startPeriod1,
      endPeriod1:
          data.endPeriod1.present ? data.endPeriod1.value : this.endPeriod1,
      startPeriod2: data.startPeriod2.present
          ? data.startPeriod2.value
          : this.startPeriod2,
      endPeriod2:
          data.endPeriod2.present ? data.endPeriod2.value : this.endPeriod2,
      xSessionsGoal: data.xSessionsGoal.present
          ? data.xSessionsGoal.value
          : this.xSessionsGoal,
      ySessionsDone: data.ySessionsDone.present
          ? data.ySessionsDone.value
          : this.ySessionsDone,
      plannedRatio: data.plannedRatio.present
          ? data.plannedRatio.value
          : this.plannedRatio,
      realRatio: data.realRatio.present ? data.realRatio.value : this.realRatio,
      xSessionsR:
          data.xSessionsR.present ? data.xSessionsR.value : this.xSessionsR,
      subjectIdZ:
          data.subjectIdZ.present ? data.subjectIdZ.value : this.subjectIdZ,
      xSessionsZ:
          data.xSessionsZ.present ? data.xSessionsZ.value : this.xSessionsZ,
      subjectIdF:
          data.subjectIdF.present ? data.subjectIdF.value : this.subjectIdF,
      xSessionsF:
          data.xSessionsF.present ? data.xSessionsF.value : this.xSessionsF,
      successPercentage: data.successPercentage.present
          ? data.successPercentage.value
          : this.successPercentage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalData(')
          ..write('id: $id, ')
          ..write('codeName: $codeName, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('startPeriod1: $startPeriod1, ')
          ..write('endPeriod1: $endPeriod1, ')
          ..write('startPeriod2: $startPeriod2, ')
          ..write('endPeriod2: $endPeriod2, ')
          ..write('xSessionsGoal: $xSessionsGoal, ')
          ..write('ySessionsDone: $ySessionsDone, ')
          ..write('plannedRatio: $plannedRatio, ')
          ..write('realRatio: $realRatio, ')
          ..write('xSessionsR: $xSessionsR, ')
          ..write('subjectIdZ: $subjectIdZ, ')
          ..write('xSessionsZ: $xSessionsZ, ')
          ..write('subjectIdF: $subjectIdF, ')
          ..write('xSessionsF: $xSessionsF, ')
          ..write('successPercentage: $successPercentage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      codeName,
      type,
      createdAt,
      updatedAt,
      startPeriod1,
      endPeriod1,
      startPeriod2,
      endPeriod2,
      xSessionsGoal,
      ySessionsDone,
      plannedRatio,
      realRatio,
      xSessionsR,
      subjectIdZ,
      xSessionsZ,
      subjectIdF,
      xSessionsF,
      successPercentage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalData &&
          other.id == this.id &&
          other.codeName == this.codeName &&
          other.type == this.type &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.startPeriod1 == this.startPeriod1 &&
          other.endPeriod1 == this.endPeriod1 &&
          other.startPeriod2 == this.startPeriod2 &&
          other.endPeriod2 == this.endPeriod2 &&
          other.xSessionsGoal == this.xSessionsGoal &&
          other.ySessionsDone == this.ySessionsDone &&
          other.plannedRatio == this.plannedRatio &&
          other.realRatio == this.realRatio &&
          other.xSessionsR == this.xSessionsR &&
          other.subjectIdZ == this.subjectIdZ &&
          other.xSessionsZ == this.xSessionsZ &&
          other.subjectIdF == this.subjectIdF &&
          other.xSessionsF == this.xSessionsF &&
          other.successPercentage == this.successPercentage);
}

class GoalCompanion extends UpdateCompanion<GoalData> {
  final Value<int> id;
  final Value<String> codeName;
  final Value<int> type;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> startPeriod1;
  final Value<DateTime?> endPeriod1;
  final Value<DateTime> startPeriod2;
  final Value<DateTime> endPeriod2;
  final Value<int?> xSessionsGoal;
  final Value<int?> ySessionsDone;
  final Value<double?> plannedRatio;
  final Value<double?> realRatio;
  final Value<int?> xSessionsR;
  final Value<int?> subjectIdZ;
  final Value<int?> xSessionsZ;
  final Value<int?> subjectIdF;
  final Value<int?> xSessionsF;
  final Value<double> successPercentage;
  const GoalCompanion({
    this.id = const Value.absent(),
    this.codeName = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.startPeriod1 = const Value.absent(),
    this.endPeriod1 = const Value.absent(),
    this.startPeriod2 = const Value.absent(),
    this.endPeriod2 = const Value.absent(),
    this.xSessionsGoal = const Value.absent(),
    this.ySessionsDone = const Value.absent(),
    this.plannedRatio = const Value.absent(),
    this.realRatio = const Value.absent(),
    this.xSessionsR = const Value.absent(),
    this.subjectIdZ = const Value.absent(),
    this.xSessionsZ = const Value.absent(),
    this.subjectIdF = const Value.absent(),
    this.xSessionsF = const Value.absent(),
    this.successPercentage = const Value.absent(),
  });
  GoalCompanion.insert({
    this.id = const Value.absent(),
    required String codeName,
    required int type,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.startPeriod1 = const Value.absent(),
    this.endPeriod1 = const Value.absent(),
    required DateTime startPeriod2,
    required DateTime endPeriod2,
    this.xSessionsGoal = const Value.absent(),
    this.ySessionsDone = const Value.absent(),
    this.plannedRatio = const Value.absent(),
    this.realRatio = const Value.absent(),
    this.xSessionsR = const Value.absent(),
    this.subjectIdZ = const Value.absent(),
    this.xSessionsZ = const Value.absent(),
    this.subjectIdF = const Value.absent(),
    this.xSessionsF = const Value.absent(),
    this.successPercentage = const Value.absent(),
  })  : codeName = Value(codeName),
        type = Value(type),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        startPeriod2 = Value(startPeriod2),
        endPeriod2 = Value(endPeriod2);
  static Insertable<GoalData> custom({
    Expression<int>? id,
    Expression<String>? codeName,
    Expression<int>? type,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? startPeriod1,
    Expression<DateTime>? endPeriod1,
    Expression<DateTime>? startPeriod2,
    Expression<DateTime>? endPeriod2,
    Expression<int>? xSessionsGoal,
    Expression<int>? ySessionsDone,
    Expression<double>? plannedRatio,
    Expression<double>? realRatio,
    Expression<int>? xSessionsR,
    Expression<int>? subjectIdZ,
    Expression<int>? xSessionsZ,
    Expression<int>? subjectIdF,
    Expression<int>? xSessionsF,
    Expression<double>? successPercentage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (codeName != null) 'code_name': codeName,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (startPeriod1 != null) 'start_period1': startPeriod1,
      if (endPeriod1 != null) 'end_period1': endPeriod1,
      if (startPeriod2 != null) 'start_period2': startPeriod2,
      if (endPeriod2 != null) 'end_period2': endPeriod2,
      if (xSessionsGoal != null) 'x_sessions_goal': xSessionsGoal,
      if (ySessionsDone != null) 'y_sessions_done': ySessionsDone,
      if (plannedRatio != null) 'planned_ratio': plannedRatio,
      if (realRatio != null) 'real_ratio': realRatio,
      if (xSessionsR != null) 'x_sessions_r': xSessionsR,
      if (subjectIdZ != null) 'subject_id_z': subjectIdZ,
      if (xSessionsZ != null) 'x_sessions_z': xSessionsZ,
      if (subjectIdF != null) 'subject_id_f': subjectIdF,
      if (xSessionsF != null) 'x_sessions_f': xSessionsF,
      if (successPercentage != null) 'success_percentage': successPercentage,
    });
  }

  GoalCompanion copyWith(
      {Value<int>? id,
      Value<String>? codeName,
      Value<int>? type,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? startPeriod1,
      Value<DateTime?>? endPeriod1,
      Value<DateTime>? startPeriod2,
      Value<DateTime>? endPeriod2,
      Value<int?>? xSessionsGoal,
      Value<int?>? ySessionsDone,
      Value<double?>? plannedRatio,
      Value<double?>? realRatio,
      Value<int?>? xSessionsR,
      Value<int?>? subjectIdZ,
      Value<int?>? xSessionsZ,
      Value<int?>? subjectIdF,
      Value<int?>? xSessionsF,
      Value<double>? successPercentage}) {
    return GoalCompanion(
      id: id ?? this.id,
      codeName: codeName ?? this.codeName,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      startPeriod1: startPeriod1 ?? this.startPeriod1,
      endPeriod1: endPeriod1 ?? this.endPeriod1,
      startPeriod2: startPeriod2 ?? this.startPeriod2,
      endPeriod2: endPeriod2 ?? this.endPeriod2,
      xSessionsGoal: xSessionsGoal ?? this.xSessionsGoal,
      ySessionsDone: ySessionsDone ?? this.ySessionsDone,
      plannedRatio: plannedRatio ?? this.plannedRatio,
      realRatio: realRatio ?? this.realRatio,
      xSessionsR: xSessionsR ?? this.xSessionsR,
      subjectIdZ: subjectIdZ ?? this.subjectIdZ,
      xSessionsZ: xSessionsZ ?? this.xSessionsZ,
      subjectIdF: subjectIdF ?? this.subjectIdF,
      xSessionsF: xSessionsF ?? this.xSessionsF,
      successPercentage: successPercentage ?? this.successPercentage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (codeName.present) {
      map['code_name'] = Variable<String>(codeName.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (startPeriod1.present) {
      map['start_period1'] = Variable<DateTime>(startPeriod1.value);
    }
    if (endPeriod1.present) {
      map['end_period1'] = Variable<DateTime>(endPeriod1.value);
    }
    if (startPeriod2.present) {
      map['start_period2'] = Variable<DateTime>(startPeriod2.value);
    }
    if (endPeriod2.present) {
      map['end_period2'] = Variable<DateTime>(endPeriod2.value);
    }
    if (xSessionsGoal.present) {
      map['x_sessions_goal'] = Variable<int>(xSessionsGoal.value);
    }
    if (ySessionsDone.present) {
      map['y_sessions_done'] = Variable<int>(ySessionsDone.value);
    }
    if (plannedRatio.present) {
      map['planned_ratio'] = Variable<double>(plannedRatio.value);
    }
    if (realRatio.present) {
      map['real_ratio'] = Variable<double>(realRatio.value);
    }
    if (xSessionsR.present) {
      map['x_sessions_r'] = Variable<int>(xSessionsR.value);
    }
    if (subjectIdZ.present) {
      map['subject_id_z'] = Variable<int>(subjectIdZ.value);
    }
    if (xSessionsZ.present) {
      map['x_sessions_z'] = Variable<int>(xSessionsZ.value);
    }
    if (subjectIdF.present) {
      map['subject_id_f'] = Variable<int>(subjectIdF.value);
    }
    if (xSessionsF.present) {
      map['x_sessions_f'] = Variable<int>(xSessionsF.value);
    }
    if (successPercentage.present) {
      map['success_percentage'] = Variable<double>(successPercentage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalCompanion(')
          ..write('id: $id, ')
          ..write('codeName: $codeName, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('startPeriod1: $startPeriod1, ')
          ..write('endPeriod1: $endPeriod1, ')
          ..write('startPeriod2: $startPeriod2, ')
          ..write('endPeriod2: $endPeriod2, ')
          ..write('xSessionsGoal: $xSessionsGoal, ')
          ..write('ySessionsDone: $ySessionsDone, ')
          ..write('plannedRatio: $plannedRatio, ')
          ..write('realRatio: $realRatio, ')
          ..write('xSessionsR: $xSessionsR, ')
          ..write('subjectIdZ: $subjectIdZ, ')
          ..write('xSessionsZ: $xSessionsZ, ')
          ..write('subjectIdF: $subjectIdF, ')
          ..write('xSessionsF: $xSessionsF, ')
          ..write('successPercentage: $successPercentage')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SettingsVariablesTable settingsVariables =
      $SettingsVariablesTable(this);
  late final $MemoryCountdownVariableTable memoryCountdownVariable =
      $MemoryCountdownVariableTable(this);
  late final $RoundVariableTable roundVariable = $RoundVariableTable(this);
  late final $SubjectTable subject = $SubjectTable(this);
  late final $OutPlanningVariableTable outPlanningVariable =
      $OutPlanningVariableTable(this);
  late final $GoalTable goal = $GoalTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        settingsVariables,
        memoryCountdownVariable,
        roundVariable,
        subject,
        outPlanningVariable,
        goal
      ];
}

typedef $$SettingsVariablesTableCreateCompanionBuilder
    = SettingsVariablesCompanion Function({
  Value<int> id,
  required bool windowOnTop,
  required int requestedNumberOfSessions,
  required int selectedBreakDurationStored,
  required int selectedFocusDurationStored,
  required int selectedLongBreakDurationStored,
  Value<bool> roundPlanningByDefault,
});
typedef $$SettingsVariablesTableUpdateCompanionBuilder
    = SettingsVariablesCompanion Function({
  Value<int> id,
  Value<bool> windowOnTop,
  Value<int> requestedNumberOfSessions,
  Value<int> selectedBreakDurationStored,
  Value<int> selectedFocusDurationStored,
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

  ColumnFilters<int> get selectedFocusDurationStored => $composableBuilder(
      column: $table.selectedFocusDurationStored,
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

  ColumnOrderings<int> get selectedFocusDurationStored => $composableBuilder(
      column: $table.selectedFocusDurationStored,
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

  GeneratedColumn<int> get selectedFocusDurationStored => $composableBuilder(
      column: $table.selectedFocusDurationStored, builder: (column) => column);

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
            Value<int> selectedFocusDurationStored = const Value.absent(),
            Value<int> selectedLongBreakDurationStored = const Value.absent(),
            Value<bool> roundPlanningByDefault = const Value.absent(),
          }) =>
              SettingsVariablesCompanion(
            id: id,
            windowOnTop: windowOnTop,
            requestedNumberOfSessions: requestedNumberOfSessions,
            selectedBreakDurationStored: selectedBreakDurationStored,
            selectedFocusDurationStored: selectedFocusDurationStored,
            selectedLongBreakDurationStored: selectedLongBreakDurationStored,
            roundPlanningByDefault: roundPlanningByDefault,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required bool windowOnTop,
            required int requestedNumberOfSessions,
            required int selectedBreakDurationStored,
            required int selectedFocusDurationStored,
            required int selectedLongBreakDurationStored,
            Value<bool> roundPlanningByDefault = const Value.absent(),
          }) =>
              SettingsVariablesCompanion.insert(
            id: id,
            windowOnTop: windowOnTop,
            requestedNumberOfSessions: requestedNumberOfSessions,
            selectedBreakDurationStored: selectedBreakDurationStored,
            selectedFocusDurationStored: selectedFocusDurationStored,
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
typedef $$MemoryCountdownVariableTableCreateCompanionBuilder
    = MemoryCountdownVariableCompanion Function({
  Value<int> id,
  required int roundGoal,
  required int roundId,
  Value<String?> propableCause,
  Value<int?> durationLeft,
  required int roundRunTime,
  required int plannedDuration,
  Value<int?> actuallyDoneDuration,
  required DateTime expStartingTime,
  Value<DateTime?> startingTime,
  Value<DateTime?> expFinishTime,
  Value<DateTime?> finishTime,
  Value<bool?> completed,
  Value<bool> active,
  required String type,
  Value<int?> subject,
});
typedef $$MemoryCountdownVariableTableUpdateCompanionBuilder
    = MemoryCountdownVariableCompanion Function({
  Value<int> id,
  Value<int> roundGoal,
  Value<int> roundId,
  Value<String?> propableCause,
  Value<int?> durationLeft,
  Value<int> roundRunTime,
  Value<int> plannedDuration,
  Value<int?> actuallyDoneDuration,
  Value<DateTime> expStartingTime,
  Value<DateTime?> startingTime,
  Value<DateTime?> expFinishTime,
  Value<DateTime?> finishTime,
  Value<bool?> completed,
  Value<bool> active,
  Value<String> type,
  Value<int?> subject,
});

final class $$MemoryCountdownVariableTableReferences extends BaseReferences<
    _$AppDatabase, $MemoryCountdownVariableTable, MemoryCountdownVariableData> {
  $$MemoryCountdownVariableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SubjectTable, List<SubjectData>>
      _subjectRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.subject,
          aliasName: $_aliasNameGenerator(
              db.memoryCountdownVariable.id, db.subject.lastFocuzdOnSessionID));

  $$SubjectTableProcessedTableManager get subjectRefs {
    final manager = $$SubjectTableTableManager($_db, $_db.subject).filter(
        (f) => f.lastFocuzdOnSessionID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_subjectRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MemoryCountdownVariableTableFilterComposer
    extends Composer<_$AppDatabase, $MemoryCountdownVariableTable> {
  $$MemoryCountdownVariableTableFilterComposer({
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

  ColumnFilters<String> get propableCause => $composableBuilder(
      column: $table.propableCause, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationLeft => $composableBuilder(
      column: $table.durationLeft, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get roundRunTime => $composableBuilder(
      column: $table.roundRunTime, builder: (column) => ColumnFilters(column));

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

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

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
        getReferencedColumn: (t) => t.lastFocuzdOnSessionID,
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

class $$MemoryCountdownVariableTableOrderingComposer
    extends Composer<_$AppDatabase, $MemoryCountdownVariableTable> {
  $$MemoryCountdownVariableTableOrderingComposer({
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

  ColumnOrderings<String> get propableCause => $composableBuilder(
      column: $table.propableCause,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationLeft => $composableBuilder(
      column: $table.durationLeft,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get roundRunTime => $composableBuilder(
      column: $table.roundRunTime,
      builder: (column) => ColumnOrderings(column));

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

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));
}

class $$MemoryCountdownVariableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MemoryCountdownVariableTable> {
  $$MemoryCountdownVariableTableAnnotationComposer({
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

  GeneratedColumn<String> get propableCause => $composableBuilder(
      column: $table.propableCause, builder: (column) => column);

  GeneratedColumn<int> get durationLeft => $composableBuilder(
      column: $table.durationLeft, builder: (column) => column);

  GeneratedColumn<int> get roundRunTime => $composableBuilder(
      column: $table.roundRunTime, builder: (column) => column);

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

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

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
        getReferencedColumn: (t) => t.lastFocuzdOnSessionID,
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

class $$MemoryCountdownVariableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MemoryCountdownVariableTable,
    MemoryCountdownVariableData,
    $$MemoryCountdownVariableTableFilterComposer,
    $$MemoryCountdownVariableTableOrderingComposer,
    $$MemoryCountdownVariableTableAnnotationComposer,
    $$MemoryCountdownVariableTableCreateCompanionBuilder,
    $$MemoryCountdownVariableTableUpdateCompanionBuilder,
    (MemoryCountdownVariableData, $$MemoryCountdownVariableTableReferences),
    MemoryCountdownVariableData,
    PrefetchHooks Function({bool subjectRefs})> {
  $$MemoryCountdownVariableTableTableManager(
      _$AppDatabase db, $MemoryCountdownVariableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MemoryCountdownVariableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$MemoryCountdownVariableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemoryCountdownVariableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> roundGoal = const Value.absent(),
            Value<int> roundId = const Value.absent(),
            Value<String?> propableCause = const Value.absent(),
            Value<int?> durationLeft = const Value.absent(),
            Value<int> roundRunTime = const Value.absent(),
            Value<int> plannedDuration = const Value.absent(),
            Value<int?> actuallyDoneDuration = const Value.absent(),
            Value<DateTime> expStartingTime = const Value.absent(),
            Value<DateTime?> startingTime = const Value.absent(),
            Value<DateTime?> expFinishTime = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<bool?> completed = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int?> subject = const Value.absent(),
          }) =>
              MemoryCountdownVariableCompanion(
            id: id,
            roundGoal: roundGoal,
            roundId: roundId,
            propableCause: propableCause,
            durationLeft: durationLeft,
            roundRunTime: roundRunTime,
            plannedDuration: plannedDuration,
            actuallyDoneDuration: actuallyDoneDuration,
            expStartingTime: expStartingTime,
            startingTime: startingTime,
            expFinishTime: expFinishTime,
            finishTime: finishTime,
            completed: completed,
            active: active,
            type: type,
            subject: subject,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int roundGoal,
            required int roundId,
            Value<String?> propableCause = const Value.absent(),
            Value<int?> durationLeft = const Value.absent(),
            required int roundRunTime,
            required int plannedDuration,
            Value<int?> actuallyDoneDuration = const Value.absent(),
            required DateTime expStartingTime,
            Value<DateTime?> startingTime = const Value.absent(),
            Value<DateTime?> expFinishTime = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<bool?> completed = const Value.absent(),
            Value<bool> active = const Value.absent(),
            required String type,
            Value<int?> subject = const Value.absent(),
          }) =>
              MemoryCountdownVariableCompanion.insert(
            id: id,
            roundGoal: roundGoal,
            roundId: roundId,
            propableCause: propableCause,
            durationLeft: durationLeft,
            roundRunTime: roundRunTime,
            plannedDuration: plannedDuration,
            actuallyDoneDuration: actuallyDoneDuration,
            expStartingTime: expStartingTime,
            startingTime: startingTime,
            expFinishTime: expFinishTime,
            finishTime: finishTime,
            completed: completed,
            active: active,
            type: type,
            subject: subject,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MemoryCountdownVariableTableReferences(db, table, e)
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
                    await $_getPrefetchedData<MemoryCountdownVariableData,
                            $MemoryCountdownVariableTable, SubjectData>(
                        currentTable: table,
                        referencedTable:
                            $$MemoryCountdownVariableTableReferences
                                ._subjectRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MemoryCountdownVariableTableReferences(
                                    db, table, p0)
                                .subjectRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.lastFocuzdOnSessionID == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MemoryCountdownVariableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $MemoryCountdownVariableTable,
        MemoryCountdownVariableData,
        $$MemoryCountdownVariableTableFilterComposer,
        $$MemoryCountdownVariableTableOrderingComposer,
        $$MemoryCountdownVariableTableAnnotationComposer,
        $$MemoryCountdownVariableTableCreateCompanionBuilder,
        $$MemoryCountdownVariableTableUpdateCompanionBuilder,
        (MemoryCountdownVariableData, $$MemoryCountdownVariableTableReferences),
        MemoryCountdownVariableData,
        PrefetchHooks Function({bool subjectRefs})>;
typedef $$RoundVariableTableCreateCompanionBuilder = RoundVariableCompanion
    Function({
  Value<int> id,
  Value<bool> completed,
  Value<String?> propableCause,
  required int plannedDuration,
  Value<int?> actuallyDoneDuration,
  required DateTime startingTime,
  Value<DateTime?> expFinishTime,
  Value<DateTime?> finishTime,
});
typedef $$RoundVariableTableUpdateCompanionBuilder = RoundVariableCompanion
    Function({
  Value<int> id,
  Value<bool> completed,
  Value<String?> propableCause,
  Value<int> plannedDuration,
  Value<int?> actuallyDoneDuration,
  Value<DateTime> startingTime,
  Value<DateTime?> expFinishTime,
  Value<DateTime?> finishTime,
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
            Value<bool> completed = const Value.absent(),
            Value<String?> propableCause = const Value.absent(),
            Value<int> plannedDuration = const Value.absent(),
            Value<int?> actuallyDoneDuration = const Value.absent(),
            Value<DateTime> startingTime = const Value.absent(),
            Value<DateTime?> expFinishTime = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
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
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> completed = const Value.absent(),
            Value<String?> propableCause = const Value.absent(),
            required int plannedDuration,
            Value<int?> actuallyDoneDuration = const Value.absent(),
            required DateTime startingTime,
            Value<DateTime?> expFinishTime = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
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
  required String address,
  Value<int?> superSubjectID,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> subSubjects,
  Value<int?> lastFocuzdOnSessionID,
  Value<int> totalTimeSpent,
});
typedef $$SubjectTableUpdateCompanionBuilder = SubjectCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> address,
  Value<int?> superSubjectID,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> subSubjects,
  Value<int?> lastFocuzdOnSessionID,
  Value<int> totalTimeSpent,
});

final class $$SubjectTableReferences
    extends BaseReferences<_$AppDatabase, $SubjectTable, SubjectData> {
  $$SubjectTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MemoryCountdownVariableTable _lastFocuzdOnSessionIDTable(
          _$AppDatabase db) =>
      db.memoryCountdownVariable.createAlias($_aliasNameGenerator(
          db.subject.lastFocuzdOnSessionID, db.memoryCountdownVariable.id));

  $$MemoryCountdownVariableTableProcessedTableManager?
      get lastFocuzdOnSessionID {
    final $_column = $_itemColumn<int>('last_focuzd_on_session_i_d');
    if ($_column == null) return null;
    final manager = $$MemoryCountdownVariableTableTableManager(
            $_db, $_db.memoryCountdownVariable)
        .filter((f) => f.id.sqlEquals($_column));
    final item =
        $_typedResult.readTableOrNull(_lastFocuzdOnSessionIDTable($_db));
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

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get superSubjectID => $composableBuilder(
      column: $table.superSubjectID,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subSubjects => $composableBuilder(
      column: $table.subSubjects, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalTimeSpent => $composableBuilder(
      column: $table.totalTimeSpent,
      builder: (column) => ColumnFilters(column));

  $$MemoryCountdownVariableTableFilterComposer get lastFocuzdOnSessionID {
    final $$MemoryCountdownVariableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.lastFocuzdOnSessionID,
            referencedTable: $db.memoryCountdownVariable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MemoryCountdownVariableTableFilterComposer(
                  $db: $db,
                  $table: $db.memoryCountdownVariable,
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

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get superSubjectID => $composableBuilder(
      column: $table.superSubjectID,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subSubjects => $composableBuilder(
      column: $table.subSubjects, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalTimeSpent => $composableBuilder(
      column: $table.totalTimeSpent,
      builder: (column) => ColumnOrderings(column));

  $$MemoryCountdownVariableTableOrderingComposer get lastFocuzdOnSessionID {
    final $$MemoryCountdownVariableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.lastFocuzdOnSessionID,
            referencedTable: $db.memoryCountdownVariable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MemoryCountdownVariableTableOrderingComposer(
                  $db: $db,
                  $table: $db.memoryCountdownVariable,
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

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<int> get superSubjectID => $composableBuilder(
      column: $table.superSubjectID, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get subSubjects => $composableBuilder(
      column: $table.subSubjects, builder: (column) => column);

  GeneratedColumn<int> get totalTimeSpent => $composableBuilder(
      column: $table.totalTimeSpent, builder: (column) => column);

  $$MemoryCountdownVariableTableAnnotationComposer get lastFocuzdOnSessionID {
    final $$MemoryCountdownVariableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.lastFocuzdOnSessionID,
            referencedTable: $db.memoryCountdownVariable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MemoryCountdownVariableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.memoryCountdownVariable,
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
    PrefetchHooks Function({bool lastFocuzdOnSessionID})> {
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
            Value<String> address = const Value.absent(),
            Value<int?> superSubjectID = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> subSubjects = const Value.absent(),
            Value<int?> lastFocuzdOnSessionID = const Value.absent(),
            Value<int> totalTimeSpent = const Value.absent(),
          }) =>
              SubjectCompanion(
            id: id,
            name: name,
            address: address,
            superSubjectID: superSubjectID,
            createdAt: createdAt,
            updatedAt: updatedAt,
            subSubjects: subSubjects,
            lastFocuzdOnSessionID: lastFocuzdOnSessionID,
            totalTimeSpent: totalTimeSpent,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String address,
            Value<int?> superSubjectID = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> subSubjects = const Value.absent(),
            Value<int?> lastFocuzdOnSessionID = const Value.absent(),
            Value<int> totalTimeSpent = const Value.absent(),
          }) =>
              SubjectCompanion.insert(
            id: id,
            name: name,
            address: address,
            superSubjectID: superSubjectID,
            createdAt: createdAt,
            updatedAt: updatedAt,
            subSubjects: subSubjects,
            lastFocuzdOnSessionID: lastFocuzdOnSessionID,
            totalTimeSpent: totalTimeSpent,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$SubjectTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({lastFocuzdOnSessionID = false}) {
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
                if (lastFocuzdOnSessionID) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.lastFocuzdOnSessionID,
                    referencedTable: $$SubjectTableReferences
                        ._lastFocuzdOnSessionIDTable(db),
                    referencedColumn: $$SubjectTableReferences
                        ._lastFocuzdOnSessionIDTable(db)
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
    PrefetchHooks Function({bool lastFocuzdOnSessionID})>;
typedef $$OutPlanningVariableTableCreateCompanionBuilder
    = OutPlanningVariableCompanion Function({
  Value<int> id,
  required int memoryCountdownID,
  Value<DateTime?> startingTime,
  Value<DateTime?> finishTime,
  Value<int?> duration,
  Value<String?> type,
  Value<bool> isActive,
});
typedef $$OutPlanningVariableTableUpdateCompanionBuilder
    = OutPlanningVariableCompanion Function({
  Value<int> id,
  Value<int> memoryCountdownID,
  Value<DateTime?> startingTime,
  Value<DateTime?> finishTime,
  Value<int?> duration,
  Value<String?> type,
  Value<bool> isActive,
});

class $$OutPlanningVariableTableFilterComposer
    extends Composer<_$AppDatabase, $OutPlanningVariableTable> {
  $$OutPlanningVariableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get memoryCountdownID => $composableBuilder(
      column: $table.memoryCountdownID,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startingTime => $composableBuilder(
      column: $table.startingTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get finishTime => $composableBuilder(
      column: $table.finishTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));
}

class $$OutPlanningVariableTableOrderingComposer
    extends Composer<_$AppDatabase, $OutPlanningVariableTable> {
  $$OutPlanningVariableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get memoryCountdownID => $composableBuilder(
      column: $table.memoryCountdownID,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startingTime => $composableBuilder(
      column: $table.startingTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get finishTime => $composableBuilder(
      column: $table.finishTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));
}

class $$OutPlanningVariableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OutPlanningVariableTable> {
  $$OutPlanningVariableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get memoryCountdownID => $composableBuilder(
      column: $table.memoryCountdownID, builder: (column) => column);

  GeneratedColumn<DateTime> get startingTime => $composableBuilder(
      column: $table.startingTime, builder: (column) => column);

  GeneratedColumn<DateTime> get finishTime => $composableBuilder(
      column: $table.finishTime, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$OutPlanningVariableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OutPlanningVariableTable,
    OutPlanningVariableData,
    $$OutPlanningVariableTableFilterComposer,
    $$OutPlanningVariableTableOrderingComposer,
    $$OutPlanningVariableTableAnnotationComposer,
    $$OutPlanningVariableTableCreateCompanionBuilder,
    $$OutPlanningVariableTableUpdateCompanionBuilder,
    (
      OutPlanningVariableData,
      BaseReferences<_$AppDatabase, $OutPlanningVariableTable,
          OutPlanningVariableData>
    ),
    OutPlanningVariableData,
    PrefetchHooks Function()> {
  $$OutPlanningVariableTableTableManager(
      _$AppDatabase db, $OutPlanningVariableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OutPlanningVariableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OutPlanningVariableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OutPlanningVariableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> memoryCountdownID = const Value.absent(),
            Value<DateTime?> startingTime = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              OutPlanningVariableCompanion(
            id: id,
            memoryCountdownID: memoryCountdownID,
            startingTime: startingTime,
            finishTime: finishTime,
            duration: duration,
            type: type,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int memoryCountdownID,
            Value<DateTime?> startingTime = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              OutPlanningVariableCompanion.insert(
            id: id,
            memoryCountdownID: memoryCountdownID,
            startingTime: startingTime,
            finishTime: finishTime,
            duration: duration,
            type: type,
            isActive: isActive,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OutPlanningVariableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OutPlanningVariableTable,
    OutPlanningVariableData,
    $$OutPlanningVariableTableFilterComposer,
    $$OutPlanningVariableTableOrderingComposer,
    $$OutPlanningVariableTableAnnotationComposer,
    $$OutPlanningVariableTableCreateCompanionBuilder,
    $$OutPlanningVariableTableUpdateCompanionBuilder,
    (
      OutPlanningVariableData,
      BaseReferences<_$AppDatabase, $OutPlanningVariableTable,
          OutPlanningVariableData>
    ),
    OutPlanningVariableData,
    PrefetchHooks Function()>;
typedef $$GoalTableCreateCompanionBuilder = GoalCompanion Function({
  Value<int> id,
  required String codeName,
  required int type,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> startPeriod1,
  Value<DateTime?> endPeriod1,
  required DateTime startPeriod2,
  required DateTime endPeriod2,
  Value<int?> xSessionsGoal,
  Value<int?> ySessionsDone,
  Value<double?> plannedRatio,
  Value<double?> realRatio,
  Value<int?> xSessionsR,
  Value<int?> subjectIdZ,
  Value<int?> xSessionsZ,
  Value<int?> subjectIdF,
  Value<int?> xSessionsF,
  Value<double> successPercentage,
});
typedef $$GoalTableUpdateCompanionBuilder = GoalCompanion Function({
  Value<int> id,
  Value<String> codeName,
  Value<int> type,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> startPeriod1,
  Value<DateTime?> endPeriod1,
  Value<DateTime> startPeriod2,
  Value<DateTime> endPeriod2,
  Value<int?> xSessionsGoal,
  Value<int?> ySessionsDone,
  Value<double?> plannedRatio,
  Value<double?> realRatio,
  Value<int?> xSessionsR,
  Value<int?> subjectIdZ,
  Value<int?> xSessionsZ,
  Value<int?> subjectIdF,
  Value<int?> xSessionsF,
  Value<double> successPercentage,
});

class $$GoalTableFilterComposer extends Composer<_$AppDatabase, $GoalTable> {
  $$GoalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get codeName => $composableBuilder(
      column: $table.codeName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startPeriod1 => $composableBuilder(
      column: $table.startPeriod1, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endPeriod1 => $composableBuilder(
      column: $table.endPeriod1, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startPeriod2 => $composableBuilder(
      column: $table.startPeriod2, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endPeriod2 => $composableBuilder(
      column: $table.endPeriod2, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get xSessionsGoal => $composableBuilder(
      column: $table.xSessionsGoal, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get ySessionsDone => $composableBuilder(
      column: $table.ySessionsDone, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get plannedRatio => $composableBuilder(
      column: $table.plannedRatio, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get realRatio => $composableBuilder(
      column: $table.realRatio, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get xSessionsR => $composableBuilder(
      column: $table.xSessionsR, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subjectIdZ => $composableBuilder(
      column: $table.subjectIdZ, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get xSessionsZ => $composableBuilder(
      column: $table.xSessionsZ, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subjectIdF => $composableBuilder(
      column: $table.subjectIdF, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get xSessionsF => $composableBuilder(
      column: $table.xSessionsF, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get successPercentage => $composableBuilder(
      column: $table.successPercentage,
      builder: (column) => ColumnFilters(column));
}

class $$GoalTableOrderingComposer extends Composer<_$AppDatabase, $GoalTable> {
  $$GoalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get codeName => $composableBuilder(
      column: $table.codeName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startPeriod1 => $composableBuilder(
      column: $table.startPeriod1,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endPeriod1 => $composableBuilder(
      column: $table.endPeriod1, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startPeriod2 => $composableBuilder(
      column: $table.startPeriod2,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endPeriod2 => $composableBuilder(
      column: $table.endPeriod2, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get xSessionsGoal => $composableBuilder(
      column: $table.xSessionsGoal,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get ySessionsDone => $composableBuilder(
      column: $table.ySessionsDone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get plannedRatio => $composableBuilder(
      column: $table.plannedRatio,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get realRatio => $composableBuilder(
      column: $table.realRatio, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get xSessionsR => $composableBuilder(
      column: $table.xSessionsR, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subjectIdZ => $composableBuilder(
      column: $table.subjectIdZ, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get xSessionsZ => $composableBuilder(
      column: $table.xSessionsZ, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subjectIdF => $composableBuilder(
      column: $table.subjectIdF, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get xSessionsF => $composableBuilder(
      column: $table.xSessionsF, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get successPercentage => $composableBuilder(
      column: $table.successPercentage,
      builder: (column) => ColumnOrderings(column));
}

class $$GoalTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalTable> {
  $$GoalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get codeName =>
      $composableBuilder(column: $table.codeName, builder: (column) => column);

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get startPeriod1 => $composableBuilder(
      column: $table.startPeriod1, builder: (column) => column);

  GeneratedColumn<DateTime> get endPeriod1 => $composableBuilder(
      column: $table.endPeriod1, builder: (column) => column);

  GeneratedColumn<DateTime> get startPeriod2 => $composableBuilder(
      column: $table.startPeriod2, builder: (column) => column);

  GeneratedColumn<DateTime> get endPeriod2 => $composableBuilder(
      column: $table.endPeriod2, builder: (column) => column);

  GeneratedColumn<int> get xSessionsGoal => $composableBuilder(
      column: $table.xSessionsGoal, builder: (column) => column);

  GeneratedColumn<int> get ySessionsDone => $composableBuilder(
      column: $table.ySessionsDone, builder: (column) => column);

  GeneratedColumn<double> get plannedRatio => $composableBuilder(
      column: $table.plannedRatio, builder: (column) => column);

  GeneratedColumn<double> get realRatio =>
      $composableBuilder(column: $table.realRatio, builder: (column) => column);

  GeneratedColumn<int> get xSessionsR => $composableBuilder(
      column: $table.xSessionsR, builder: (column) => column);

  GeneratedColumn<int> get subjectIdZ => $composableBuilder(
      column: $table.subjectIdZ, builder: (column) => column);

  GeneratedColumn<int> get xSessionsZ => $composableBuilder(
      column: $table.xSessionsZ, builder: (column) => column);

  GeneratedColumn<int> get subjectIdF => $composableBuilder(
      column: $table.subjectIdF, builder: (column) => column);

  GeneratedColumn<int> get xSessionsF => $composableBuilder(
      column: $table.xSessionsF, builder: (column) => column);

  GeneratedColumn<double> get successPercentage => $composableBuilder(
      column: $table.successPercentage, builder: (column) => column);
}

class $$GoalTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GoalTable,
    GoalData,
    $$GoalTableFilterComposer,
    $$GoalTableOrderingComposer,
    $$GoalTableAnnotationComposer,
    $$GoalTableCreateCompanionBuilder,
    $$GoalTableUpdateCompanionBuilder,
    (GoalData, BaseReferences<_$AppDatabase, $GoalTable, GoalData>),
    GoalData,
    PrefetchHooks Function()> {
  $$GoalTableTableManager(_$AppDatabase db, $GoalTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> codeName = const Value.absent(),
            Value<int> type = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> startPeriod1 = const Value.absent(),
            Value<DateTime?> endPeriod1 = const Value.absent(),
            Value<DateTime> startPeriod2 = const Value.absent(),
            Value<DateTime> endPeriod2 = const Value.absent(),
            Value<int?> xSessionsGoal = const Value.absent(),
            Value<int?> ySessionsDone = const Value.absent(),
            Value<double?> plannedRatio = const Value.absent(),
            Value<double?> realRatio = const Value.absent(),
            Value<int?> xSessionsR = const Value.absent(),
            Value<int?> subjectIdZ = const Value.absent(),
            Value<int?> xSessionsZ = const Value.absent(),
            Value<int?> subjectIdF = const Value.absent(),
            Value<int?> xSessionsF = const Value.absent(),
            Value<double> successPercentage = const Value.absent(),
          }) =>
              GoalCompanion(
            id: id,
            codeName: codeName,
            type: type,
            createdAt: createdAt,
            updatedAt: updatedAt,
            startPeriod1: startPeriod1,
            endPeriod1: endPeriod1,
            startPeriod2: startPeriod2,
            endPeriod2: endPeriod2,
            xSessionsGoal: xSessionsGoal,
            ySessionsDone: ySessionsDone,
            plannedRatio: plannedRatio,
            realRatio: realRatio,
            xSessionsR: xSessionsR,
            subjectIdZ: subjectIdZ,
            xSessionsZ: xSessionsZ,
            subjectIdF: subjectIdF,
            xSessionsF: xSessionsF,
            successPercentage: successPercentage,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String codeName,
            required int type,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> startPeriod1 = const Value.absent(),
            Value<DateTime?> endPeriod1 = const Value.absent(),
            required DateTime startPeriod2,
            required DateTime endPeriod2,
            Value<int?> xSessionsGoal = const Value.absent(),
            Value<int?> ySessionsDone = const Value.absent(),
            Value<double?> plannedRatio = const Value.absent(),
            Value<double?> realRatio = const Value.absent(),
            Value<int?> xSessionsR = const Value.absent(),
            Value<int?> subjectIdZ = const Value.absent(),
            Value<int?> xSessionsZ = const Value.absent(),
            Value<int?> subjectIdF = const Value.absent(),
            Value<int?> xSessionsF = const Value.absent(),
            Value<double> successPercentage = const Value.absent(),
          }) =>
              GoalCompanion.insert(
            id: id,
            codeName: codeName,
            type: type,
            createdAt: createdAt,
            updatedAt: updatedAt,
            startPeriod1: startPeriod1,
            endPeriod1: endPeriod1,
            startPeriod2: startPeriod2,
            endPeriod2: endPeriod2,
            xSessionsGoal: xSessionsGoal,
            ySessionsDone: ySessionsDone,
            plannedRatio: plannedRatio,
            realRatio: realRatio,
            xSessionsR: xSessionsR,
            subjectIdZ: subjectIdZ,
            xSessionsZ: xSessionsZ,
            subjectIdF: subjectIdF,
            xSessionsF: xSessionsF,
            successPercentage: successPercentage,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GoalTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GoalTable,
    GoalData,
    $$GoalTableFilterComposer,
    $$GoalTableOrderingComposer,
    $$GoalTableAnnotationComposer,
    $$GoalTableCreateCompanionBuilder,
    $$GoalTableUpdateCompanionBuilder,
    (GoalData, BaseReferences<_$AppDatabase, $GoalTable, GoalData>),
    GoalData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SettingsVariablesTableTableManager get settingsVariables =>
      $$SettingsVariablesTableTableManager(_db, _db.settingsVariables);
  $$MemoryCountdownVariableTableTableManager get memoryCountdownVariable =>
      $$MemoryCountdownVariableTableTableManager(
          _db, _db.memoryCountdownVariable);
  $$RoundVariableTableTableManager get roundVariable =>
      $$RoundVariableTableTableManager(_db, _db.roundVariable);
  $$SubjectTableTableManager get subject =>
      $$SubjectTableTableManager(_db, _db.subject);
  $$OutPlanningVariableTableTableManager get outPlanningVariable =>
      $$OutPlanningVariableTableTableManager(_db, _db.outPlanningVariable);
  $$GoalTableTableManager get goal => $$GoalTableTableManager(_db, _db.goal);
}
