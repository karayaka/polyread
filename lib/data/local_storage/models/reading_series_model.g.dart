// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_series_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReadingSeriesModelCollection on Isar {
  IsarCollection<ReadingSeriesModel> get readingSeriesModels =>
      this.collection();
}

const ReadingSeriesModelSchema = CollectionSchema(
  name: r'ReadingSeriesModel',
  id: -4609915608129620958,
  properties: {
    r'date': PropertySchema(id: 0, name: r'date', type: IsarType.dateTime),
    r'progres': PropertySchema(id: 1, name: r'progres', type: IsarType.double),
    r'readingTime': PropertySchema(
      id: 2,
      name: r'readingTime',
      type: IsarType.long,
    ),
  },

  estimateSize: _readingSeriesModelEstimateSize,
  serialize: _readingSeriesModelSerialize,
  deserialize: _readingSeriesModelDeserialize,
  deserializeProp: _readingSeriesModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'progres': IndexSchema(
      id: 8141756673201974708,
      name: r'progres',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'progres',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'readingTime': IndexSchema(
      id: 5685628836306367638,
      name: r'readingTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'readingTime',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _readingSeriesModelGetId,
  getLinks: _readingSeriesModelGetLinks,
  attach: _readingSeriesModelAttach,
  version: '3.3.2',
);

int _readingSeriesModelEstimateSize(
  ReadingSeriesModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _readingSeriesModelSerialize(
  ReadingSeriesModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeDouble(offsets[1], object.progres);
  writer.writeLong(offsets[2], object.readingTime);
}

ReadingSeriesModel _readingSeriesModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReadingSeriesModel();
  object.date = reader.readDateTime(offsets[0]);
  object.id = id;
  object.progres = reader.readDouble(offsets[1]);
  object.readingTime = reader.readLong(offsets[2]);
  return object;
}

P _readingSeriesModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _readingSeriesModelGetId(ReadingSeriesModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _readingSeriesModelGetLinks(
  ReadingSeriesModel object,
) {
  return [];
}

void _readingSeriesModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  ReadingSeriesModel object,
) {
  object.id = id;
}

extension ReadingSeriesModelQueryWhereSort
    on QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QWhere> {
  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhere>
  anyProgres() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'progres'),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhere>
  anyReadingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'readingTime'),
      );
    });
  }
}

extension ReadingSeriesModelQueryWhere
    on QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QWhereClause> {
  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
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

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
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

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  dateEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'date', value: [date]),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  dateNotEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [],
                upper: [date],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [date],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [date],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [],
                upper: [date],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  dateGreaterThan(DateTime date, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'date',
          lower: [date],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  dateLessThan(DateTime date, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'date',
          lower: [],
          upper: [date],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'date',
          lower: [lowerDate],
          includeLower: includeLower,
          upper: [upperDate],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  progresEqualTo(double progres) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'progres', value: [progres]),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  progresNotEqualTo(double progres) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'progres',
                lower: [],
                upper: [progres],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'progres',
                lower: [progres],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'progres',
                lower: [progres],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'progres',
                lower: [],
                upper: [progres],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  progresGreaterThan(double progres, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'progres',
          lower: [progres],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  progresLessThan(double progres, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'progres',
          lower: [],
          upper: [progres],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  progresBetween(
    double lowerProgres,
    double upperProgres, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'progres',
          lower: [lowerProgres],
          includeLower: includeLower,
          upper: [upperProgres],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  readingTimeEqualTo(int readingTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'readingTime',
          value: [readingTime],
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  readingTimeNotEqualTo(int readingTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'readingTime',
                lower: [],
                upper: [readingTime],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'readingTime',
                lower: [readingTime],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'readingTime',
                lower: [readingTime],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'readingTime',
                lower: [],
                upper: [readingTime],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  readingTimeGreaterThan(int readingTime, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'readingTime',
          lower: [readingTime],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  readingTimeLessThan(int readingTime, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'readingTime',
          lower: [],
          upper: [readingTime],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterWhereClause>
  readingTimeBetween(
    int lowerReadingTime,
    int upperReadingTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'readingTime',
          lower: [lowerReadingTime],
          includeLower: includeLower,
          upper: [upperReadingTime],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ReadingSeriesModelQueryFilter
    on QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QFilterCondition> {
  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
  dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'date', value: value),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
  dateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'date',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
  dateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'date',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
  dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'date',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
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

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
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

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
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

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
  progresEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'progres',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
  progresGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'progres',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
  progresLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'progres',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
  progresBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'progres',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
  readingTimeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'readingTime', value: value),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
  readingTimeGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'readingTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
  readingTimeLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'readingTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterFilterCondition>
  readingTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'readingTime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ReadingSeriesModelQueryObject
    on QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QFilterCondition> {}

extension ReadingSeriesModelQueryLinks
    on QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QFilterCondition> {}

extension ReadingSeriesModelQuerySortBy
    on QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QSortBy> {
  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterSortBy>
  sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterSortBy>
  sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterSortBy>
  sortByProgres() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progres', Sort.asc);
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterSortBy>
  sortByProgresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progres', Sort.desc);
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterSortBy>
  sortByReadingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingTime', Sort.asc);
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterSortBy>
  sortByReadingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingTime', Sort.desc);
    });
  }
}

extension ReadingSeriesModelQuerySortThenBy
    on QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QSortThenBy> {
  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterSortBy>
  thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterSortBy>
  thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterSortBy>
  thenByProgres() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progres', Sort.asc);
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterSortBy>
  thenByProgresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progres', Sort.desc);
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterSortBy>
  thenByReadingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingTime', Sort.asc);
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QAfterSortBy>
  thenByReadingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readingTime', Sort.desc);
    });
  }
}

extension ReadingSeriesModelQueryWhereDistinct
    on QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QDistinct> {
  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QDistinct>
  distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QDistinct>
  distinctByProgres() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progres');
    });
  }

  QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QDistinct>
  distinctByReadingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'readingTime');
    });
  }
}

extension ReadingSeriesModelQueryProperty
    on QueryBuilder<ReadingSeriesModel, ReadingSeriesModel, QQueryProperty> {
  QueryBuilder<ReadingSeriesModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReadingSeriesModel, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ReadingSeriesModel, double, QQueryOperations> progresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progres');
    });
  }

  QueryBuilder<ReadingSeriesModel, int, QQueryOperations>
  readingTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'readingTime');
    });
  }
}
