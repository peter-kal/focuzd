// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_vars.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSettingsVariablesCollection on Isar {
  IsarCollection<SettingsVariables> get settingsVariables => this.collection();
}

const SettingsVariablesSchema = CollectionSchema(
  name: r'SettingsVariables',
  id: -1576984779220212406,
  properties: {
    r'requestedNumberOfSessions': PropertySchema(
      id: 0,
      name: r'requestedNumberOfSessions',
      type: IsarType.double,
    ),
    r'selectedBreakDurationStored': PropertySchema(
      id: 1,
      name: r'selectedBreakDurationStored',
      type: IsarType.long,
    ),
    r'selectedLongBreakDuration': PropertySchema(
      id: 2,
      name: r'selectedLongBreakDuration',
      type: IsarType.long,
    ),
    r'selectedWorkDurationStored': PropertySchema(
      id: 3,
      name: r'selectedWorkDurationStored',
      type: IsarType.long,
    ),
    r'windowOnTop': PropertySchema(
      id: 4,
      name: r'windowOnTop',
      type: IsarType.bool,
    )
  },
  estimateSize: _settingsVariablesEstimateSize,
  serialize: _settingsVariablesSerialize,
  deserialize: _settingsVariablesDeserialize,
  deserializeProp: _settingsVariablesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _settingsVariablesGetId,
  getLinks: _settingsVariablesGetLinks,
  attach: _settingsVariablesAttach,
  version: '3.1.0+1',
);

int _settingsVariablesEstimateSize(
  SettingsVariables object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _settingsVariablesSerialize(
  SettingsVariables object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.requestedNumberOfSessions);
  writer.writeLong(offsets[1], object.selectedBreakDurationStored);
  writer.writeLong(offsets[2], object.selectedLongBreakDuration);
  writer.writeLong(offsets[3], object.selectedWorkDurationStored);
  writer.writeBool(offsets[4], object.windowOnTop);
}

SettingsVariables _settingsVariablesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SettingsVariables();
  object.id = id;
  object.requestedNumberOfSessions = reader.readDoubleOrNull(offsets[0]);
  object.selectedBreakDurationStored = reader.readLongOrNull(offsets[1]);
  object.selectedLongBreakDuration = reader.readLongOrNull(offsets[2]);
  object.selectedWorkDurationStored = reader.readLongOrNull(offsets[3]);
  object.windowOnTop = reader.readBoolOrNull(offsets[4]);
  return object;
}

P _settingsVariablesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _settingsVariablesGetId(SettingsVariables object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _settingsVariablesGetLinks(
    SettingsVariables object) {
  return [];
}

void _settingsVariablesAttach(
    IsarCollection<dynamic> col, Id id, SettingsVariables object) {
  object.id = id;
}

extension SettingsVariablesQueryWhereSort
    on QueryBuilder<SettingsVariables, SettingsVariables, QWhere> {
  QueryBuilder<SettingsVariables, SettingsVariables, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingsVariablesQueryWhere
    on QueryBuilder<SettingsVariables, SettingsVariables, QWhereClause> {
  QueryBuilder<SettingsVariables, SettingsVariables, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SettingsVariablesQueryFilter
    on QueryBuilder<SettingsVariables, SettingsVariables, QFilterCondition> {
  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      requestedNumberOfSessionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'requestedNumberOfSessions',
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      requestedNumberOfSessionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'requestedNumberOfSessions',
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      requestedNumberOfSessionsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requestedNumberOfSessions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      requestedNumberOfSessionsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'requestedNumberOfSessions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      requestedNumberOfSessionsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'requestedNumberOfSessions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      requestedNumberOfSessionsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'requestedNumberOfSessions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedBreakDurationStoredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'selectedBreakDurationStored',
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedBreakDurationStoredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'selectedBreakDurationStored',
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedBreakDurationStoredEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedBreakDurationStored',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedBreakDurationStoredGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedBreakDurationStored',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedBreakDurationStoredLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedBreakDurationStored',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedBreakDurationStoredBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedBreakDurationStored',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedLongBreakDurationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'selectedLongBreakDuration',
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedLongBreakDurationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'selectedLongBreakDuration',
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedLongBreakDurationEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedLongBreakDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedLongBreakDurationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedLongBreakDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedLongBreakDurationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedLongBreakDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedLongBreakDurationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedLongBreakDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedWorkDurationStoredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'selectedWorkDurationStored',
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedWorkDurationStoredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'selectedWorkDurationStored',
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedWorkDurationStoredEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedWorkDurationStored',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedWorkDurationStoredGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedWorkDurationStored',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedWorkDurationStoredLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedWorkDurationStored',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      selectedWorkDurationStoredBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedWorkDurationStored',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      windowOnTopIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windowOnTop',
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      windowOnTopIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windowOnTop',
      ));
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterFilterCondition>
      windowOnTopEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windowOnTop',
        value: value,
      ));
    });
  }
}

