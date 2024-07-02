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
  properties: {},
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
) {}
SettingsVariables _settingsVariablesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SettingsVariables();
  object.id = id;
  return object;
}

P _settingsVariablesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
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
}

extension SettingsVariablesQueryObject
    on QueryBuilder<SettingsVariables, SettingsVariables, QFilterCondition> {}

extension SettingsVariablesQueryLinks
    on QueryBuilder<SettingsVariables, SettingsVariables, QFilterCondition> {}

extension SettingsVariablesQuerySortBy
    on QueryBuilder<SettingsVariables, SettingsVariables, QSortBy> {}

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
}

extension SettingsVariablesQueryWhereDistinct
    on QueryBuilder<SettingsVariables, SettingsVariables, QDistinct> {}

extension SettingsVariablesQueryProperty
    on QueryBuilder<SettingsVariables, SettingsVariables, QQueryProperty> {
  QueryBuilder<SettingsVariables, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
