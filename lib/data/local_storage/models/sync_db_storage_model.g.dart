// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_db_storage_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSyncDbStorageModelCollection on Isar {
  IsarCollection<SyncDbStorageModel> get syncDbStorageModels =>
      this.collection();
}

const SyncDbStorageModelSchema = CollectionSchema(
  name: r'SyncDbStorageModel',
  id: 1827928333749123117,
  properties: {
    r'lastSync': PropertySchema(
      id: 0,
      name: r'lastSync',
      type: IsarType.dateTime,
    ),
    r'tableName': PropertySchema(
      id: 1,
      name: r'tableName',
      type: IsarType.string,
    ),
  },

  estimateSize: _syncDbStorageModelEstimateSize,
  serialize: _syncDbStorageModelSerialize,
  deserialize: _syncDbStorageModelDeserialize,
  deserializeProp: _syncDbStorageModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'tableName': IndexSchema(
      id: -8793409932759015843,
      name: r'tableName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tableName',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'lastSync': IndexSchema(
      id: -4745920795443795874,
      name: r'lastSync',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastSync',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _syncDbStorageModelGetId,
  getLinks: _syncDbStorageModelGetLinks,
  attach: _syncDbStorageModelAttach,
  version: '3.3.0',
);

int _syncDbStorageModelEstimateSize(
  SyncDbStorageModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.tableName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _syncDbStorageModelSerialize(
  SyncDbStorageModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.lastSync);
  writer.writeString(offsets[1], object.tableName);
}

SyncDbStorageModel _syncDbStorageModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SyncDbStorageModel(
    tableName: reader.readStringOrNull(offsets[1]),
  );
  object.id = id;
  object.lastSync = reader.readDateTime(offsets[0]);
  return object;
}

P _syncDbStorageModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _syncDbStorageModelGetId(SyncDbStorageModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _syncDbStorageModelGetLinks(
  SyncDbStorageModel object,
) {
  return [];
}

void _syncDbStorageModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  SyncDbStorageModel object,
) {
  object.id = id;
}

extension SyncDbStorageModelQueryWhereSort
    on QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QWhere> {
  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhere>
  anyTableName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'tableName'),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhere>
  anyLastSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastSync'),
      );
    });
  }
}

extension SyncDbStorageModelQueryWhere
    on QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QWhereClause> {
  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
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

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  tableNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'tableName', value: [null]),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  tableNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'tableName',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  tableNameEqualTo(String? tableName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'tableName', value: [tableName]),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  tableNameNotEqualTo(String? tableName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tableName',
                lower: [],
                upper: [tableName],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tableName',
                lower: [tableName],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tableName',
                lower: [tableName],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tableName',
                lower: [],
                upper: [tableName],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  tableNameGreaterThan(String? tableName, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'tableName',
          lower: [tableName],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  tableNameLessThan(String? tableName, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'tableName',
          lower: [],
          upper: [tableName],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  tableNameBetween(
    String? lowerTableName,
    String? upperTableName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'tableName',
          lower: [lowerTableName],
          includeLower: includeLower,
          upper: [upperTableName],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  tableNameStartsWith(String TableNamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'tableName',
          lower: [TableNamePrefix],
          upper: ['$TableNamePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  tableNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'tableName', value: ['']),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  tableNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'tableName', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'tableName',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'tableName',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'tableName', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  lastSyncEqualTo(DateTime lastSync) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'lastSync', value: [lastSync]),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  lastSyncNotEqualTo(DateTime lastSync) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastSync',
                lower: [],
                upper: [lastSync],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastSync',
                lower: [lastSync],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastSync',
                lower: [lastSync],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastSync',
                lower: [],
                upper: [lastSync],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  lastSyncGreaterThan(DateTime lastSync, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'lastSync',
          lower: [lastSync],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  lastSyncLessThan(DateTime lastSync, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'lastSync',
          lower: [],
          upper: [lastSync],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterWhereClause>
  lastSyncBetween(
    DateTime lowerLastSync,
    DateTime upperLastSync, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'lastSync',
          lower: [lowerLastSync],
          includeLower: includeLower,
          upper: [upperLastSync],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension SyncDbStorageModelQueryFilter
    on QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QFilterCondition> {
  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  lastSyncEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastSync', value: value),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  lastSyncGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastSync',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  lastSyncLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastSync',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  lastSyncBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastSync',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  tableNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tableName'),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  tableNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tableName'),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  tableNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tableName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  tableNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tableName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  tableNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tableName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  tableNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tableName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  tableNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tableName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  tableNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tableName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  tableNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tableName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  tableNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tableName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  tableNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tableName', value: ''),
      );
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterFilterCondition>
  tableNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tableName', value: ''),
      );
    });
  }
}

extension SyncDbStorageModelQueryObject
    on QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QFilterCondition> {}

extension SyncDbStorageModelQueryLinks
    on QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QFilterCondition> {}

extension SyncDbStorageModelQuerySortBy
    on QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QSortBy> {
  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterSortBy>
  sortByLastSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.asc);
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterSortBy>
  sortByLastSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.desc);
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterSortBy>
  sortByTableName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableName', Sort.asc);
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterSortBy>
  sortByTableNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableName', Sort.desc);
    });
  }
}

extension SyncDbStorageModelQuerySortThenBy
    on QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QSortThenBy> {
  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterSortBy>
  thenByLastSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.asc);
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterSortBy>
  thenByLastSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.desc);
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterSortBy>
  thenByTableName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableName', Sort.asc);
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QAfterSortBy>
  thenByTableNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableName', Sort.desc);
    });
  }
}

extension SyncDbStorageModelQueryWhereDistinct
    on QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QDistinct> {
  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QDistinct>
  distinctByLastSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSync');
    });
  }

  QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QDistinct>
  distinctByTableName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tableName', caseSensitive: caseSensitive);
    });
  }
}

extension SyncDbStorageModelQueryProperty
    on QueryBuilder<SyncDbStorageModel, SyncDbStorageModel, QQueryProperty> {
  QueryBuilder<SyncDbStorageModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SyncDbStorageModel, DateTime, QQueryOperations>
  lastSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSync');
    });
  }

  QueryBuilder<SyncDbStorageModel, String?, QQueryOperations>
  tableNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tableName');
    });
  }
}
