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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _windowOnTopMeta =
      const VerificationMeta('windowOnTop');
  @override
  late final GeneratedColumn<bool> windowOnTop = GeneratedColumn<bool>(
      'window_on_top', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("window_on_top" IN (0, 1))'));
  static const VerificationMeta _defaultNumberOfSessionsPerRoundMeta =
      const VerificationMeta('defaultNumberOfSessionsPerRound');
  @override
  late final GeneratedColumn<int> defaultNumberOfSessionsPerRound =
      GeneratedColumn<int>(
          'default_number_of_sessions_per_round', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _defaultBreakDurationStoredMeta =
      const VerificationMeta('defaultBreakDurationStored');
  @override
  late final GeneratedColumn<int> defaultBreakDurationStored =
      GeneratedColumn<int>('default_break_duration_stored', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _defaultFocusDurationStoredMeta =
      const VerificationMeta('defaultFocusDurationStored');
  @override
  late final GeneratedColumn<int> defaultFocusDurationStored =
      GeneratedColumn<int>('default_focus_duration_stored', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _defaultLongBreakDurationStoredMeta =
      const VerificationMeta('defaultLongBreakDurationStored');
  @override
  late final GeneratedColumn<int> defaultLongBreakDurationStored =
      GeneratedColumn<int>(
          'default_long_break_duration_stored', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _overlapPercentageCDMMeta =
      const VerificationMeta('overlapPercentageCDM');
  @override
  late final GeneratedColumn<double> overlapPercentageCDM =
      GeneratedColumn<double>('overlap_percentage_c_d_m', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(0.85));
  static const VerificationMeta _atWillStartMeta =
      const VerificationMeta('atWillStart');
  @override
  late final GeneratedColumn<bool> atWillStart = GeneratedColumn<bool>(
      'at_will_start', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("at_will_start" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        windowOnTop,
        defaultNumberOfSessionsPerRound,
        defaultBreakDurationStored,
        defaultFocusDurationStored,
        defaultLongBreakDurationStored,
        overlapPercentageCDM,
        atWillStart
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
    if (data.containsKey('default_number_of_sessions_per_round')) {
      context.handle(
          _defaultNumberOfSessionsPerRoundMeta,
          defaultNumberOfSessionsPerRound.isAcceptableOrUnknown(
              data['default_number_of_sessions_per_round']!,
              _defaultNumberOfSessionsPerRoundMeta));
    } else if (isInserting) {
      context.missing(_defaultNumberOfSessionsPerRoundMeta);
    }
    if (data.containsKey('default_break_duration_stored')) {
      context.handle(
          _defaultBreakDurationStoredMeta,
          defaultBreakDurationStored.isAcceptableOrUnknown(
              data['default_break_duration_stored']!,
              _defaultBreakDurationStoredMeta));
    } else if (isInserting) {
      context.missing(_defaultBreakDurationStoredMeta);
    }
    if (data.containsKey('default_focus_duration_stored')) {
      context.handle(
          _defaultFocusDurationStoredMeta,
          defaultFocusDurationStored.isAcceptableOrUnknown(
              data['default_focus_duration_stored']!,
              _defaultFocusDurationStoredMeta));
    } else if (isInserting) {
      context.missing(_defaultFocusDurationStoredMeta);
    }
    if (data.containsKey('default_long_break_duration_stored')) {
      context.handle(
          _defaultLongBreakDurationStoredMeta,
          defaultLongBreakDurationStored.isAcceptableOrUnknown(
              data['default_long_break_duration_stored']!,
              _defaultLongBreakDurationStoredMeta));
    } else if (isInserting) {
      context.missing(_defaultLongBreakDurationStoredMeta);
    }
    if (data.containsKey('overlap_percentage_c_d_m')) {
      context.handle(
          _overlapPercentageCDMMeta,
          overlapPercentageCDM.isAcceptableOrUnknown(
              data['overlap_percentage_c_d_m']!, _overlapPercentageCDMMeta));
    }
    if (data.containsKey('at_will_start')) {
      context.handle(
          _atWillStartMeta,
          atWillStart.isAcceptableOrUnknown(
              data['at_will_start']!, _atWillStartMeta));
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      windowOnTop: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}window_on_top'])!,
      defaultNumberOfSessionsPerRound: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}default_number_of_sessions_per_round'])!,
      defaultBreakDurationStored: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}default_break_duration_stored'])!,
      defaultFocusDurationStored: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}default_focus_duration_stored'])!,
      defaultLongBreakDurationStored: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}default_long_break_duration_stored'])!,
      overlapPercentageCDM: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}overlap_percentage_c_d_m'])!,
      atWillStart: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}at_will_start'])!,
    );
  }

  @override
  $SettingsVariablesTable createAlias(String alias) {
    return $SettingsVariablesTable(attachedDatabase, alias);
  }
}

class SettingsVariable extends DataClass
    implements Insertable<SettingsVariable> {
  final String id;
  final bool windowOnTop;
  final int defaultNumberOfSessionsPerRound;
  final int defaultBreakDurationStored;
  final int defaultFocusDurationStored;
  final int defaultLongBreakDurationStored;
  final double overlapPercentageCDM;
  final bool atWillStart;
  const SettingsVariable(
      {required this.id,
      required this.windowOnTop,
      required this.defaultNumberOfSessionsPerRound,
      required this.defaultBreakDurationStored,
      required this.defaultFocusDurationStored,
      required this.defaultLongBreakDurationStored,
      required this.overlapPercentageCDM,
      required this.atWillStart});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['window_on_top'] = Variable<bool>(windowOnTop);
    map['default_number_of_sessions_per_round'] =
        Variable<int>(defaultNumberOfSessionsPerRound);
    map['default_break_duration_stored'] =
        Variable<int>(defaultBreakDurationStored);
    map['default_focus_duration_stored'] =
        Variable<int>(defaultFocusDurationStored);
    map['default_long_break_duration_stored'] =
        Variable<int>(defaultLongBreakDurationStored);
    map['overlap_percentage_c_d_m'] = Variable<double>(overlapPercentageCDM);
    map['at_will_start'] = Variable<bool>(atWillStart);
    return map;
  }

  SettingsVariablesCompanion toCompanion(bool nullToAbsent) {
    return SettingsVariablesCompanion(
      id: Value(id),
      windowOnTop: Value(windowOnTop),
      defaultNumberOfSessionsPerRound: Value(defaultNumberOfSessionsPerRound),
      defaultBreakDurationStored: Value(defaultBreakDurationStored),
      defaultFocusDurationStored: Value(defaultFocusDurationStored),
      defaultLongBreakDurationStored: Value(defaultLongBreakDurationStored),
      overlapPercentageCDM: Value(overlapPercentageCDM),
      atWillStart: Value(atWillStart),
    );
  }

  factory SettingsVariable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsVariable(
      id: serializer.fromJson<String>(json['id']),
      windowOnTop: serializer.fromJson<bool>(json['windowOnTop']),
      defaultNumberOfSessionsPerRound:
          serializer.fromJson<int>(json['defaultNumberOfSessionsPerRound']),
      defaultBreakDurationStored:
          serializer.fromJson<int>(json['defaultBreakDurationStored']),
      defaultFocusDurationStored:
          serializer.fromJson<int>(json['defaultFocusDurationStored']),
      defaultLongBreakDurationStored:
          serializer.fromJson<int>(json['defaultLongBreakDurationStored']),
      overlapPercentageCDM:
          serializer.fromJson<double>(json['overlapPercentageCDM']),
      atWillStart: serializer.fromJson<bool>(json['atWillStart']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'windowOnTop': serializer.toJson<bool>(windowOnTop),
      'defaultNumberOfSessionsPerRound':
          serializer.toJson<int>(defaultNumberOfSessionsPerRound),
      'defaultBreakDurationStored':
          serializer.toJson<int>(defaultBreakDurationStored),
      'defaultFocusDurationStored':
          serializer.toJson<int>(defaultFocusDurationStored),
      'defaultLongBreakDurationStored':
          serializer.toJson<int>(defaultLongBreakDurationStored),
      'overlapPercentageCDM': serializer.toJson<double>(overlapPercentageCDM),
      'atWillStart': serializer.toJson<bool>(atWillStart),
    };
  }

  SettingsVariable copyWith(
          {String? id,
          bool? windowOnTop,
          int? defaultNumberOfSessionsPerRound,
          int? defaultBreakDurationStored,
          int? defaultFocusDurationStored,
          int? defaultLongBreakDurationStored,
          double? overlapPercentageCDM,
          bool? atWillStart}) =>
      SettingsVariable(
        id: id ?? this.id,
        windowOnTop: windowOnTop ?? this.windowOnTop,
        defaultNumberOfSessionsPerRound: defaultNumberOfSessionsPerRound ??
            this.defaultNumberOfSessionsPerRound,
        defaultBreakDurationStored:
            defaultBreakDurationStored ?? this.defaultBreakDurationStored,
        defaultFocusDurationStored:
            defaultFocusDurationStored ?? this.defaultFocusDurationStored,
        defaultLongBreakDurationStored: defaultLongBreakDurationStored ??
            this.defaultLongBreakDurationStored,
        overlapPercentageCDM: overlapPercentageCDM ?? this.overlapPercentageCDM,
        atWillStart: atWillStart ?? this.atWillStart,
      );
  SettingsVariable copyWithCompanion(SettingsVariablesCompanion data) {
    return SettingsVariable(
      id: data.id.present ? data.id.value : this.id,
      windowOnTop:
          data.windowOnTop.present ? data.windowOnTop.value : this.windowOnTop,
      defaultNumberOfSessionsPerRound:
          data.defaultNumberOfSessionsPerRound.present
              ? data.defaultNumberOfSessionsPerRound.value
              : this.defaultNumberOfSessionsPerRound,
      defaultBreakDurationStored: data.defaultBreakDurationStored.present
          ? data.defaultBreakDurationStored.value
          : this.defaultBreakDurationStored,
      defaultFocusDurationStored: data.defaultFocusDurationStored.present
          ? data.defaultFocusDurationStored.value
          : this.defaultFocusDurationStored,
      defaultLongBreakDurationStored:
          data.defaultLongBreakDurationStored.present
              ? data.defaultLongBreakDurationStored.value
              : this.defaultLongBreakDurationStored,
      overlapPercentageCDM: data.overlapPercentageCDM.present
          ? data.overlapPercentageCDM.value
          : this.overlapPercentageCDM,
      atWillStart:
          data.atWillStart.present ? data.atWillStart.value : this.atWillStart,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingsVariable(')
          ..write('id: $id, ')
          ..write('windowOnTop: $windowOnTop, ')
          ..write(
              'defaultNumberOfSessionsPerRound: $defaultNumberOfSessionsPerRound, ')
          ..write('defaultBreakDurationStored: $defaultBreakDurationStored, ')
          ..write('defaultFocusDurationStored: $defaultFocusDurationStored, ')
          ..write(
              'defaultLongBreakDurationStored: $defaultLongBreakDurationStored, ')
          ..write('overlapPercentageCDM: $overlapPercentageCDM, ')
          ..write('atWillStart: $atWillStart')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      windowOnTop,
      defaultNumberOfSessionsPerRound,
      defaultBreakDurationStored,
      defaultFocusDurationStored,
      defaultLongBreakDurationStored,
      overlapPercentageCDM,
      atWillStart);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsVariable &&
          other.id == this.id &&
          other.windowOnTop == this.windowOnTop &&
          other.defaultNumberOfSessionsPerRound ==
              this.defaultNumberOfSessionsPerRound &&
          other.defaultBreakDurationStored == this.defaultBreakDurationStored &&
          other.defaultFocusDurationStored == this.defaultFocusDurationStored &&
          other.defaultLongBreakDurationStored ==
              this.defaultLongBreakDurationStored &&
          other.overlapPercentageCDM == this.overlapPercentageCDM &&
          other.atWillStart == this.atWillStart);
}

