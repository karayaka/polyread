// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_book_storage_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExternalBookStorageModelCollection on Isar {
  IsarCollection<ExternalBookStorageModel> get externalBookStorageModels =>
      this.collection();
}

const ExternalBookStorageModelSchema = CollectionSchema(
  name: r'ExternalBookStorageModel',
  id: -5713786489307465987,
  properties: {
    r'modifiedDate': PropertySchema(
      id: 0,
      name: r'modifiedDate',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(id: 1, name: r'name', type: IsarType.string),
    r'path': PropertySchema(id: 2, name: r'path', type: IsarType.string),
  },

  estimateSize: _externalBookStorageModelEstimateSize,
  serialize: _externalBookStorageModelSerialize,
  deserialize: _externalBookStorageModelDeserialize,
  deserializeProp: _externalBookStorageModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'path': IndexSchema(
      id: 8756705481922369689,
      name: r'path',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'path',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'modifiedDate': IndexSchema(
      id: 6992144844647415930,
      name: r'modifiedDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'modifiedDate',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _externalBookStorageModelGetId,
  getLinks: _externalBookStorageModelGetLinks,
  attach: _externalBookStorageModelAttach,
  version: '3.3.0',
);

int _externalBookStorageModelEstimateSize(
  ExternalBookStorageModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.path;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _externalBookStorageModelSerialize(
  ExternalBookStorageModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.modifiedDate);
  writer.writeString(offsets[1], object.name);
  writer.writeString(offsets[2], object.path);
}

ExternalBookStorageModel _externalBookStorageModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExternalBookStorageModel(
    modifiedDate: reader.readDateTimeOrNull(offsets[0]),
    name: reader.readStringOrNull(offsets[1]),
    path: reader.readStringOrNull(offsets[2]),
  );
  object.id = id;
  return object;
}

P _externalBookStorageModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _externalBookStorageModelGetId(ExternalBookStorageModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _externalBookStorageModelGetLinks(
  ExternalBookStorageModel object,
) {
  return [];
}

void _externalBookStorageModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  ExternalBookStorageModel object,
) {
  object.id = id;
}

extension ExternalBookStorageModelQueryWhereSort
    on
        QueryBuilder<
          ExternalBookStorageModel,
          ExternalBookStorageModel,
          QWhere
        > {
  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterWhere>
  anyPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'path'),
      );
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterWhere>
  anyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'name'),
      );
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterWhere>
  anyModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'modifiedDate'),
      );
    });
  }
}