extension SettingsVariablesQueryObject
    on QueryBuilder<SettingsVariables, SettingsVariables, QFilterCondition> {}

extension SettingsVariablesQueryLinks
    on QueryBuilder<SettingsVariables, SettingsVariables, QFilterCondition> {}

extension SettingsVariablesQuerySortBy
    on QueryBuilder<SettingsVariables, SettingsVariables, QSortBy> {
  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      sortByRequestedNumberOfSessions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedNumberOfSessions', Sort.asc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      sortByRequestedNumberOfSessionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedNumberOfSessions', Sort.desc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      sortBySelectedBreakDurationStored() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedBreakDurationStored', Sort.asc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      sortBySelectedBreakDurationStoredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedBreakDurationStored', Sort.desc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      sortBySelectedLongBreakDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedLongBreakDuration', Sort.asc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      sortBySelectedLongBreakDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedLongBreakDuration', Sort.desc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      sortBySelectedWorkDurationStored() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedWorkDurationStored', Sort.asc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      sortBySelectedWorkDurationStoredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedWorkDurationStored', Sort.desc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      sortByWindowOnTop() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowOnTop', Sort.asc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      sortByWindowOnTopDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowOnTop', Sort.desc);
    });
  }
}

extension SettingsVariablesQuerySortThenBy
    on QueryBuilder<SettingsVariables, SettingsVariables, QSortThenBy> {
  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      thenByRequestedNumberOfSessions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedNumberOfSessions', Sort.asc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      thenByRequestedNumberOfSessionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestedNumberOfSessions', Sort.desc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      thenBySelectedBreakDurationStored() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedBreakDurationStored', Sort.asc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      thenBySelectedBreakDurationStoredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedBreakDurationStored', Sort.desc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      thenBySelectedLongBreakDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedLongBreakDuration', Sort.asc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      thenBySelectedLongBreakDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedLongBreakDuration', Sort.desc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      thenBySelectedWorkDurationStored() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedWorkDurationStored', Sort.asc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      thenBySelectedWorkDurationStoredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedWorkDurationStored', Sort.desc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      thenByWindowOnTop() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowOnTop', Sort.asc);
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QAfterSortBy>
      thenByWindowOnTopDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windowOnTop', Sort.desc);
    });
  }
}

extension SettingsVariablesQueryWhereDistinct
    on QueryBuilder<SettingsVariables, SettingsVariables, QDistinct> {
  QueryBuilder<SettingsVariables, SettingsVariables, QDistinct>
      distinctByRequestedNumberOfSessions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requestedNumberOfSessions');
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QDistinct>
      distinctBySelectedBreakDurationStored() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedBreakDurationStored');
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QDistinct>
      distinctBySelectedLongBreakDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedLongBreakDuration');
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QDistinct>
      distinctBySelectedWorkDurationStored() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedWorkDurationStored');
    });
  }

  QueryBuilder<SettingsVariables, SettingsVariables, QDistinct>
      distinctByWindowOnTop() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windowOnTop');
    });
  }
}

extension SettingsVariablesQueryProperty
    on QueryBuilder<SettingsVariables, SettingsVariables, QQueryProperty> {
  QueryBuilder<SettingsVariables, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SettingsVariables, double?, QQueryOperations>
      requestedNumberOfSessionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requestedNumberOfSessions');
    });
  }

  QueryBuilder<SettingsVariables, int?, QQueryOperations>
      selectedBreakDurationStoredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedBreakDurationStored');
    });
  }

  QueryBuilder<SettingsVariables, int?, QQueryOperations>
      selectedLongBreakDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedLongBreakDuration');
    });
  }

  QueryBuilder<SettingsVariables, int?, QQueryOperations>
      selectedWorkDurationStoredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedWorkDurationStored');
    });
  }

  QueryBuilder<SettingsVariables, bool?, QQueryOperations>
      windowOnTopProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windowOnTop');
    });
  }
}