class SettingsVariablesCompanion extends UpdateCompanion<SettingsVariable> {
  final Value<String> id;
  final Value<bool> windowOnTop;
  final Value<int> defaultNumberOfSessionsPerRound;
  final Value<int> defaultBreakDurationStored;
  final Value<int> defaultFocusDurationStored;
  final Value<int> defaultLongBreakDurationStored;
  final Value<double> overlapPercentageCDM;
  final Value<bool> atWillStart;
  final Value<int> rowid;
  const SettingsVariablesCompanion({
    this.id = const Value.absent(),
    this.windowOnTop = const Value.absent(),
    this.defaultNumberOfSessionsPerRound = const Value.absent(),
    this.defaultBreakDurationStored = const Value.absent(),
    this.defaultFocusDurationStored = const Value.absent(),
    this.defaultLongBreakDurationStored = const Value.absent(),
    this.overlapPercentageCDM = const Value.absent(),
    this.atWillStart = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsVariablesCompanion.insert({
    this.id = const Value.absent(),
    required bool windowOnTop,
    required int defaultNumberOfSessionsPerRound,
    required int defaultBreakDurationStored,
    required int defaultFocusDurationStored,
    required int defaultLongBreakDurationStored,
    this.overlapPercentageCDM = const Value.absent(),
    this.atWillStart = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : windowOnTop = Value(windowOnTop),
        defaultNumberOfSessionsPerRound =
            Value(defaultNumberOfSessionsPerRound),
        defaultBreakDurationStored = Value(defaultBreakDurationStored),
        defaultFocusDurationStored = Value(defaultFocusDurationStored),
        defaultLongBreakDurationStored = Value(defaultLongBreakDurationStored);
  static Insertable<SettingsVariable> custom({
    Expression<String>? id,
    Expression<bool>? windowOnTop,
    Expression<int>? defaultNumberOfSessionsPerRound,
    Expression<int>? defaultBreakDurationStored,
    Expression<int>? defaultFocusDurationStored,
    Expression<int>? defaultLongBreakDurationStored,
    Expression<double>? overlapPercentageCDM,
    Expression<bool>? atWillStart,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (windowOnTop != null) 'window_on_top': windowOnTop,
      if (defaultNumberOfSessionsPerRound != null)
        'default_number_of_sessions_per_round': defaultNumberOfSessionsPerRound,
      if (defaultBreakDurationStored != null)
        'default_break_duration_stored': defaultBreakDurationStored,
      if (defaultFocusDurationStored != null)
        'default_focus_duration_stored': defaultFocusDurationStored,
      if (defaultLongBreakDurationStored != null)
        'default_long_break_duration_stored': defaultLongBreakDurationStored,
      if (overlapPercentageCDM != null)
        'overlap_percentage_c_d_m': overlapPercentageCDM,
      if (atWillStart != null) 'at_will_start': atWillStart,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsVariablesCompanion copyWith(
      {Value<String>? id,
      Value<bool>? windowOnTop,
      Value<int>? defaultNumberOfSessionsPerRound,
      Value<int>? defaultBreakDurationStored,
      Value<int>? defaultFocusDurationStored,
      Value<int>? defaultLongBreakDurationStored,
      Value<double>? overlapPercentageCDM,
      Value<bool>? atWillStart,
      Value<int>? rowid}) {
    return SettingsVariablesCompanion(
      id: id ?? this.id,
      windowOnTop: windowOnTop ?? this.windowOnTop,
      defaultNumberOfSessionsPerRound: defaultNumberOfSessionsPerRound ??
          this.defaultNumberOfSessionsPerRound,
      defaultBreakDurationStored:
          defaultBreakDurationStored ?? this.defaultBreakDurationStored,
      defaultFocusDurationStored:
          defaultFocusDurationStored ?? this.defaultFocusDurationStored,
      defaultLongBreakDurationStored:
          defaultLongBreakDurationStored ?? this.defaultLongBreakDurationStored,
      overlapPercentageCDM: overlapPercentageCDM ?? this.overlapPercentageCDM,
      atWillStart: atWillStart ?? this.atWillStart,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (windowOnTop.present) {
      map['window_on_top'] = Variable<bool>(windowOnTop.value);
    }
    if (defaultNumberOfSessionsPerRound.present) {
      map['default_number_of_sessions_per_round'] =
          Variable<int>(defaultNumberOfSessionsPerRound.value);
    }
    if (defaultBreakDurationStored.present) {
      map['default_break_duration_stored'] =
          Variable<int>(defaultBreakDurationStored.value);
    }
    if (defaultFocusDurationStored.present) {
      map['default_focus_duration_stored'] =
          Variable<int>(defaultFocusDurationStored.value);
    }
    if (defaultLongBreakDurationStored.present) {
      map['default_long_break_duration_stored'] =
          Variable<int>(defaultLongBreakDurationStored.value);
    }
    if (overlapPercentageCDM.present) {
      map['overlap_percentage_c_d_m'] =
          Variable<double>(overlapPercentageCDM.value);
    }
    if (atWillStart.present) {
      map['at_will_start'] = Variable<bool>(atWillStart.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsVariablesCompanion(')
          ..write('id: $id, ')
          ..write('windowOnTop: $windowOnTop, ')
          ..write(
              'defaultNumberOfSessionsPerRound: $defaultNumberOfSessionsPerRound, ')
          ..write('defaultBreakDurationStored: $defaultBreakDurationStored, ')
          ..write('defaultFocusDurationStored: $defaultFocusDurationStored, ')
          ..write(
              'defaultLongBreakDurationStored: $defaultLongBreakDurationStored, ')
          ..write('overlapPercentageCDM: $overlapPercentageCDM, ')
          ..write('atWillStart: $atWillStart, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _roundGoalMeta =
      const VerificationMeta('roundGoal');
  @override
  late final GeneratedColumn<int> roundGoal = GeneratedColumn<int>(
      'round_goal', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _roundIdMeta =
      const VerificationMeta('roundId');
  @override
  late final GeneratedColumn<String> roundId = GeneratedColumn<String>(
      'round_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      roundGoal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}round_goal'])!,
      roundId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}round_id'])!,
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
          .read(DriftSqlType.string, data['${effectivePrefix}subject']),
    );
  }

  @override
  $MemoryCountdownVariableTable createAlias(String alias) {
    return $MemoryCountdownVariableTable(attachedDatabase, alias);
  }
}

class MemoryCountdownVariableData extends DataClass
    implements Insertable<MemoryCountdownVariableData> {
  final String id;
  final int roundGoal;
  final String roundId;
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
  final String? subject;
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
    map['id'] = Variable<String>(id);
    map['round_goal'] = Variable<int>(roundGoal);
    map['round_id'] = Variable<String>(roundId);
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
      map['subject'] = Variable<String>(subject);
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
      id: serializer.fromJson<String>(json['id']),
      roundGoal: serializer.fromJson<int>(json['roundGoal']),
      roundId: serializer.fromJson<String>(json['roundId']),
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
      subject: serializer.fromJson<String?>(json['subject']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roundGoal': serializer.toJson<int>(roundGoal),
      'roundId': serializer.toJson<String>(roundId),
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
      'subject': serializer.toJson<String?>(subject),
    };
  }

  MemoryCountdownVariableData copyWith(
          {String? id,
          int? roundGoal,
          String? roundId,
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
          Value<String?> subject = const Value.absent()}) =>
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
  final Value<String> id;
  final Value<int> roundGoal;
  final Value<String> roundId;
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
  final Value<String?> subject;
  final Value<int> rowid;
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
    this.rowid = const Value.absent(),
  });
  MemoryCountdownVariableCompanion.insert({
    this.id = const Value.absent(),
    required int roundGoal,
    required String roundId,
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
    this.rowid = const Value.absent(),
  })  : roundGoal = Value(roundGoal),
        roundId = Value(roundId),
        roundRunTime = Value(roundRunTime),
        plannedDuration = Value(plannedDuration),
        expStartingTime = Value(expStartingTime),
        type = Value(type);
  static Insertable<MemoryCountdownVariableData> custom({
    Expression<String>? id,
    Expression<int>? roundGoal,
    Expression<String>? roundId,
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
    Expression<String>? subject,
    Expression<int>? rowid,
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
      if (rowid != null) 'rowid': rowid,
    });
  }

  MemoryCountdownVariableCompanion copyWith(
      {Value<String>? id,
      Value<int>? roundGoal,
      Value<String>? roundId,
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
      Value<String?>? subject,
      Value<int>? rowid}) {
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
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roundGoal.present) {
      map['round_goal'] = Variable<int>(roundGoal.value);
    }
    if (roundId.present) {
      map['round_id'] = Variable<String>(roundId.value);
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
      map['subject'] = Variable<String>(subject.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('subject: $subject, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
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
  final String id;
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
    map['id'] = Variable<String>(id);
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
      id: serializer.fromJson<String>(json['id']),
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
      'id': serializer.toJson<String>(id),
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
          {String? id,
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
  final Value<String> id;
  final Value<bool> completed;
  final Value<String?> propableCause;
  final Value<int> plannedDuration;
  final Value<int?> actuallyDoneDuration;
  final Value<DateTime> startingTime;
  final Value<DateTime?> expFinishTime;
  final Value<DateTime?> finishTime;
  final Value<int> rowid;
  const RoundVariableCompanion({
    this.id = const Value.absent(),
    this.completed = const Value.absent(),
    this.propableCause = const Value.absent(),
    this.plannedDuration = const Value.absent(),
    this.actuallyDoneDuration = const Value.absent(),
    this.startingTime = const Value.absent(),
    this.expFinishTime = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.rowid = const Value.absent(),
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
    this.rowid = const Value.absent(),
  })  : plannedDuration = Value(plannedDuration),
        startingTime = Value(startingTime);
  static Insertable<RoundVariableData> custom({
    Expression<String>? id,
    Expression<bool>? completed,
    Expression<String>? propableCause,
    Expression<int>? plannedDuration,
    Expression<int>? actuallyDoneDuration,
    Expression<DateTime>? startingTime,
    Expression<DateTime>? expFinishTime,
    Expression<DateTime>? finishTime,
    Expression<int>? rowid,
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
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoundVariableCompanion copyWith(
      {Value<String>? id,
      Value<bool>? completed,
      Value<String?>? propableCause,
      Value<int>? plannedDuration,
      Value<int?>? actuallyDoneDuration,
      Value<DateTime>? startingTime,
      Value<DateTime?>? expFinishTime,
      Value<DateTime?>? finishTime,
      Value<int>? rowid}) {
    return RoundVariableCompanion(
      id: id ?? this.id,
      completed: completed ?? this.completed,
      propableCause: propableCause ?? this.propableCause,
      plannedDuration: plannedDuration ?? this.plannedDuration,
      actuallyDoneDuration: actuallyDoneDuration ?? this.actuallyDoneDuration,
      startingTime: startingTime ?? this.startingTime,
      expFinishTime: expFinishTime ?? this.expFinishTime,
      finishTime: finishTime ?? this.finishTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
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
  late final GeneratedColumn<String> superSubjectID = GeneratedColumn<String>(
      'super_subject_i_d', aliasedName, true,
      type: DriftSqlType.string,
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
  static const VerificationMeta _sessionsMeta =
      const VerificationMeta('sessions');
  @override
  late final GeneratedColumn<int> sessions = GeneratedColumn<int>(
      'sessions', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
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
  late final GeneratedColumn<String> lastFocuzdOnSessionID =
      GeneratedColumn<String>('last_focuzd_on_session_i_d', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES memory_countdown_variable (id)'));
  static const VerificationMeta _linkSubMeta =
      const VerificationMeta('linkSub');
  @override
  late final GeneratedColumn<String> linkSub = GeneratedColumn<String>(
      'link_sub', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES subject(id)');
  static const VerificationMeta _totalTimeSpentMeta =
      const VerificationMeta('totalTimeSpent');
  @override
  late final GeneratedColumn<int> totalTimeSpent = GeneratedColumn<int>(
      'total_time_spent', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _optinalFocusTimeMeta =
      const VerificationMeta('optinalFocusTime');
  @override
  late final GeneratedColumn<int> optinalFocusTime = GeneratedColumn<int>(
      'optinal_focus_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _optinalBreakTimeMeta =
      const VerificationMeta('optinalBreakTime');
  @override
  late final GeneratedColumn<int> optinalBreakTime = GeneratedColumn<int>(
      'optinal_break_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        address,
        superSubjectID,
        createdAt,
        updatedAt,
        sessions,
        subSubjects,
        lastFocuzdOnSessionID,
        linkSub,
        totalTimeSpent,
        optinalFocusTime,
        optinalBreakTime
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
    if (data.containsKey('sessions')) {
      context.handle(_sessionsMeta,
          sessions.isAcceptableOrUnknown(data['sessions']!, _sessionsMeta));
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
    if (data.containsKey('link_sub')) {
      context.handle(_linkSubMeta,
          linkSub.isAcceptableOrUnknown(data['link_sub']!, _linkSubMeta));
    }
    if (data.containsKey('total_time_spent')) {
      context.handle(
          _totalTimeSpentMeta,
          totalTimeSpent.isAcceptableOrUnknown(
              data['total_time_spent']!, _totalTimeSpentMeta));
    }
    if (data.containsKey('optinal_focus_time')) {
      context.handle(
          _optinalFocusTimeMeta,
          optinalFocusTime.isAcceptableOrUnknown(
              data['optinal_focus_time']!, _optinalFocusTimeMeta));
    }
    if (data.containsKey('optinal_break_time')) {
      context.handle(
          _optinalBreakTimeMeta,
          optinalBreakTime.isAcceptableOrUnknown(
              data['optinal_break_time']!, _optinalBreakTimeMeta));
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      superSubjectID: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}super_subject_i_d']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      sessions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sessions'])!,
      subSubjects: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sub_subjects'])!,
      lastFocuzdOnSessionID: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}last_focuzd_on_session_i_d']),
      linkSub: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link_sub']),
      totalTimeSpent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_time_spent'])!,
      optinalFocusTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}optinal_focus_time']),
      optinalBreakTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}optinal_break_time']),
    );
  }

  @override
  $SubjectTable createAlias(String alias) {
    return $SubjectTable(attachedDatabase, alias);
  }
}

class SubjectData extends DataClass implements Insertable<SubjectData> {
  final String id;
  final String name;
  final String address;
  final String? superSubjectID;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int sessions;
  final int subSubjects;
  final String? lastFocuzdOnSessionID;
  final String? linkSub;
  final int totalTimeSpent;
  final int? optinalFocusTime;
  final int? optinalBreakTime;
  const SubjectData(
      {required this.id,
      required this.name,
      required this.address,
      this.superSubjectID,
      required this.createdAt,
      required this.updatedAt,
      required this.sessions,
      required this.subSubjects,
      this.lastFocuzdOnSessionID,
      this.linkSub,
      required this.totalTimeSpent,
      this.optinalFocusTime,
      this.optinalBreakTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    if (!nullToAbsent || superSubjectID != null) {
      map['super_subject_i_d'] = Variable<String>(superSubjectID);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sessions'] = Variable<int>(sessions);
    map['sub_subjects'] = Variable<int>(subSubjects);
    if (!nullToAbsent || lastFocuzdOnSessionID != null) {
      map['last_focuzd_on_session_i_d'] =
          Variable<String>(lastFocuzdOnSessionID);
    }
    if (!nullToAbsent || linkSub != null) {
      map['link_sub'] = Variable<String>(linkSub);
    }
    map['total_time_spent'] = Variable<int>(totalTimeSpent);
    if (!nullToAbsent || optinalFocusTime != null) {
      map['optinal_focus_time'] = Variable<int>(optinalFocusTime);
    }
    if (!nullToAbsent || optinalBreakTime != null) {
      map['optinal_break_time'] = Variable<int>(optinalBreakTime);
    }
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
      sessions: Value(sessions),
      subSubjects: Value(subSubjects),
      lastFocuzdOnSessionID: lastFocuzdOnSessionID == null && nullToAbsent
          ? const Value.absent()
          : Value(lastFocuzdOnSessionID),
      linkSub: linkSub == null && nullToAbsent
          ? const Value.absent()
          : Value(linkSub),
      totalTimeSpent: Value(totalTimeSpent),
      optinalFocusTime: optinalFocusTime == null && nullToAbsent
          ? const Value.absent()
          : Value(optinalFocusTime),
      optinalBreakTime: optinalBreakTime == null && nullToAbsent
          ? const Value.absent()
          : Value(optinalBreakTime),
    );
  }

  factory SubjectData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubjectData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      superSubjectID: serializer.fromJson<String?>(json['superSubjectID']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      sessions: serializer.fromJson<int>(json['sessions']),
      subSubjects: serializer.fromJson<int>(json['subSubjects']),
      lastFocuzdOnSessionID:
          serializer.fromJson<String?>(json['lastFocuzdOnSessionID']),
      linkSub: serializer.fromJson<String?>(json['linkSub']),
      totalTimeSpent: serializer.fromJson<int>(json['totalTimeSpent']),
      optinalFocusTime: serializer.fromJson<int?>(json['optinalFocusTime']),
      optinalBreakTime: serializer.fromJson<int?>(json['optinalBreakTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'superSubjectID': serializer.toJson<String?>(superSubjectID),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'sessions': serializer.toJson<int>(sessions),
      'subSubjects': serializer.toJson<int>(subSubjects),
      'lastFocuzdOnSessionID':
          serializer.toJson<String?>(lastFocuzdOnSessionID),
      'linkSub': serializer.toJson<String?>(linkSub),
      'totalTimeSpent': serializer.toJson<int>(totalTimeSpent),
      'optinalFocusTime': serializer.toJson<int?>(optinalFocusTime),
      'optinalBreakTime': serializer.toJson<int?>(optinalBreakTime),
    };
  }

  SubjectData copyWith(
          {String? id,
          String? name,
          String? address,
          Value<String?> superSubjectID = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          int? sessions,
          int? subSubjects,
          Value<String?> lastFocuzdOnSessionID = const Value.absent(),
          Value<String?> linkSub = const Value.absent(),
          int? totalTimeSpent,
          Value<int?> optinalFocusTime = const Value.absent(),
          Value<int?> optinalBreakTime = const Value.absent()}) =>
      SubjectData(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        superSubjectID:
            superSubjectID.present ? superSubjectID.value : this.superSubjectID,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        sessions: sessions ?? this.sessions,
        subSubjects: subSubjects ?? this.subSubjects,
        lastFocuzdOnSessionID: lastFocuzdOnSessionID.present
            ? lastFocuzdOnSessionID.value
            : this.lastFocuzdOnSessionID,
        linkSub: linkSub.present ? linkSub.value : this.linkSub,
        totalTimeSpent: totalTimeSpent ?? this.totalTimeSpent,
        optinalFocusTime: optinalFocusTime.present
            ? optinalFocusTime.value
            : this.optinalFocusTime,
        optinalBreakTime: optinalBreakTime.present
            ? optinalBreakTime.value
            : this.optinalBreakTime,
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
      sessions: data.sessions.present ? data.sessions.value : this.sessions,
      subSubjects:
          data.subSubjects.present ? data.subSubjects.value : this.subSubjects,
      lastFocuzdOnSessionID: data.lastFocuzdOnSessionID.present
          ? data.lastFocuzdOnSessionID.value
          : this.lastFocuzdOnSessionID,
      linkSub: data.linkSub.present ? data.linkSub.value : this.linkSub,
      totalTimeSpent: data.totalTimeSpent.present
          ? data.totalTimeSpent.value
          : this.totalTimeSpent,
      optinalFocusTime: data.optinalFocusTime.present
          ? data.optinalFocusTime.value
          : this.optinalFocusTime,
      optinalBreakTime: data.optinalBreakTime.present
          ? data.optinalBreakTime.value
          : this.optinalBreakTime,
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
          ..write('sessions: $sessions, ')
          ..write('subSubjects: $subSubjects, ')
          ..write('lastFocuzdOnSessionID: $lastFocuzdOnSessionID, ')
          ..write('linkSub: $linkSub, ')
          ..write('totalTimeSpent: $totalTimeSpent, ')
          ..write('optinalFocusTime: $optinalFocusTime, ')
          ..write('optinalBreakTime: $optinalBreakTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      address,
      superSubjectID,
      createdAt,
      updatedAt,
      sessions,
      subSubjects,
      lastFocuzdOnSessionID,
      linkSub,
      totalTimeSpent,
      optinalFocusTime,
      optinalBreakTime);
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
          other.sessions == this.sessions &&
          other.subSubjects == this.subSubjects &&
          other.lastFocuzdOnSessionID == this.lastFocuzdOnSessionID &&
          other.linkSub == this.linkSub &&
          other.totalTimeSpent == this.totalTimeSpent &&
          other.optinalFocusTime == this.optinalFocusTime &&
          other.optinalBreakTime == this.optinalBreakTime);
}

class SubjectCompanion extends UpdateCompanion<SubjectData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> address;
  final Value<String?> superSubjectID;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> sessions;
  final Value<int> subSubjects;
  final Value<String?> lastFocuzdOnSessionID;
  final Value<String?> linkSub;
  final Value<int> totalTimeSpent;
  final Value<int?> optinalFocusTime;
  final Value<int?> optinalBreakTime;
  final Value<int> rowid;
  const SubjectCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.superSubjectID = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.sessions = const Value.absent(),
    this.subSubjects = const Value.absent(),
    this.lastFocuzdOnSessionID = const Value.absent(),
    this.linkSub = const Value.absent(),
    this.totalTimeSpent = const Value.absent(),
    this.optinalFocusTime = const Value.absent(),
    this.optinalBreakTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubjectCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String address,
    this.superSubjectID = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.sessions = const Value.absent(),
    this.subSubjects = const Value.absent(),
    this.lastFocuzdOnSessionID = const Value.absent(),
    this.linkSub = const Value.absent(),
    this.totalTimeSpent = const Value.absent(),
    this.optinalFocusTime = const Value.absent(),
    this.optinalBreakTime = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        address = Value(address),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<SubjectData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? superSubjectID,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? sessions,
    Expression<int>? subSubjects,
    Expression<String>? lastFocuzdOnSessionID,
    Expression<String>? linkSub,
    Expression<int>? totalTimeSpent,
    Expression<int>? optinalFocusTime,
    Expression<int>? optinalBreakTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (superSubjectID != null) 'super_subject_i_d': superSubjectID,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (sessions != null) 'sessions': sessions,
      if (subSubjects != null) 'sub_subjects': subSubjects,
      if (lastFocuzdOnSessionID != null)
        'last_focuzd_on_session_i_d': lastFocuzdOnSessionID,
      if (linkSub != null) 'link_sub': linkSub,
      if (totalTimeSpent != null) 'total_time_spent': totalTimeSpent,
      if (optinalFocusTime != null) 'optinal_focus_time': optinalFocusTime,
      if (optinalBreakTime != null) 'optinal_break_time': optinalBreakTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubjectCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? address,
      Value<String?>? superSubjectID,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? sessions,
      Value<int>? subSubjects,
      Value<String?>? lastFocuzdOnSessionID,
      Value<String?>? linkSub,
      Value<int>? totalTimeSpent,
      Value<int?>? optinalFocusTime,
      Value<int?>? optinalBreakTime,
      Value<int>? rowid}) {
    return SubjectCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      superSubjectID: superSubjectID ?? this.superSubjectID,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      sessions: sessions ?? this.sessions,
      subSubjects: subSubjects ?? this.subSubjects,
      lastFocuzdOnSessionID:
          lastFocuzdOnSessionID ?? this.lastFocuzdOnSessionID,
      linkSub: linkSub ?? this.linkSub,
      totalTimeSpent: totalTimeSpent ?? this.totalTimeSpent,
      optinalFocusTime: optinalFocusTime ?? this.optinalFocusTime,
      optinalBreakTime: optinalBreakTime ?? this.optinalBreakTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (superSubjectID.present) {
      map['super_subject_i_d'] = Variable<String>(superSubjectID.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (sessions.present) {
      map['sessions'] = Variable<int>(sessions.value);
    }
    if (subSubjects.present) {
      map['sub_subjects'] = Variable<int>(subSubjects.value);
    }
    if (lastFocuzdOnSessionID.present) {
      map['last_focuzd_on_session_i_d'] =
          Variable<String>(lastFocuzdOnSessionID.value);
    }
    if (linkSub.present) {
      map['link_sub'] = Variable<String>(linkSub.value);
    }
    if (totalTimeSpent.present) {
      map['total_time_spent'] = Variable<int>(totalTimeSpent.value);
    }
    if (optinalFocusTime.present) {
      map['optinal_focus_time'] = Variable<int>(optinalFocusTime.value);
    }
    if (optinalBreakTime.present) {
      map['optinal_break_time'] = Variable<int>(optinalBreakTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('sessions: $sessions, ')
          ..write('subSubjects: $subSubjects, ')
          ..write('lastFocuzdOnSessionID: $lastFocuzdOnSessionID, ')
          ..write('linkSub: $linkSub, ')
          ..write('totalTimeSpent: $totalTimeSpent, ')
          ..write('optinalFocusTime: $optinalFocusTime, ')
          ..write('optinalBreakTime: $optinalBreakTime, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _memoryCountdownIDMeta =
      const VerificationMeta('memoryCountdownID');
  @override
  late final GeneratedColumn<String> memoryCountdownID =
      GeneratedColumn<String>('memory_countdown_i_d', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      memoryCountdownID: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}memory_countdown_i_d'])!,
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
  final String id;
  final String memoryCountdownID;
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
    map['id'] = Variable<String>(id);
    map['memory_countdown_i_d'] = Variable<String>(memoryCountdownID);
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
      id: serializer.fromJson<String>(json['id']),
      memoryCountdownID: serializer.fromJson<String>(json['memoryCountdownID']),
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
      'id': serializer.toJson<String>(id),
      'memoryCountdownID': serializer.toJson<String>(memoryCountdownID),
      'startingTime': serializer.toJson<DateTime?>(startingTime),
      'finishTime': serializer.toJson<DateTime?>(finishTime),
      'duration': serializer.toJson<int?>(duration),
      'type': serializer.toJson<String?>(type),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  OutPlanningVariableData copyWith(
          {String? id,
          String? memoryCountdownID,
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
  final Value<String> id;
  final Value<String> memoryCountdownID;
  final Value<DateTime?> startingTime;
  final Value<DateTime?> finishTime;
  final Value<int?> duration;
  final Value<String?> type;
  final Value<bool> isActive;
  final Value<int> rowid;
  const OutPlanningVariableCompanion({
    this.id = const Value.absent(),
    this.memoryCountdownID = const Value.absent(),
    this.startingTime = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.duration = const Value.absent(),
    this.type = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OutPlanningVariableCompanion.insert({
    this.id = const Value.absent(),
    required String memoryCountdownID,
    this.startingTime = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.duration = const Value.absent(),
    this.type = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : memoryCountdownID = Value(memoryCountdownID);
  static Insertable<OutPlanningVariableData> custom({
    Expression<String>? id,
    Expression<String>? memoryCountdownID,
    Expression<DateTime>? startingTime,
    Expression<DateTime>? finishTime,
    Expression<int>? duration,
    Expression<String>? type,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memoryCountdownID != null) 'memory_countdown_i_d': memoryCountdownID,
      if (startingTime != null) 'starting_time': startingTime,
      if (finishTime != null) 'finish_time': finishTime,
      if (duration != null) 'duration': duration,
      if (type != null) 'type': type,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OutPlanningVariableCompanion copyWith(
      {Value<String>? id,
      Value<String>? memoryCountdownID,
      Value<DateTime?>? startingTime,
      Value<DateTime?>? finishTime,
      Value<int?>? duration,
      Value<String?>? type,
      Value<bool>? isActive,
      Value<int>? rowid}) {
    return OutPlanningVariableCompanion(
      id: id ?? this.id,
      memoryCountdownID: memoryCountdownID ?? this.memoryCountdownID,
      startingTime: startingTime ?? this.startingTime,
      finishTime: finishTime ?? this.finishTime,
      duration: duration ?? this.duration,
      type: type ?? this.type,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (memoryCountdownID.present) {
      map['memory_countdown_i_d'] = Variable<String>(memoryCountdownID.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
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
  static const VerificationMeta _expiredMeta =
      const VerificationMeta('expired');
  @override
  late final GeneratedColumn<bool> expired = GeneratedColumn<bool>(
      'expired', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("expired" IN (0, 1))'),
      defaultValue: const Constant(false));
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
      'real_ratio', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _xSessionsRMeta =
      const VerificationMeta('xSessionsR');
  @override
  late final GeneratedColumn<int> xSessionsR = GeneratedColumn<int>(
      'x_sessions_r', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _subjectIdZMeta =
      const VerificationMeta('subjectIdZ');
  @override
  late final GeneratedColumn<String> subjectIdZ = GeneratedColumn<String>(
      'subject_id_z', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _subjectZNominatorMeta =
      const VerificationMeta('subjectZNominator');
  @override
  late final GeneratedColumn<int> subjectZNominator = GeneratedColumn<int>(
      'subject_z_nominator', aliasedName, true,
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
  late final GeneratedColumn<String> subjectIdF = GeneratedColumn<String>(
      'subject_id_f', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _subjectFDenominatorMeta =
      const VerificationMeta('subjectFDenominator');
  @override
  late final GeneratedColumn<double> subjectFDenominator =
      GeneratedColumn<double>('subject_f_denominator', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
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
        expired,
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
        subjectZNominator,
        xSessionsZ,
        subjectIdF,
        subjectFDenominator,
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
    if (data.containsKey('expired')) {
      context.handle(_expiredMeta,
          expired.isAcceptableOrUnknown(data['expired']!, _expiredMeta));
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
    if (data.containsKey('subject_z_nominator')) {
      context.handle(
          _subjectZNominatorMeta,
          subjectZNominator.isAcceptableOrUnknown(
              data['subject_z_nominator']!, _subjectZNominatorMeta));
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
    if (data.containsKey('subject_f_denominator')) {
      context.handle(
          _subjectFDenominatorMeta,
          subjectFDenominator.isAcceptableOrUnknown(
              data['subject_f_denominator']!, _subjectFDenominatorMeta));
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      codeName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code_name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      expired: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}expired'])!,
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
          .read(DriftSqlType.double, data['${effectivePrefix}real_ratio'])!,
      xSessionsR: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}x_sessions_r']),
      subjectIdZ: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject_id_z']),
      subjectZNominator: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}subject_z_nominator']),
      xSessionsZ: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}x_sessions_z']),
      subjectIdF: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject_id_f']),
      subjectFDenominator: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}subject_f_denominator']),
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
  final String id;
  final String codeName;
  final int type;
  final bool expired;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? startPeriod1;
  final DateTime? endPeriod1;
  final DateTime startPeriod2;
  final DateTime endPeriod2;
  final int? xSessionsGoal;
  final int? ySessionsDone;
  final double? plannedRatio;
  final double realRatio;
  final int? xSessionsR;
  final String? subjectIdZ;
  final int? subjectZNominator;
  final int? xSessionsZ;
  final String? subjectIdF;
  final double? subjectFDenominator;
  final int? xSessionsF;
  final double successPercentage;
  const GoalData(
      {required this.id,
      required this.codeName,
      required this.type,
      required this.expired,
      required this.createdAt,
      required this.updatedAt,
      this.startPeriod1,
      this.endPeriod1,
      required this.startPeriod2,
      required this.endPeriod2,
      this.xSessionsGoal,
      this.ySessionsDone,
      this.plannedRatio,
      required this.realRatio,
      this.xSessionsR,
      this.subjectIdZ,
      this.subjectZNominator,
      this.xSessionsZ,
      this.subjectIdF,
      this.subjectFDenominator,
      this.xSessionsF,
      required this.successPercentage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code_name'] = Variable<String>(codeName);
    map['type'] = Variable<int>(type);
    map['expired'] = Variable<bool>(expired);
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
    map['real_ratio'] = Variable<double>(realRatio);
    if (!nullToAbsent || xSessionsR != null) {
      map['x_sessions_r'] = Variable<int>(xSessionsR);
    }
    if (!nullToAbsent || subjectIdZ != null) {
      map['subject_id_z'] = Variable<String>(subjectIdZ);
    }
    if (!nullToAbsent || subjectZNominator != null) {
      map['subject_z_nominator'] = Variable<int>(subjectZNominator);
    }
    if (!nullToAbsent || xSessionsZ != null) {
      map['x_sessions_z'] = Variable<int>(xSessionsZ);
    }
    if (!nullToAbsent || subjectIdF != null) {
      map['subject_id_f'] = Variable<String>(subjectIdF);
    }
    if (!nullToAbsent || subjectFDenominator != null) {
      map['subject_f_denominator'] = Variable<double>(subjectFDenominator);
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
      expired: Value(expired),
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
      realRatio: Value(realRatio),
      xSessionsR: xSessionsR == null && nullToAbsent
          ? const Value.absent()
          : Value(xSessionsR),
      subjectIdZ: subjectIdZ == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectIdZ),
      subjectZNominator: subjectZNominator == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectZNominator),
      xSessionsZ: xSessionsZ == null && nullToAbsent
          ? const Value.absent()
          : Value(xSessionsZ),
      subjectIdF: subjectIdF == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectIdF),
      subjectFDenominator: subjectFDenominator == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectFDenominator),
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
      id: serializer.fromJson<String>(json['id']),
      codeName: serializer.fromJson<String>(json['codeName']),
      type: serializer.fromJson<int>(json['type']),
      expired: serializer.fromJson<bool>(json['expired']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      startPeriod1: serializer.fromJson<DateTime?>(json['startPeriod1']),
      endPeriod1: serializer.fromJson<DateTime?>(json['endPeriod1']),
      startPeriod2: serializer.fromJson<DateTime>(json['startPeriod2']),
      endPeriod2: serializer.fromJson<DateTime>(json['endPeriod2']),
      xSessionsGoal: serializer.fromJson<int?>(json['xSessionsGoal']),
      ySessionsDone: serializer.fromJson<int?>(json['ySessionsDone']),
      plannedRatio: serializer.fromJson<double?>(json['plannedRatio']),
      realRatio: serializer.fromJson<double>(json['realRatio']),
      xSessionsR: serializer.fromJson<int?>(json['xSessionsR']),
      subjectIdZ: serializer.fromJson<String?>(json['subjectIdZ']),
      subjectZNominator: serializer.fromJson<int?>(json['subjectZNominator']),
      xSessionsZ: serializer.fromJson<int?>(json['xSessionsZ']),
      subjectIdF: serializer.fromJson<String?>(json['subjectIdF']),
      subjectFDenominator:
          serializer.fromJson<double?>(json['subjectFDenominator']),
      xSessionsF: serializer.fromJson<int?>(json['xSessionsF']),
      successPercentage: serializer.fromJson<double>(json['successPercentage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'codeName': serializer.toJson<String>(codeName),
      'type': serializer.toJson<int>(type),
      'expired': serializer.toJson<bool>(expired),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'startPeriod1': serializer.toJson<DateTime?>(startPeriod1),
      'endPeriod1': serializer.toJson<DateTime?>(endPeriod1),
      'startPeriod2': serializer.toJson<DateTime>(startPeriod2),
      'endPeriod2': serializer.toJson<DateTime>(endPeriod2),
      'xSessionsGoal': serializer.toJson<int?>(xSessionsGoal),
      'ySessionsDone': serializer.toJson<int?>(ySessionsDone),
      'plannedRatio': serializer.toJson<double?>(plannedRatio),
      'realRatio': serializer.toJson<double>(realRatio),
      'xSessionsR': serializer.toJson<int?>(xSessionsR),
      'subjectIdZ': serializer.toJson<String?>(subjectIdZ),
      'subjectZNominator': serializer.toJson<int?>(subjectZNominator),
      'xSessionsZ': serializer.toJson<int?>(xSessionsZ),
      'subjectIdF': serializer.toJson<String?>(subjectIdF),
      'subjectFDenominator': serializer.toJson<double?>(subjectFDenominator),
      'xSessionsF': serializer.toJson<int?>(xSessionsF),
      'successPercentage': serializer.toJson<double>(successPercentage),
    };
  }

  GoalData copyWith(
          {String? id,
          String? codeName,
          int? type,
          bool? expired,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> startPeriod1 = const Value.absent(),
          Value<DateTime?> endPeriod1 = const Value.absent(),
          DateTime? startPeriod2,
          DateTime? endPeriod2,
          Value<int?> xSessionsGoal = const Value.absent(),
          Value<int?> ySessionsDone = const Value.absent(),
          Value<double?> plannedRatio = const Value.absent(),
          double? realRatio,
          Value<int?> xSessionsR = const Value.absent(),
          Value<String?> subjectIdZ = const Value.absent(),
          Value<int?> subjectZNominator = const Value.absent(),
          Value<int?> xSessionsZ = const Value.absent(),
          Value<String?> subjectIdF = const Value.absent(),
          Value<double?> subjectFDenominator = const Value.absent(),
          Value<int?> xSessionsF = const Value.absent(),
          double? successPercentage}) =>
      GoalData(
        id: id ?? this.id,
        codeName: codeName ?? this.codeName,
        type: type ?? this.type,
        expired: expired ?? this.expired,
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
        realRatio: realRatio ?? this.realRatio,
        xSessionsR: xSessionsR.present ? xSessionsR.value : this.xSessionsR,
        subjectIdZ: subjectIdZ.present ? subjectIdZ.value : this.subjectIdZ,
        subjectZNominator: subjectZNominator.present
            ? subjectZNominator.value
            : this.subjectZNominator,
        xSessionsZ: xSessionsZ.present ? xSessionsZ.value : this.xSessionsZ,
        subjectIdF: subjectIdF.present ? subjectIdF.value : this.subjectIdF,
        subjectFDenominator: subjectFDenominator.present
            ? subjectFDenominator.value
            : this.subjectFDenominator,
        xSessionsF: xSessionsF.present ? xSessionsF.value : this.xSessionsF,
        successPercentage: successPercentage ?? this.successPercentage,
      );
  GoalData copyWithCompanion(GoalCompanion data) {
    return GoalData(
      id: data.id.present ? data.id.value : this.id,
      codeName: data.codeName.present ? data.codeName.value : this.codeName,
      type: data.type.present ? data.type.value : this.type,
      expired: data.expired.present ? data.expired.value : this.expired,
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
      subjectZNominator: data.subjectZNominator.present
          ? data.subjectZNominator.value
          : this.subjectZNominator,
      xSessionsZ:
          data.xSessionsZ.present ? data.xSessionsZ.value : this.xSessionsZ,
      subjectIdF:
          data.subjectIdF.present ? data.subjectIdF.value : this.subjectIdF,
      subjectFDenominator: data.subjectFDenominator.present
          ? data.subjectFDenominator.value
          : this.subjectFDenominator,
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
          ..write('expired: $expired, ')
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
          ..write('subjectZNominator: $subjectZNominator, ')
          ..write('xSessionsZ: $xSessionsZ, ')
          ..write('subjectIdF: $subjectIdF, ')
          ..write('subjectFDenominator: $subjectFDenominator, ')
          ..write('xSessionsF: $xSessionsF, ')
          ..write('successPercentage: $successPercentage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        codeName,
        type,
        expired,
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
        subjectZNominator,
        xSessionsZ,
        subjectIdF,
        subjectFDenominator,
        xSessionsF,
        successPercentage
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalData &&
          other.id == this.id &&
          other.codeName == this.codeName &&
          other.type == this.type &&
          other.expired == this.expired &&
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
          other.subjectZNominator == this.subjectZNominator &&
          other.xSessionsZ == this.xSessionsZ &&
          other.subjectIdF == this.subjectIdF &&
          other.subjectFDenominator == this.subjectFDenominator &&
          other.xSessionsF == this.xSessionsF &&
          other.successPercentage == this.successPercentage);
}

class GoalCompanion extends UpdateCompanion<GoalData> {
  final Value<String> id;
  final Value<String> codeName;
  final Value<int> type;
  final Value<bool> expired;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> startPeriod1;
  final Value<DateTime?> endPeriod1;
  final Value<DateTime> startPeriod2;
  final Value<DateTime> endPeriod2;
  final Value<int?> xSessionsGoal;
  final Value<int?> ySessionsDone;
  final Value<double?> plannedRatio;
  final Value<double> realRatio;
  final Value<int?> xSessionsR;
  final Value<String?> subjectIdZ;
  final Value<int?> subjectZNominator;
  final Value<int?> xSessionsZ;
  final Value<String?> subjectIdF;
  final Value<double?> subjectFDenominator;
  final Value<int?> xSessionsF;
  final Value<double> successPercentage;
  final Value<int> rowid;
  const GoalCompanion({
    this.id = const Value.absent(),
    this.codeName = const Value.absent(),
    this.type = const Value.absent(),
    this.expired = const Value.absent(),
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
    this.subjectZNominator = const Value.absent(),
    this.xSessionsZ = const Value.absent(),
    this.subjectIdF = const Value.absent(),
    this.subjectFDenominator = const Value.absent(),
    this.xSessionsF = const Value.absent(),
    this.successPercentage = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalCompanion.insert({
    this.id = const Value.absent(),
    required String codeName,
    required int type,
    this.expired = const Value.absent(),
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
    this.subjectZNominator = const Value.absent(),
    this.xSessionsZ = const Value.absent(),
    this.subjectIdF = const Value.absent(),
    this.subjectFDenominator = const Value.absent(),
    this.xSessionsF = const Value.absent(),
    this.successPercentage = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : codeName = Value(codeName),
        type = Value(type),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        startPeriod2 = Value(startPeriod2),
        endPeriod2 = Value(endPeriod2);
  static Insertable<GoalData> custom({
    Expression<String>? id,
    Expression<String>? codeName,
    Expression<int>? type,
    Expression<bool>? expired,
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
    Expression<String>? subjectIdZ,
    Expression<int>? subjectZNominator,
    Expression<int>? xSessionsZ,
    Expression<String>? subjectIdF,
    Expression<double>? subjectFDenominator,
    Expression<int>? xSessionsF,
    Expression<double>? successPercentage,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (codeName != null) 'code_name': codeName,
      if (type != null) 'type': type,
      if (expired != null) 'expired': expired,
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
      if (subjectZNominator != null) 'subject_z_nominator': subjectZNominator,
      if (xSessionsZ != null) 'x_sessions_z': xSessionsZ,
      if (subjectIdF != null) 'subject_id_f': subjectIdF,
      if (subjectFDenominator != null)
        'subject_f_denominator': subjectFDenominator,
      if (xSessionsF != null) 'x_sessions_f': xSessionsF,
      if (successPercentage != null) 'success_percentage': successPercentage,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalCompanion copyWith(
      {Value<String>? id,
      Value<String>? codeName,
      Value<int>? type,
      Value<bool>? expired,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? startPeriod1,
      Value<DateTime?>? endPeriod1,
      Value<DateTime>? startPeriod2,
      Value<DateTime>? endPeriod2,
      Value<int?>? xSessionsGoal,
      Value<int?>? ySessionsDone,
      Value<double?>? plannedRatio,
      Value<double>? realRatio,
      Value<int?>? xSessionsR,
      Value<String?>? subjectIdZ,
      Value<int?>? subjectZNominator,
      Value<int?>? xSessionsZ,
      Value<String?>? subjectIdF,
      Value<double?>? subjectFDenominator,
      Value<int?>? xSessionsF,
      Value<double>? successPercentage,
      Value<int>? rowid}) {
    return GoalCompanion(
      id: id ?? this.id,
      codeName: codeName ?? this.codeName,
      type: type ?? this.type,
      expired: expired ?? this.expired,
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
      subjectZNominator: subjectZNominator ?? this.subjectZNominator,
      xSessionsZ: xSessionsZ ?? this.xSessionsZ,
      subjectIdF: subjectIdF ?? this.subjectIdF,
      subjectFDenominator: subjectFDenominator ?? this.subjectFDenominator,
      xSessionsF: xSessionsF ?? this.xSessionsF,
      successPercentage: successPercentage ?? this.successPercentage,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (codeName.present) {
      map['code_name'] = Variable<String>(codeName.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (expired.present) {
      map['expired'] = Variable<bool>(expired.value);
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
      map['subject_id_z'] = Variable<String>(subjectIdZ.value);
    }
    if (subjectZNominator.present) {
      map['subject_z_nominator'] = Variable<int>(subjectZNominator.value);
    }
    if (xSessionsZ.present) {
      map['x_sessions_z'] = Variable<int>(xSessionsZ.value);
    }
    if (subjectIdF.present) {
      map['subject_id_f'] = Variable<String>(subjectIdF.value);
    }
    if (subjectFDenominator.present) {
      map['subject_f_denominator'] =
          Variable<double>(subjectFDenominator.value);
    }
    if (xSessionsF.present) {
      map['x_sessions_f'] = Variable<int>(xSessionsF.value);
    }
    if (successPercentage.present) {
      map['success_percentage'] = Variable<double>(successPercentage.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalCompanion(')
          ..write('id: $id, ')
          ..write('codeName: $codeName, ')
          ..write('type: $type, ')
          ..write('expired: $expired, ')
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
          ..write('subjectZNominator: $subjectZNominator, ')
          ..write('xSessionsZ: $xSessionsZ, ')
          ..write('subjectIdF: $subjectIdF, ')
          ..write('subjectFDenominator: $subjectFDenominator, ')
          ..write('xSessionsF: $xSessionsF, ')
          ..write('successPercentage: $successPercentage, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalGroupTable extends GoalGroup
    with TableInfo<$GoalGroupTable, GoalGroupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalGroupTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _codeNameMeta =
      const VerificationMeta('codeName');
  @override
  late final GeneratedColumn<String> codeName = GeneratedColumn<String>(
      'code_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
  static const VerificationMeta _goalNumberMeta =
      const VerificationMeta('goalNumber');
  @override
  late final GeneratedColumn<int> goalNumber = GeneratedColumn<int>(
      'goal_number', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, codeName, createdAt, updatedAt, goalNumber];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goal_group';
  @override
  VerificationContext validateIntegrity(Insertable<GoalGroupData> instance,
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
    if (data.containsKey('goal_number')) {
      context.handle(
          _goalNumberMeta,
          goalNumber.isAcceptableOrUnknown(
              data['goal_number']!, _goalNumberMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalGroupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalGroupData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      codeName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code_name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      goalNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}goal_number'])!,
    );
  }

  @override
  $GoalGroupTable createAlias(String alias) {
    return $GoalGroupTable(attachedDatabase, alias);
  }
}

class GoalGroupData extends DataClass implements Insertable<GoalGroupData> {
  final String id;
  final String codeName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int goalNumber;
  const GoalGroupData(
      {required this.id,
      required this.codeName,
      required this.createdAt,
      required this.updatedAt,
      required this.goalNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code_name'] = Variable<String>(codeName);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['goal_number'] = Variable<int>(goalNumber);
    return map;
  }

  GoalGroupCompanion toCompanion(bool nullToAbsent) {
    return GoalGroupCompanion(
      id: Value(id),
      codeName: Value(codeName),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      goalNumber: Value(goalNumber),
    );
  }

  factory GoalGroupData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalGroupData(
      id: serializer.fromJson<String>(json['id']),
      codeName: serializer.fromJson<String>(json['codeName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      goalNumber: serializer.fromJson<int>(json['goalNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'codeName': serializer.toJson<String>(codeName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'goalNumber': serializer.toJson<int>(goalNumber),
    };
  }

  GoalGroupData copyWith(
          {String? id,
          String? codeName,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? goalNumber}) =>
      GoalGroupData(
        id: id ?? this.id,
        codeName: codeName ?? this.codeName,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        goalNumber: goalNumber ?? this.goalNumber,
      );
  GoalGroupData copyWithCompanion(GoalGroupCompanion data) {
    return GoalGroupData(
      id: data.id.present ? data.id.value : this.id,
      codeName: data.codeName.present ? data.codeName.value : this.codeName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      goalNumber:
          data.goalNumber.present ? data.goalNumber.value : this.goalNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalGroupData(')
          ..write('id: $id, ')
          ..write('codeName: $codeName, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('goalNumber: $goalNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, codeName, createdAt, updatedAt, goalNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalGroupData &&
          other.id == this.id &&
          other.codeName == this.codeName &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.goalNumber == this.goalNumber);
}

class GoalGroupCompanion extends UpdateCompanion<GoalGroupData> {
  final Value<String> id;
  final Value<String> codeName;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> goalNumber;
  final Value<int> rowid;
  const GoalGroupCompanion({
    this.id = const Value.absent(),
    this.codeName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.goalNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalGroupCompanion.insert({
    this.id = const Value.absent(),
    required String codeName,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.goalNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : codeName = Value(codeName),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<GoalGroupData> custom({
    Expression<String>? id,
    Expression<String>? codeName,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? goalNumber,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (codeName != null) 'code_name': codeName,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (goalNumber != null) 'goal_number': goalNumber,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalGroupCompanion copyWith(
      {Value<String>? id,
      Value<String>? codeName,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? goalNumber,
      Value<int>? rowid}) {
    return GoalGroupCompanion(
      id: id ?? this.id,
      codeName: codeName ?? this.codeName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      goalNumber: goalNumber ?? this.goalNumber,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (codeName.present) {
      map['code_name'] = Variable<String>(codeName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (goalNumber.present) {
      map['goal_number'] = Variable<int>(goalNumber.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalGroupCompanion(')
          ..write('id: $id, ')
          ..write('codeName: $codeName, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('goalNumber: $goalNumber, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GroupLinkTable extends GroupLink
    with TableInfo<$GroupLinkTable, GroupLinkData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupLinkTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _groupIDMeta =
      const VerificationMeta('groupID');
  @override
  late final GeneratedColumn<String> groupID = GeneratedColumn<String>(
      'group_i_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _goalIDMeta = const VerificationMeta('goalID');
  @override
  late final GeneratedColumn<String> goalID = GeneratedColumn<String>(
      'goal_i_d', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES goal(id) NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, createdAt, groupID, goalID];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'group_link';
  @override
  VerificationContext validateIntegrity(Insertable<GroupLinkData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('group_i_d')) {
      context.handle(_groupIDMeta,
          groupID.isAcceptableOrUnknown(data['group_i_d']!, _groupIDMeta));
    } else if (isInserting) {
      context.missing(_groupIDMeta);
    }
    if (data.containsKey('goal_i_d')) {
      context.handle(_goalIDMeta,
          goalID.isAcceptableOrUnknown(data['goal_i_d']!, _goalIDMeta));
    } else if (isInserting) {
      context.missing(_goalIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GroupLinkData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupLinkData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      groupID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_i_d'])!,
      goalID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}goal_i_d'])!,
    );
  }

  @override
  $GroupLinkTable createAlias(String alias) {
    return $GroupLinkTable(attachedDatabase, alias);
  }
}

class GroupLinkData extends DataClass implements Insertable<GroupLinkData> {
  final String id;
  final DateTime createdAt;
  final String groupID;
  final String goalID;
  const GroupLinkData(
      {required this.id,
      required this.createdAt,
      required this.groupID,
      required this.goalID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['group_i_d'] = Variable<String>(groupID);
    map['goal_i_d'] = Variable<String>(goalID);
    return map;
  }

  GroupLinkCompanion toCompanion(bool nullToAbsent) {
    return GroupLinkCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      groupID: Value(groupID),
      goalID: Value(goalID),
    );
  }

  factory GroupLinkData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupLinkData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      groupID: serializer.fromJson<String>(json['groupID']),
      goalID: serializer.fromJson<String>(json['goalID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'groupID': serializer.toJson<String>(groupID),
      'goalID': serializer.toJson<String>(goalID),
    };
  }

  GroupLinkData copyWith(
          {String? id, DateTime? createdAt, String? groupID, String? goalID}) =>
      GroupLinkData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        groupID: groupID ?? this.groupID,
        goalID: goalID ?? this.goalID,
      );
  GroupLinkData copyWithCompanion(GroupLinkCompanion data) {
    return GroupLinkData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      groupID: data.groupID.present ? data.groupID.value : this.groupID,
      goalID: data.goalID.present ? data.goalID.value : this.goalID,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupLinkData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('groupID: $groupID, ')
          ..write('goalID: $goalID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, groupID, goalID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupLinkData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.groupID == this.groupID &&
          other.goalID == this.goalID);
}

class GroupLinkCompanion extends UpdateCompanion<GroupLinkData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<String> groupID;
  final Value<String> goalID;
  final Value<int> rowid;
  const GroupLinkCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.groupID = const Value.absent(),
    this.goalID = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupLinkCompanion.insert({
    this.id = const Value.absent(),
    required DateTime createdAt,
    required String groupID,
    required String goalID,
    this.rowid = const Value.absent(),
  })  : createdAt = Value(createdAt),
        groupID = Value(groupID),
        goalID = Value(goalID);
  static Insertable<GroupLinkData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? groupID,
    Expression<String>? goalID,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (groupID != null) 'group_i_d': groupID,
      if (goalID != null) 'goal_i_d': goalID,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupLinkCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<String>? groupID,
      Value<String>? goalID,
      Value<int>? rowid}) {
    return GroupLinkCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      groupID: groupID ?? this.groupID,
      goalID: goalID ?? this.goalID,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (groupID.present) {
      map['group_i_d'] = Variable<String>(groupID.value);
    }
    if (goalID.present) {
      map['goal_i_d'] = Variable<String>(goalID.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupLinkCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('groupID: $groupID, ')
          ..write('goalID: $goalID, ')
          ..write('rowid: $rowid')
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
  late final $GoalGroupTable goalGroup = $GoalGroupTable(this);
  late final $GroupLinkTable groupLink = $GroupLinkTable(this);
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
        goal,
        goalGroup,
        groupLink
      ];
}

typedef $$SettingsVariablesTableCreateCompanionBuilder
    = SettingsVariablesCompanion Function({
  Value<String> id,
  required bool windowOnTop,
  required int defaultNumberOfSessionsPerRound,
  required int defaultBreakDurationStored,
  required int defaultFocusDurationStored,
  required int defaultLongBreakDurationStored,
  Value<double> overlapPercentageCDM,
  Value<bool> atWillStart,
  Value<int> rowid,
});
typedef $$SettingsVariablesTableUpdateCompanionBuilder
    = SettingsVariablesCompanion Function({
  Value<String> id,
  Value<bool> windowOnTop,
  Value<int> defaultNumberOfSessionsPerRound,
  Value<int> defaultBreakDurationStored,
  Value<int> defaultFocusDurationStored,
  Value<int> defaultLongBreakDurationStored,
  Value<double> overlapPercentageCDM,
  Value<bool> atWillStart,
  Value<int> rowid,
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
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get windowOnTop => $composableBuilder(
      column: $table.windowOnTop, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get defaultNumberOfSessionsPerRound => $composableBuilder(
      column: $table.defaultNumberOfSessionsPerRound,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get defaultBreakDurationStored => $composableBuilder(
      column: $table.defaultBreakDurationStored,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get defaultFocusDurationStored => $composableBuilder(
      column: $table.defaultFocusDurationStored,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get defaultLongBreakDurationStored => $composableBuilder(
      column: $table.defaultLongBreakDurationStored,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get overlapPercentageCDM => $composableBuilder(
      column: $table.overlapPercentageCDM,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get atWillStart => $composableBuilder(
      column: $table.atWillStart, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get windowOnTop => $composableBuilder(
      column: $table.windowOnTop, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get defaultNumberOfSessionsPerRound =>
      $composableBuilder(
          column: $table.defaultNumberOfSessionsPerRound,
          builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get defaultBreakDurationStored => $composableBuilder(
      column: $table.defaultBreakDurationStored,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get defaultFocusDurationStored => $composableBuilder(
      column: $table.defaultFocusDurationStored,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get defaultLongBreakDurationStored => $composableBuilder(
      column: $table.defaultLongBreakDurationStored,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get overlapPercentageCDM => $composableBuilder(
      column: $table.overlapPercentageCDM,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get atWillStart => $composableBuilder(
      column: $table.atWillStart, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get windowOnTop => $composableBuilder(
      column: $table.windowOnTop, builder: (column) => column);

  GeneratedColumn<int> get defaultNumberOfSessionsPerRound =>
      $composableBuilder(
          column: $table.defaultNumberOfSessionsPerRound,
          builder: (column) => column);

  GeneratedColumn<int> get defaultBreakDurationStored => $composableBuilder(
      column: $table.defaultBreakDurationStored, builder: (column) => column);

  GeneratedColumn<int> get defaultFocusDurationStored => $composableBuilder(
      column: $table.defaultFocusDurationStored, builder: (column) => column);

  GeneratedColumn<int> get defaultLongBreakDurationStored => $composableBuilder(
      column: $table.defaultLongBreakDurationStored,
      builder: (column) => column);

  GeneratedColumn<double> get overlapPercentageCDM => $composableBuilder(
      column: $table.overlapPercentageCDM, builder: (column) => column);

  GeneratedColumn<bool> get atWillStart => $composableBuilder(
      column: $table.atWillStart, builder: (column) => column);
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
            Value<String> id = const Value.absent(),
            Value<bool> windowOnTop = const Value.absent(),
            Value<int> defaultNumberOfSessionsPerRound = const Value.absent(),
            Value<int> defaultBreakDurationStored = const Value.absent(),
            Value<int> defaultFocusDurationStored = const Value.absent(),
            Value<int> defaultLongBreakDurationStored = const Value.absent(),
            Value<double> overlapPercentageCDM = const Value.absent(),
            Value<bool> atWillStart = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsVariablesCompanion(
            id: id,
            windowOnTop: windowOnTop,
            defaultNumberOfSessionsPerRound: defaultNumberOfSessionsPerRound,
            defaultBreakDurationStored: defaultBreakDurationStored,
            defaultFocusDurationStored: defaultFocusDurationStored,
            defaultLongBreakDurationStored: defaultLongBreakDurationStored,
            overlapPercentageCDM: overlapPercentageCDM,
            atWillStart: atWillStart,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required bool windowOnTop,
            required int defaultNumberOfSessionsPerRound,
            required int defaultBreakDurationStored,
            required int defaultFocusDurationStored,
            required int defaultLongBreakDurationStored,
            Value<double> overlapPercentageCDM = const Value.absent(),
            Value<bool> atWillStart = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsVariablesCompanion.insert(
            id: id,
            windowOnTop: windowOnTop,
            defaultNumberOfSessionsPerRound: defaultNumberOfSessionsPerRound,
            defaultBreakDurationStored: defaultBreakDurationStored,
            defaultFocusDurationStored: defaultFocusDurationStored,
            defaultLongBreakDurationStored: defaultLongBreakDurationStored,
            overlapPercentageCDM: overlapPercentageCDM,
            atWillStart: atWillStart,
            rowid: rowid,
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
  Value<String> id,
  required int roundGoal,
  required String roundId,
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
  Value<String?> subject,
  Value<int> rowid,
});
typedef $$MemoryCountdownVariableTableUpdateCompanionBuilder
    = MemoryCountdownVariableCompanion Function({
  Value<String> id,
  Value<int> roundGoal,
  Value<String> roundId,
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
  Value<String?> subject,
  Value<int> rowid,
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
    final manager = $$SubjectTableTableManager($_db, $_db.subject).filter((f) =>
        f.lastFocuzdOnSessionID.id.sqlEquals($_itemColumn<String>('id')!));

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
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get roundGoal => $composableBuilder(
      column: $table.roundGoal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get roundId => $composableBuilder(
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

  ColumnFilters<String> get subject => $composableBuilder(
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
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get roundGoal => $composableBuilder(
      column: $table.roundGoal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get roundId => $composableBuilder(
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

  ColumnOrderings<String> get subject => $composableBuilder(
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
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get roundGoal =>
      $composableBuilder(column: $table.roundGoal, builder: (column) => column);

  GeneratedColumn<String> get roundId =>
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

  GeneratedColumn<String> get subject =>
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
            Value<String> id = const Value.absent(),
            Value<int> roundGoal = const Value.absent(),
            Value<String> roundId = const Value.absent(),
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
            Value<String?> subject = const Value.absent(),
            Value<int> rowid = const Value.absent(),
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
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required int roundGoal,
            required String roundId,
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
            Value<String?> subject = const Value.absent(),
            Value<int> rowid = const Value.absent(),
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
            rowid: rowid,
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
  Value<String> id,
  Value<bool> completed,
  Value<String?> propableCause,
  required int plannedDuration,
  Value<int?> actuallyDoneDuration,
  required DateTime startingTime,
  Value<DateTime?> expFinishTime,
  Value<DateTime?> finishTime,
  Value<int> rowid,
});
typedef $$RoundVariableTableUpdateCompanionBuilder = RoundVariableCompanion
    Function({
  Value<String> id,
  Value<bool> completed,
  Value<String?> propableCause,
  Value<int> plannedDuration,
  Value<int?> actuallyDoneDuration,
  Value<DateTime> startingTime,
  Value<DateTime?> expFinishTime,
  Value<DateTime?> finishTime,
  Value<int> rowid,
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
  ColumnFilters<String> get id => $composableBuilder(
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
  ColumnOrderings<String> get id => $composableBuilder(
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
  GeneratedColumn<String> get id =>
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
            Value<String> id = const Value.absent(),
            Value<bool> completed = const Value.absent(),
            Value<String?> propableCause = const Value.absent(),
            Value<int> plannedDuration = const Value.absent(),
            Value<int?> actuallyDoneDuration = const Value.absent(),
            Value<DateTime> startingTime = const Value.absent(),
            Value<DateTime?> expFinishTime = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
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
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<bool> completed = const Value.absent(),
            Value<String?> propableCause = const Value.absent(),
            required int plannedDuration,
            Value<int?> actuallyDoneDuration = const Value.absent(),
            required DateTime startingTime,
            Value<DateTime?> expFinishTime = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
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
            rowid: rowid,
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
  Value<String> id,
  required String name,
  required String address,
  Value<String?> superSubjectID,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> sessions,
  Value<int> subSubjects,
  Value<String?> lastFocuzdOnSessionID,
  Value<String?> linkSub,
  Value<int> totalTimeSpent,
  Value<int?> optinalFocusTime,
  Value<int?> optinalBreakTime,
  Value<int> rowid,
});
typedef $$SubjectTableUpdateCompanionBuilder = SubjectCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> address,
  Value<String?> superSubjectID,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> sessions,
  Value<int> subSubjects,
  Value<String?> lastFocuzdOnSessionID,
  Value<String?> linkSub,
  Value<int> totalTimeSpent,
  Value<int?> optinalFocusTime,
  Value<int?> optinalBreakTime,
  Value<int> rowid,
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
    final $_column = $_itemColumn<String>('last_focuzd_on_session_i_d');
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
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get superSubjectID => $composableBuilder(
      column: $table.superSubjectID,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sessions => $composableBuilder(
      column: $table.sessions, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subSubjects => $composableBuilder(
      column: $table.subSubjects, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get linkSub => $composableBuilder(
      column: $table.linkSub, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalTimeSpent => $composableBuilder(
      column: $table.totalTimeSpent,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get optinalFocusTime => $composableBuilder(
      column: $table.optinalFocusTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get optinalBreakTime => $composableBuilder(
      column: $table.optinalBreakTime,
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
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get superSubjectID => $composableBuilder(
      column: $table.superSubjectID,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sessions => $composableBuilder(
      column: $table.sessions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subSubjects => $composableBuilder(
      column: $table.subSubjects, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get linkSub => $composableBuilder(
      column: $table.linkSub, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalTimeSpent => $composableBuilder(
      column: $table.totalTimeSpent,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get optinalFocusTime => $composableBuilder(
      column: $table.optinalFocusTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get optinalBreakTime => $composableBuilder(
      column: $table.optinalBreakTime,
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
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get superSubjectID => $composableBuilder(
      column: $table.superSubjectID, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get sessions =>
      $composableBuilder(column: $table.sessions, builder: (column) => column);

  GeneratedColumn<int> get subSubjects => $composableBuilder(
      column: $table.subSubjects, builder: (column) => column);

  GeneratedColumn<String> get linkSub =>
      $composableBuilder(column: $table.linkSub, builder: (column) => column);

  GeneratedColumn<int> get totalTimeSpent => $composableBuilder(
      column: $table.totalTimeSpent, builder: (column) => column);

  GeneratedColumn<int> get optinalFocusTime => $composableBuilder(
      column: $table.optinalFocusTime, builder: (column) => column);

  GeneratedColumn<int> get optinalBreakTime => $composableBuilder(
      column: $table.optinalBreakTime, builder: (column) => column);

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
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String?> superSubjectID = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> sessions = const Value.absent(),
            Value<int> subSubjects = const Value.absent(),
            Value<String?> lastFocuzdOnSessionID = const Value.absent(),
            Value<String?> linkSub = const Value.absent(),
            Value<int> totalTimeSpent = const Value.absent(),
            Value<int?> optinalFocusTime = const Value.absent(),
            Value<int?> optinalBreakTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SubjectCompanion(
            id: id,
            name: name,
            address: address,
            superSubjectID: superSubjectID,
            createdAt: createdAt,
            updatedAt: updatedAt,
            sessions: sessions,
            subSubjects: subSubjects,
            lastFocuzdOnSessionID: lastFocuzdOnSessionID,
            linkSub: linkSub,
            totalTimeSpent: totalTimeSpent,
            optinalFocusTime: optinalFocusTime,
            optinalBreakTime: optinalBreakTime,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String name,
            required String address,
            Value<String?> superSubjectID = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> sessions = const Value.absent(),
            Value<int> subSubjects = const Value.absent(),
            Value<String?> lastFocuzdOnSessionID = const Value.absent(),
            Value<String?> linkSub = const Value.absent(),
            Value<int> totalTimeSpent = const Value.absent(),
            Value<int?> optinalFocusTime = const Value.absent(),
            Value<int?> optinalBreakTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SubjectCompanion.insert(
            id: id,
            name: name,
            address: address,
            superSubjectID: superSubjectID,
            createdAt: createdAt,
            updatedAt: updatedAt,
            sessions: sessions,
            subSubjects: subSubjects,
            lastFocuzdOnSessionID: lastFocuzdOnSessionID,
            linkSub: linkSub,
            totalTimeSpent: totalTimeSpent,
            optinalFocusTime: optinalFocusTime,
            optinalBreakTime: optinalBreakTime,
            rowid: rowid,
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
  Value<String> id,
  required String memoryCountdownID,
  Value<DateTime?> startingTime,
  Value<DateTime?> finishTime,
  Value<int?> duration,
  Value<String?> type,
  Value<bool> isActive,
  Value<int> rowid,
});
typedef $$OutPlanningVariableTableUpdateCompanionBuilder
    = OutPlanningVariableCompanion Function({
  Value<String> id,
  Value<String> memoryCountdownID,
  Value<DateTime?> startingTime,
  Value<DateTime?> finishTime,
  Value<int?> duration,
  Value<String?> type,
  Value<bool> isActive,
  Value<int> rowid,
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
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memoryCountdownID => $composableBuilder(
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
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memoryCountdownID => $composableBuilder(
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
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get memoryCountdownID => $composableBuilder(
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
            Value<String> id = const Value.absent(),
            Value<String> memoryCountdownID = const Value.absent(),
            Value<DateTime?> startingTime = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OutPlanningVariableCompanion(
            id: id,
            memoryCountdownID: memoryCountdownID,
            startingTime: startingTime,
            finishTime: finishTime,
            duration: duration,
            type: type,
            isActive: isActive,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String memoryCountdownID,
            Value<DateTime?> startingTime = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OutPlanningVariableCompanion.insert(
            id: id,
            memoryCountdownID: memoryCountdownID,
            startingTime: startingTime,
            finishTime: finishTime,
            duration: duration,
            type: type,
            isActive: isActive,
            rowid: rowid,
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
  Value<String> id,
  required String codeName,
  required int type,
  Value<bool> expired,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> startPeriod1,
  Value<DateTime?> endPeriod1,
  required DateTime startPeriod2,
  required DateTime endPeriod2,
  Value<int?> xSessionsGoal,
  Value<int?> ySessionsDone,
  Value<double?> plannedRatio,
  Value<double> realRatio,
  Value<int?> xSessionsR,
  Value<String?> subjectIdZ,
  Value<int?> subjectZNominator,
  Value<int?> xSessionsZ,
  Value<String?> subjectIdF,
  Value<double?> subjectFDenominator,
  Value<int?> xSessionsF,
  Value<double> successPercentage,
  Value<int> rowid,
});
typedef $$GoalTableUpdateCompanionBuilder = GoalCompanion Function({
  Value<String> id,
  Value<String> codeName,
  Value<int> type,
  Value<bool> expired,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> startPeriod1,
  Value<DateTime?> endPeriod1,
  Value<DateTime> startPeriod2,
  Value<DateTime> endPeriod2,
  Value<int?> xSessionsGoal,
  Value<int?> ySessionsDone,
  Value<double?> plannedRatio,
  Value<double> realRatio,
  Value<int?> xSessionsR,
  Value<String?> subjectIdZ,
  Value<int?> subjectZNominator,
  Value<int?> xSessionsZ,
  Value<String?> subjectIdF,
  Value<double?> subjectFDenominator,
  Value<int?> xSessionsF,
  Value<double> successPercentage,
  Value<int> rowid,
});

final class $$GoalTableReferences
    extends BaseReferences<_$AppDatabase, $GoalTable, GoalData> {
  $$GoalTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GroupLinkTable, List<GroupLinkData>>
      _groupLinkRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.groupLink,
              aliasName: $_aliasNameGenerator(db.goal.id, db.groupLink.goalID));

  $$GroupLinkTableProcessedTableManager get groupLinkRefs {
    final manager = $$GroupLinkTableTableManager($_db, $_db.groupLink)
        .filter((f) => f.goalID.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_groupLinkRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GoalTableFilterComposer extends Composer<_$AppDatabase, $GoalTable> {
  $$GoalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get codeName => $composableBuilder(
      column: $table.codeName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get expired => $composableBuilder(
      column: $table.expired, builder: (column) => ColumnFilters(column));

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

  ColumnFilters<String> get subjectIdZ => $composableBuilder(
      column: $table.subjectIdZ, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subjectZNominator => $composableBuilder(
      column: $table.subjectZNominator,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get xSessionsZ => $composableBuilder(
      column: $table.xSessionsZ, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subjectIdF => $composableBuilder(
      column: $table.subjectIdF, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get subjectFDenominator => $composableBuilder(
      column: $table.subjectFDenominator,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get xSessionsF => $composableBuilder(
      column: $table.xSessionsF, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get successPercentage => $composableBuilder(
      column: $table.successPercentage,
      builder: (column) => ColumnFilters(column));

  Expression<bool> groupLinkRefs(
      Expression<bool> Function($$GroupLinkTableFilterComposer f) f) {
    final $$GroupLinkTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.groupLink,
        getReferencedColumn: (t) => t.goalID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupLinkTableFilterComposer(
              $db: $db,
              $table: $db.groupLink,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GoalTableOrderingComposer extends Composer<_$AppDatabase, $GoalTable> {
  $$GoalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get codeName => $composableBuilder(
      column: $table.codeName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get expired => $composableBuilder(
      column: $table.expired, builder: (column) => ColumnOrderings(column));

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

  ColumnOrderings<String> get subjectIdZ => $composableBuilder(
      column: $table.subjectIdZ, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subjectZNominator => $composableBuilder(
      column: $table.subjectZNominator,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get xSessionsZ => $composableBuilder(
      column: $table.xSessionsZ, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subjectIdF => $composableBuilder(
      column: $table.subjectIdF, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get subjectFDenominator => $composableBuilder(
      column: $table.subjectFDenominator,
      builder: (column) => ColumnOrderings(column));

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
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get codeName =>
      $composableBuilder(column: $table.codeName, builder: (column) => column);

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get expired =>
      $composableBuilder(column: $table.expired, builder: (column) => column);

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

  GeneratedColumn<String> get subjectIdZ => $composableBuilder(
      column: $table.subjectIdZ, builder: (column) => column);

  GeneratedColumn<int> get subjectZNominator => $composableBuilder(
      column: $table.subjectZNominator, builder: (column) => column);

  GeneratedColumn<int> get xSessionsZ => $composableBuilder(
      column: $table.xSessionsZ, builder: (column) => column);

  GeneratedColumn<String> get subjectIdF => $composableBuilder(
      column: $table.subjectIdF, builder: (column) => column);

  GeneratedColumn<double> get subjectFDenominator => $composableBuilder(
      column: $table.subjectFDenominator, builder: (column) => column);

  GeneratedColumn<int> get xSessionsF => $composableBuilder(
      column: $table.xSessionsF, builder: (column) => column);

  GeneratedColumn<double> get successPercentage => $composableBuilder(
      column: $table.successPercentage, builder: (column) => column);

  Expression<T> groupLinkRefs<T extends Object>(
      Expression<T> Function($$GroupLinkTableAnnotationComposer a) f) {
    final $$GroupLinkTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.groupLink,
        getReferencedColumn: (t) => t.goalID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GroupLinkTableAnnotationComposer(
              $db: $db,
              $table: $db.groupLink,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
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
    (GoalData, $$GoalTableReferences),
    GoalData,
    PrefetchHooks Function({bool groupLinkRefs})> {
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
            Value<String> id = const Value.absent(),
            Value<String> codeName = const Value.absent(),
            Value<int> type = const Value.absent(),
            Value<bool> expired = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> startPeriod1 = const Value.absent(),
            Value<DateTime?> endPeriod1 = const Value.absent(),
            Value<DateTime> startPeriod2 = const Value.absent(),
            Value<DateTime> endPeriod2 = const Value.absent(),
            Value<int?> xSessionsGoal = const Value.absent(),
            Value<int?> ySessionsDone = const Value.absent(),
            Value<double?> plannedRatio = const Value.absent(),
            Value<double> realRatio = const Value.absent(),
            Value<int?> xSessionsR = const Value.absent(),
            Value<String?> subjectIdZ = const Value.absent(),
            Value<int?> subjectZNominator = const Value.absent(),
            Value<int?> xSessionsZ = const Value.absent(),
            Value<String?> subjectIdF = const Value.absent(),
            Value<double?> subjectFDenominator = const Value.absent(),
            Value<int?> xSessionsF = const Value.absent(),
            Value<double> successPercentage = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalCompanion(
            id: id,
            codeName: codeName,
            type: type,
            expired: expired,
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
            subjectZNominator: subjectZNominator,
            xSessionsZ: xSessionsZ,
            subjectIdF: subjectIdF,
            subjectFDenominator: subjectFDenominator,
            xSessionsF: xSessionsF,
            successPercentage: successPercentage,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String codeName,
            required int type,
            Value<bool> expired = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> startPeriod1 = const Value.absent(),
            Value<DateTime?> endPeriod1 = const Value.absent(),
            required DateTime startPeriod2,
            required DateTime endPeriod2,
            Value<int?> xSessionsGoal = const Value.absent(),
            Value<int?> ySessionsDone = const Value.absent(),
            Value<double?> plannedRatio = const Value.absent(),
            Value<double> realRatio = const Value.absent(),
            Value<int?> xSessionsR = const Value.absent(),
            Value<String?> subjectIdZ = const Value.absent(),
            Value<int?> subjectZNominator = const Value.absent(),
            Value<int?> xSessionsZ = const Value.absent(),
            Value<String?> subjectIdF = const Value.absent(),
            Value<double?> subjectFDenominator = const Value.absent(),
            Value<int?> xSessionsF = const Value.absent(),
            Value<double> successPercentage = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalCompanion.insert(
            id: id,
            codeName: codeName,
            type: type,
            expired: expired,
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
            subjectZNominator: subjectZNominator,
            xSessionsZ: xSessionsZ,
            subjectIdF: subjectIdF,
            subjectFDenominator: subjectFDenominator,
            xSessionsF: xSessionsF,
            successPercentage: successPercentage,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$GoalTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({groupLinkRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (groupLinkRefs) db.groupLink],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (groupLinkRefs)
                    await $_getPrefetchedData<GoalData, $GoalTable,
                            GroupLinkData>(
                        currentTable: table,
                        referencedTable:
                            $$GoalTableReferences._groupLinkRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GoalTableReferences(db, table, p0).groupLinkRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.goalID == item.id),
                        typedResults: items)
                ];
              },
            );
          },
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
    (GoalData, $$GoalTableReferences),
    GoalData,
    PrefetchHooks Function({bool groupLinkRefs})>;
typedef $$GoalGroupTableCreateCompanionBuilder = GoalGroupCompanion Function({
  Value<String> id,
  required String codeName,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> goalNumber,
  Value<int> rowid,
});
typedef $$GoalGroupTableUpdateCompanionBuilder = GoalGroupCompanion Function({
  Value<String> id,
  Value<String> codeName,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> goalNumber,
  Value<int> rowid,
});

class $$GoalGroupTableFilterComposer
    extends Composer<_$AppDatabase, $GoalGroupTable> {
  $$GoalGroupTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get codeName => $composableBuilder(
      column: $table.codeName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get goalNumber => $composableBuilder(
      column: $table.goalNumber, builder: (column) => ColumnFilters(column));
}

class $$GoalGroupTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalGroupTable> {
  $$GoalGroupTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get codeName => $composableBuilder(
      column: $table.codeName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get goalNumber => $composableBuilder(
      column: $table.goalNumber, builder: (column) => ColumnOrderings(column));
}

class $$GoalGroupTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalGroupTable> {
  $$GoalGroupTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get codeName =>
      $composableBuilder(column: $table.codeName, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get goalNumber => $composableBuilder(
      column: $table.goalNumber, builder: (column) => column);
}

class $$GoalGroupTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GoalGroupTable,
    GoalGroupData,
    $$GoalGroupTableFilterComposer,
    $$GoalGroupTableOrderingComposer,
    $$GoalGroupTableAnnotationComposer,
    $$GoalGroupTableCreateCompanionBuilder,
    $$GoalGroupTableUpdateCompanionBuilder,
    (
      GoalGroupData,
      BaseReferences<_$AppDatabase, $GoalGroupTable, GoalGroupData>
    ),
    GoalGroupData,
    PrefetchHooks Function()> {
  $$GoalGroupTableTableManager(_$AppDatabase db, $GoalGroupTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalGroupTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalGroupTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalGroupTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> codeName = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> goalNumber = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalGroupCompanion(
            id: id,
            codeName: codeName,
            createdAt: createdAt,
            updatedAt: updatedAt,
            goalNumber: goalNumber,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required String codeName,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> goalNumber = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalGroupCompanion.insert(
            id: id,
            codeName: codeName,
            createdAt: createdAt,
            updatedAt: updatedAt,
            goalNumber: goalNumber,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GoalGroupTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GoalGroupTable,
    GoalGroupData,
    $$GoalGroupTableFilterComposer,
    $$GoalGroupTableOrderingComposer,
    $$GoalGroupTableAnnotationComposer,
    $$GoalGroupTableCreateCompanionBuilder,
    $$GoalGroupTableUpdateCompanionBuilder,
    (
      GoalGroupData,
      BaseReferences<_$AppDatabase, $GoalGroupTable, GoalGroupData>
    ),
    GoalGroupData,
    PrefetchHooks Function()>;
typedef $$GroupLinkTableCreateCompanionBuilder = GroupLinkCompanion Function({
  Value<String> id,
  required DateTime createdAt,
  required String groupID,
  required String goalID,
  Value<int> rowid,
});
typedef $$GroupLinkTableUpdateCompanionBuilder = GroupLinkCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<String> groupID,
  Value<String> goalID,
  Value<int> rowid,
});

final class $$GroupLinkTableReferences
    extends BaseReferences<_$AppDatabase, $GroupLinkTable, GroupLinkData> {
  $$GroupLinkTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GoalTable _goalIDTable(_$AppDatabase db) => db.goal
      .createAlias($_aliasNameGenerator(db.groupLink.goalID, db.goal.id));

  $$GoalTableProcessedTableManager get goalID {
    final $_column = $_itemColumn<String>('goal_i_d')!;

    final manager = $$GoalTableTableManager($_db, $_db.goal)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_goalIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$GroupLinkTableFilterComposer
    extends Composer<_$AppDatabase, $GroupLinkTable> {
  $$GroupLinkTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get groupID => $composableBuilder(
      column: $table.groupID, builder: (column) => ColumnFilters(column));

  $$GoalTableFilterComposer get goalID {
    final $$GoalTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.goalID,
        referencedTable: $db.goal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalTableFilterComposer(
              $db: $db,
              $table: $db.goal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GroupLinkTableOrderingComposer
    extends Composer<_$AppDatabase, $GroupLinkTable> {
  $$GroupLinkTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get groupID => $composableBuilder(
      column: $table.groupID, builder: (column) => ColumnOrderings(column));

  $$GoalTableOrderingComposer get goalID {
    final $$GoalTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.goalID,
        referencedTable: $db.goal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalTableOrderingComposer(
              $db: $db,
              $table: $db.goal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GroupLinkTableAnnotationComposer
    extends Composer<_$AppDatabase, $GroupLinkTable> {
  $$GroupLinkTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get groupID =>
      $composableBuilder(column: $table.groupID, builder: (column) => column);

  $$GoalTableAnnotationComposer get goalID {
    final $$GoalTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.goalID,
        referencedTable: $db.goal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalTableAnnotationComposer(
              $db: $db,
              $table: $db.goal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GroupLinkTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GroupLinkTable,
    GroupLinkData,
    $$GroupLinkTableFilterComposer,
    $$GroupLinkTableOrderingComposer,
    $$GroupLinkTableAnnotationComposer,
    $$GroupLinkTableCreateCompanionBuilder,
    $$GroupLinkTableUpdateCompanionBuilder,
    (GroupLinkData, $$GroupLinkTableReferences),
    GroupLinkData,
    PrefetchHooks Function({bool goalID})> {
  $$GroupLinkTableTableManager(_$AppDatabase db, $GroupLinkTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupLinkTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupLinkTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupLinkTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> groupID = const Value.absent(),
            Value<String> goalID = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupLinkCompanion(
            id: id,
            createdAt: createdAt,
            groupID: groupID,
            goalID: goalID,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            required DateTime createdAt,
            required String groupID,
            required String goalID,
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupLinkCompanion.insert(
            id: id,
            createdAt: createdAt,
            groupID: groupID,
            goalID: goalID,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GroupLinkTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({goalID = false}) {
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
                if (goalID) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.goalID,
                    referencedTable:
                        $$GroupLinkTableReferences._goalIDTable(db),
                    referencedColumn:
                        $$GroupLinkTableReferences._goalIDTable(db).id,
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

typedef $$GroupLinkTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GroupLinkTable,
    GroupLinkData,
    $$GroupLinkTableFilterComposer,
    $$GroupLinkTableOrderingComposer,
    $$GroupLinkTableAnnotationComposer,
    $$GroupLinkTableCreateCompanionBuilder,
    $$GroupLinkTableUpdateCompanionBuilder,
    (GroupLinkData, $$GroupLinkTableReferences),
    GroupLinkData,
    PrefetchHooks Function({bool goalID})>;

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
  $$GoalGroupTableTableManager get goalGroup =>
      $$GoalGroupTableTableManager(_db, _db.goalGroup);
  $$GroupLinkTableTableManager get groupLink =>
      $$GroupLinkTableTableManager(_db, _db.groupLink);
}