extension ExternalBookStorageModelQueryWhere
    on
        QueryBuilder<
          ExternalBookStorageModel,
          ExternalBookStorageModel,
          QWhereClause
        > {
  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  pathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'path', value: [null]),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  pathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'path',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  pathEqualTo(String? path) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'path', value: [path]),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  pathNotEqualTo(String? path) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'path',
                lower: [],
                upper: [path],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'path',
                lower: [path],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'path',
                lower: [path],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'path',
                lower: [],
                upper: [path],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  pathGreaterThan(String? path, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'path',
          lower: [path],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  pathLessThan(String? path, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'path',
          lower: [],
          upper: [path],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  pathBetween(
    String? lowerPath,
    String? upperPath, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'path',
          lower: [lowerPath],
          includeLower: includeLower,
          upper: [upperPath],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  pathStartsWith(String PathPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'path',
          lower: [PathPrefix],
          upper: ['$PathPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'path', value: ['']),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'path', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'path', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'path', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'path', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: [null]),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  nameEqualTo(String? name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: [name]),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  nameNotEqualTo(String? name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  nameGreaterThan(String? name, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [name],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  nameLessThan(String? name, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [],
          upper: [name],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  nameBetween(
    String? lowerName,
    String? upperName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [lowerName],
          includeLower: includeLower,
          upper: [upperName],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  nameStartsWith(String NamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [NamePrefix],
          upper: ['$NamePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: ['']),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'name', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'name', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'name', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'name', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  modifiedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'modifiedDate', value: [null]),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  modifiedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'modifiedDate',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  modifiedDateEqualTo(DateTime? modifiedDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'modifiedDate',
          value: [modifiedDate],
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  modifiedDateNotEqualTo(DateTime? modifiedDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'modifiedDate',
                lower: [],
                upper: [modifiedDate],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'modifiedDate',
                lower: [modifiedDate],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'modifiedDate',
                lower: [modifiedDate],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'modifiedDate',
                lower: [],
                upper: [modifiedDate],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  modifiedDateGreaterThan(DateTime? modifiedDate, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'modifiedDate',
          lower: [modifiedDate],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  modifiedDateLessThan(DateTime? modifiedDate, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'modifiedDate',
          lower: [],
          upper: [modifiedDate],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterWhereClause
  >
  modifiedDateBetween(
    DateTime? lowerModifiedDate,
    DateTime? upperModifiedDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'modifiedDate',
          lower: [lowerModifiedDate],
          includeLower: includeLower,
          upper: [upperModifiedDate],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ExternalBookStorageModelQueryFilter
    on
        QueryBuilder<
          ExternalBookStorageModel,
          ExternalBookStorageModel,
          QFilterCondition
        > {
  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  modifiedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'modifiedDate'),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  modifiedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'modifiedDate'),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  modifiedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'modifiedDate', value: value),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  modifiedDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'modifiedDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  modifiedDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'modifiedDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  modifiedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'modifiedDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'name'),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'name'),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  nameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  pathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'path'),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  pathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'path'),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  pathEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  pathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  pathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  pathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'path',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  pathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  pathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  pathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  pathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'path',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'path', value: ''),
      );
    });
  }

  QueryBuilder<
    ExternalBookStorageModel,
    ExternalBookStorageModel,
    QAfterFilterCondition
  >
  pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'path', value: ''),
      );
    });
  }
}

extension ExternalBookStorageModelQueryObject
    on
        QueryBuilder<
          ExternalBookStorageModel,
          ExternalBookStorageModel,
          QFilterCondition
        > {}

extension ExternalBookStorageModelQueryLinks
    on
        QueryBuilder<
          ExternalBookStorageModel,
          ExternalBookStorageModel,
          QFilterCondition
        > {}

extension ExternalBookStorageModelQuerySortBy
    on
        QueryBuilder<
          ExternalBookStorageModel,
          ExternalBookStorageModel,
          QSortBy
        > {
  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterSortBy>
  sortByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modifiedDate', Sort.asc);
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterSortBy>
  sortByModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modifiedDate', Sort.desc);
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterSortBy>
  sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterSortBy>
  sortByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterSortBy>
  sortByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }
}

extension ExternalBookStorageModelQuerySortThenBy
    on
        QueryBuilder<
          ExternalBookStorageModel,
          ExternalBookStorageModel,
          QSortThenBy
        > {
  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterSortBy>
  thenByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modifiedDate', Sort.asc);
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterSortBy>
  thenByModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modifiedDate', Sort.desc);
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterSortBy>
  thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterSortBy>
  thenByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QAfterSortBy>
  thenByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }
}

extension ExternalBookStorageModelQueryWhereDistinct
    on
        QueryBuilder<
          ExternalBookStorageModel,
          ExternalBookStorageModel,
          QDistinct
        > {
  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QDistinct>
  distinctByModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modifiedDate');
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QDistinct>
  distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExternalBookStorageModel, ExternalBookStorageModel, QDistinct>
  distinctByPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'path', caseSensitive: caseSensitive);
    });
  }
}

extension ExternalBookStorageModelQueryProperty
    on
        QueryBuilder<
          ExternalBookStorageModel,
          ExternalBookStorageModel,
          QQueryProperty
        > {
  QueryBuilder<ExternalBookStorageModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ExternalBookStorageModel, DateTime?, QQueryOperations>
  modifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modifiedDate');
    });
  }

  QueryBuilder<ExternalBookStorageModel, String?, QQueryOperations>
  nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ExternalBookStorageModel, String?, QQueryOperations>
  pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'path');
    });
  }
}
