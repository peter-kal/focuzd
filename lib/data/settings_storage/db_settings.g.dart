// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_settings.dart';

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
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("window_on_top" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _defaultNumberOfSessionsPerRoundMeta =
      const VerificationMeta('defaultNumberOfSessionsPerRound');
  @override
  late final GeneratedColumn<int> defaultNumberOfSessionsPerRound =
      GeneratedColumn<int>(
          'default_number_of_sessions_per_round', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const Constant(4));
  static const VerificationMeta _defaultBreakDurationStoredMeta =
      const VerificationMeta('defaultBreakDurationStored');
  @override
  late final GeneratedColumn<int> defaultBreakDurationStored =
      GeneratedColumn<int>('default_break_duration_stored', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const Constant(5));
  static const VerificationMeta _defaultFocusDurationStoredMeta =
      const VerificationMeta('defaultFocusDurationStored');
  @override
  late final GeneratedColumn<int> defaultFocusDurationStored =
      GeneratedColumn<int>('default_focus_duration_stored', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const Constant(25));
  static const VerificationMeta _defaultLongBreakDurationStoredMeta =
      const VerificationMeta('defaultLongBreakDurationStored');
  @override
  late final GeneratedColumn<int> defaultLongBreakDurationStored =
      GeneratedColumn<int>(
          'default_long_break_duration_stored', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const Constant(15));
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
  static const VerificationMeta _periodofLongBreakMeta =
      const VerificationMeta('periodofLongBreak');
  @override
  late final GeneratedColumn<int> periodofLongBreak = GeneratedColumn<int>(
      'periodof_long_break', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(4));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        windowOnTop,
        defaultNumberOfSessionsPerRound,
        defaultBreakDurationStored,
        defaultFocusDurationStored,
        defaultLongBreakDurationStored,
        atWillStart,
        periodofLongBreak
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
    }
    if (data.containsKey('default_number_of_sessions_per_round')) {
      context.handle(
          _defaultNumberOfSessionsPerRoundMeta,
          defaultNumberOfSessionsPerRound.isAcceptableOrUnknown(
              data['default_number_of_sessions_per_round']!,
              _defaultNumberOfSessionsPerRoundMeta));
    }
    if (data.containsKey('default_break_duration_stored')) {
      context.handle(
          _defaultBreakDurationStoredMeta,
          defaultBreakDurationStored.isAcceptableOrUnknown(
              data['default_break_duration_stored']!,
              _defaultBreakDurationStoredMeta));
    }
    if (data.containsKey('default_focus_duration_stored')) {
      context.handle(
          _defaultFocusDurationStoredMeta,
          defaultFocusDurationStored.isAcceptableOrUnknown(
              data['default_focus_duration_stored']!,
              _defaultFocusDurationStoredMeta));
    }
    if (data.containsKey('default_long_break_duration_stored')) {
      context.handle(
          _defaultLongBreakDurationStoredMeta,
          defaultLongBreakDurationStored.isAcceptableOrUnknown(
              data['default_long_break_duration_stored']!,
              _defaultLongBreakDurationStoredMeta));
    }
    if (data.containsKey('at_will_start')) {
      context.handle(
          _atWillStartMeta,
          atWillStart.isAcceptableOrUnknown(
              data['at_will_start']!, _atWillStartMeta));
    }
    if (data.containsKey('periodof_long_break')) {
      context.handle(
          _periodofLongBreakMeta,
          periodofLongBreak.isAcceptableOrUnknown(
              data['periodof_long_break']!, _periodofLongBreakMeta));
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
      atWillStart: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}at_will_start'])!,
      periodofLongBreak: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}periodof_long_break'])!,
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
  final int defaultNumberOfSessionsPerRound;
  final int defaultBreakDurationStored;
  final int defaultFocusDurationStored;
  final int defaultLongBreakDurationStored;
  final bool atWillStart;
  final int periodofLongBreak;
  const SettingsVariable(
      {required this.id,
      required this.windowOnTop,
      required this.defaultNumberOfSessionsPerRound,
      required this.defaultBreakDurationStored,
      required this.defaultFocusDurationStored,
      required this.defaultLongBreakDurationStored,
      required this.atWillStart,
      required this.periodofLongBreak});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['window_on_top'] = Variable<bool>(windowOnTop);
    map['default_number_of_sessions_per_round'] =
        Variable<int>(defaultNumberOfSessionsPerRound);
    map['default_break_duration_stored'] =
        Variable<int>(defaultBreakDurationStored);
    map['default_focus_duration_stored'] =
        Variable<int>(defaultFocusDurationStored);
    map['default_long_break_duration_stored'] =
        Variable<int>(defaultLongBreakDurationStored);
    map['at_will_start'] = Variable<bool>(atWillStart);
    map['periodof_long_break'] = Variable<int>(periodofLongBreak);
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
      atWillStart: Value(atWillStart),
      periodofLongBreak: Value(periodofLongBreak),
    );
  }

  factory SettingsVariable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsVariable(
      id: serializer.fromJson<int>(json['id']),
      windowOnTop: serializer.fromJson<bool>(json['windowOnTop']),
      defaultNumberOfSessionsPerRound:
          serializer.fromJson<int>(json['defaultNumberOfSessionsPerRound']),
      defaultBreakDurationStored:
          serializer.fromJson<int>(json['defaultBreakDurationStored']),
      defaultFocusDurationStored:
          serializer.fromJson<int>(json['defaultFocusDurationStored']),
      defaultLongBreakDurationStored:
          serializer.fromJson<int>(json['defaultLongBreakDurationStored']),
      atWillStart: serializer.fromJson<bool>(json['atWillStart']),
      periodofLongBreak: serializer.fromJson<int>(json['periodofLongBreak']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'windowOnTop': serializer.toJson<bool>(windowOnTop),
      'defaultNumberOfSessionsPerRound':
          serializer.toJson<int>(defaultNumberOfSessionsPerRound),
      'defaultBreakDurationStored':
          serializer.toJson<int>(defaultBreakDurationStored),
      'defaultFocusDurationStored':
          serializer.toJson<int>(defaultFocusDurationStored),
      'defaultLongBreakDurationStored':
          serializer.toJson<int>(defaultLongBreakDurationStored),
      'atWillStart': serializer.toJson<bool>(atWillStart),
      'periodofLongBreak': serializer.toJson<int>(periodofLongBreak),
    };
  }

  SettingsVariable copyWith(
          {int? id,
          bool? windowOnTop,
          int? defaultNumberOfSessionsPerRound,
          int? defaultBreakDurationStored,
          int? defaultFocusDurationStored,
          int? defaultLongBreakDurationStored,
          bool? atWillStart,
          int? periodofLongBreak}) =>
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
        atWillStart: atWillStart ?? this.atWillStart,
        periodofLongBreak: periodofLongBreak ?? this.periodofLongBreak,
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
      atWillStart:
          data.atWillStart.present ? data.atWillStart.value : this.atWillStart,
      periodofLongBreak: data.periodofLongBreak.present
          ? data.periodofLongBreak.value
          : this.periodofLongBreak,
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
          ..write('atWillStart: $atWillStart, ')
          ..write('periodofLongBreak: $periodofLongBreak')
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
      atWillStart,
      periodofLongBreak);
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
          other.atWillStart == this.atWillStart &&
          other.periodofLongBreak == this.periodofLongBreak);
}

