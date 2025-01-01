// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_settings.dart';

// ignore_for_file: type=lint
class $SettingsVariablesTable extends SettingsVariables
    with TableInfo<$SettingsVariablesTable, SettingsVariablesEntity> {
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
  VerificationContext validateIntegrity(
      Insertable<SettingsVariablesEntity> instance,
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
  SettingsVariablesEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsVariablesEntity(
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
      selectedLongBreakDurationStored: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}selected_long_break_duration_stored'])!,
      selectedWorkDurationStored: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}selected_work_duration_stored'])!,
    );
  }

  @override
  $SettingsVariablesTable createAlias(String alias) {
    return $SettingsVariablesTable(attachedDatabase, alias);
  }
}

class SettingsVariablesCompanion
    extends UpdateCompanion<SettingsVariablesEntity> {
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
  static Insertable<SettingsVariablesEntity> custom({
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
    SettingsVariablesEntity,
    $$SettingsVariablesTableFilterComposer,
    $$SettingsVariablesTableOrderingComposer,
    $$SettingsVariablesTableAnnotationComposer,
    $$SettingsVariablesTableCreateCompanionBuilder,
    $$SettingsVariablesTableUpdateCompanionBuilder,
    (
      SettingsVariablesEntity,
      BaseReferences<_$AppDatabase, $SettingsVariablesTable,
          SettingsVariablesEntity>
    ),
    SettingsVariablesEntity,
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
    SettingsVariablesEntity,
    $$SettingsVariablesTableFilterComposer,
    $$SettingsVariablesTableOrderingComposer,
    $$SettingsVariablesTableAnnotationComposer,
    $$SettingsVariablesTableCreateCompanionBuilder,
    $$SettingsVariablesTableUpdateCompanionBuilder,
    (
      SettingsVariablesEntity,
      BaseReferences<_$AppDatabase, $SettingsVariablesTable,
          SettingsVariablesEntity>
    ),
    SettingsVariablesEntity,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SettingsVariablesTableTableManager get settingsVariables =>
      $$SettingsVariablesTableTableManager(_db, _db.settingsVariables);
}