class SettingsVariablesCompanion extends UpdateCompanion<SettingsVariable> {
  final Value<int> id;
  final Value<bool> windowOnTop;
  final Value<int> defaultNumberOfSessionsPerRound;
  final Value<int> defaultBreakDurationStored;
  final Value<int> defaultFocusDurationStored;
  final Value<int> defaultLongBreakDurationStored;
  final Value<bool> atWillStart;
  final Value<int> periodofLongBreak;
  const SettingsVariablesCompanion({
    this.id = const Value.absent(),
    this.windowOnTop = const Value.absent(),
    this.defaultNumberOfSessionsPerRound = const Value.absent(),
    this.defaultBreakDurationStored = const Value.absent(),
    this.defaultFocusDurationStored = const Value.absent(),
    this.defaultLongBreakDurationStored = const Value.absent(),
    this.atWillStart = const Value.absent(),
    this.periodofLongBreak = const Value.absent(),
  });
  SettingsVariablesCompanion.insert({
    this.id = const Value.absent(),
    this.windowOnTop = const Value.absent(),
    this.defaultNumberOfSessionsPerRound = const Value.absent(),
    this.defaultBreakDurationStored = const Value.absent(),
    this.defaultFocusDurationStored = const Value.absent(),
    this.defaultLongBreakDurationStored = const Value.absent(),
    this.atWillStart = const Value.absent(),
    this.periodofLongBreak = const Value.absent(),
  });
  static Insertable<SettingsVariable> custom({
    Expression<int>? id,
    Expression<bool>? windowOnTop,
    Expression<int>? defaultNumberOfSessionsPerRound,
    Expression<int>? defaultBreakDurationStored,
    Expression<int>? defaultFocusDurationStored,
    Expression<int>? defaultLongBreakDurationStored,
    Expression<bool>? atWillStart,
    Expression<int>? periodofLongBreak,
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
      if (atWillStart != null) 'at_will_start': atWillStart,
      if (periodofLongBreak != null) 'periodof_long_break': periodofLongBreak,
    });
  }

  SettingsVariablesCompanion copyWith(
      {Value<int>? id,
      Value<bool>? windowOnTop,
      Value<int>? defaultNumberOfSessionsPerRound,
      Value<int>? defaultBreakDurationStored,
      Value<int>? defaultFocusDurationStored,
      Value<int>? defaultLongBreakDurationStored,
      Value<bool>? atWillStart,
      Value<int>? periodofLongBreak}) {
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
      atWillStart: atWillStart ?? this.atWillStart,
      periodofLongBreak: periodofLongBreak ?? this.periodofLongBreak,
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
    if (atWillStart.present) {
      map['at_will_start'] = Variable<bool>(atWillStart.value);
    }
    if (periodofLongBreak.present) {
      map['periodof_long_break'] = Variable<int>(periodofLongBreak.value);
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
          ..write('atWillStart: $atWillStart, ')
          ..write('periodofLongBreak: $periodofLongBreak')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SettingsVariablesTable settingsVariables =
      $SettingsVariablesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [settingsVariables];
}

typedef $$SettingsVariablesTableCreateCompanionBuilder
    = SettingsVariablesCompanion Function({
  Value<int> id,
  Value<bool> windowOnTop,
  Value<int> defaultNumberOfSessionsPerRound,
  Value<int> defaultBreakDurationStored,
  Value<int> defaultFocusDurationStored,
  Value<int> defaultLongBreakDurationStored,
  Value<bool> atWillStart,
  Value<int> periodofLongBreak,
});
typedef $$SettingsVariablesTableUpdateCompanionBuilder
    = SettingsVariablesCompanion Function({
  Value<int> id,
  Value<bool> windowOnTop,
  Value<int> defaultNumberOfSessionsPerRound,
  Value<int> defaultBreakDurationStored,
  Value<int> defaultFocusDurationStored,
  Value<int> defaultLongBreakDurationStored,
  Value<bool> atWillStart,
  Value<int> periodofLongBreak,
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

  ColumnFilters<bool> get atWillStart => $composableBuilder(
      column: $table.atWillStart, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get periodofLongBreak => $composableBuilder(
      column: $table.periodofLongBreak,
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

  ColumnOrderings<bool> get atWillStart => $composableBuilder(
      column: $table.atWillStart, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get periodofLongBreak => $composableBuilder(
      column: $table.periodofLongBreak,
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

  GeneratedColumn<bool> get atWillStart => $composableBuilder(
      column: $table.atWillStart, builder: (column) => column);

  GeneratedColumn<int> get periodofLongBreak => $composableBuilder(
      column: $table.periodofLongBreak, builder: (column) => column);
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
            Value<int> defaultNumberOfSessionsPerRound = const Value.absent(),
            Value<int> defaultBreakDurationStored = const Value.absent(),
            Value<int> defaultFocusDurationStored = const Value.absent(),
            Value<int> defaultLongBreakDurationStored = const Value.absent(),
            Value<bool> atWillStart = const Value.absent(),
            Value<int> periodofLongBreak = const Value.absent(),
          }) =>
              SettingsVariablesCompanion(
            id: id,
            windowOnTop: windowOnTop,
            defaultNumberOfSessionsPerRound: defaultNumberOfSessionsPerRound,
            defaultBreakDurationStored: defaultBreakDurationStored,
            defaultFocusDurationStored: defaultFocusDurationStored,
            defaultLongBreakDurationStored: defaultLongBreakDurationStored,
            atWillStart: atWillStart,
            periodofLongBreak: periodofLongBreak,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> windowOnTop = const Value.absent(),
            Value<int> defaultNumberOfSessionsPerRound = const Value.absent(),
            Value<int> defaultBreakDurationStored = const Value.absent(),
            Value<int> defaultFocusDurationStored = const Value.absent(),
            Value<int> defaultLongBreakDurationStored = const Value.absent(),
            Value<bool> atWillStart = const Value.absent(),
            Value<int> periodofLongBreak = const Value.absent(),
          }) =>
              SettingsVariablesCompanion.insert(
            id: id,
            windowOnTop: windowOnTop,
            defaultNumberOfSessionsPerRound: defaultNumberOfSessionsPerRound,
            defaultBreakDurationStored: defaultBreakDurationStored,
            defaultFocusDurationStored: defaultFocusDurationStored,
            defaultLongBreakDurationStored: defaultLongBreakDurationStored,
            atWillStart: atWillStart,
            periodofLongBreak: periodofLongBreak,
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SettingsVariablesTableTableManager get settingsVariables =>
      $$SettingsVariablesTableTableManager(_db, _db.settingsVariables);
}
