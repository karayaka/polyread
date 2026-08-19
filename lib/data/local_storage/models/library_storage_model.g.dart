// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_storage_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLibraryStorageModelCollection on Isar {
  IsarCollection<LibraryStorageModel> get libraryStorageModels =>
      this.collection();
}

const LibraryStorageModelSchema = CollectionSchema(
  name: r'LibraryStorageModel',
  id: 2945919200199540756,
  properties: {
    r'authors': PropertySchema(
      id: 0,
      name: r'authors',
      type: IsarType.stringList,
    ),
    r'bookCoverPath': PropertySchema(
      id: 1,
      name: r'bookCoverPath',
      type: IsarType.string,
    ),
    r'bookId': PropertySchema(id: 2, name: r'bookId', type: IsarType.string),
    r'bookPath': PropertySchema(
      id: 3,
      name: r'bookPath',
      type: IsarType.string,
    ),
    r'bookTitle': PropertySchema(
      id: 4,
      name: r'bookTitle',
      type: IsarType.string,
    ),
    r'langugeCode': PropertySchema(
      id: 5,
      name: r'langugeCode',
      type: IsarType.string,
    ),
    r'lastLocationCfi': PropertySchema(
      id: 6,
      name: r'lastLocationCfi',
      type: IsarType.string,
    ),
    r'lastUpdate': PropertySchema(
      id: 7,
      name: r'lastUpdate',
      type: IsarType.dateTime,
    ),
    r'progres': PropertySchema(id: 8, name: r'progres', type: IsarType.long),
    r'tags': PropertySchema(id: 9, name: r'tags', type: IsarType.stringList),
  },

  estimateSize: _libraryStorageModelEstimateSize,
  serialize: _libraryStorageModelSerialize,
  deserialize: _libraryStorageModelDeserialize,
  deserializeProp: _libraryStorageModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'bookId': IndexSchema(
      id: 3567540928881766442,
      name: r'bookId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bookId',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'bookTitle': IndexSchema(
      id: 4026098605829135594,
      name: r'bookTitle',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bookTitle',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'bookPath': IndexSchema(
      id: -1443576583343870635,
      name: r'bookPath',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bookPath',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'bookCoverPath': IndexSchema(
      id: 3331875602226367470,
      name: r'bookCoverPath',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bookCoverPath',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'langugeCode': IndexSchema(
      id: -8281175858596352395,
      name: r'langugeCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'langugeCode',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'authors': IndexSchema(
      id: 390125322301913738,
      name: r'authors',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'authors',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'lastLocationCfi': IndexSchema(
      id: -497697288986936041,
      name: r'lastLocationCfi',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastLocationCfi',
          type: IndexType.value,
          caseSensitive: true,
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
    r'tags': IndexSchema(
      id: 4029205728550669204,
      name: r'tags',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tags',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'lastUpdate': IndexSchema(
      id: -2443505817451631414,
      name: r'lastUpdate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastUpdate',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _libraryStorageModelGetId,
  getLinks: _libraryStorageModelGetLinks,
  attach: _libraryStorageModelAttach,
  version: '3.3.2',
);

int _libraryStorageModelEstimateSize(
  LibraryStorageModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.authors;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.bookCoverPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.bookId.length * 3;
  bytesCount += 3 + object.bookPath.length * 3;
  bytesCount += 3 + object.bookTitle.length * 3;
  {
    final value = object.langugeCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastLocationCfi;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.tags;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _libraryStorageModelSerialize(
  LibraryStorageModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.authors);
  writer.writeString(offsets[1], object.bookCoverPath);
  writer.writeString(offsets[2], object.bookId);
  writer.writeString(offsets[3], object.bookPath);
  writer.writeString(offsets[4], object.bookTitle);
  writer.writeString(offsets[5], object.langugeCode);
  writer.writeString(offsets[6], object.lastLocationCfi);
  writer.writeDateTime(offsets[7], object.lastUpdate);
  writer.writeLong(offsets[8], object.progres);
  writer.writeStringList(offsets[9], object.tags);
}

LibraryStorageModel _libraryStorageModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LibraryStorageModel();
  object.authors = reader.readStringList(offsets[0]);
  object.bookCoverPath = reader.readStringOrNull(offsets[1]);
  object.bookId = reader.readString(offsets[2]);
  object.bookPath = reader.readString(offsets[3]);
  object.bookTitle = reader.readString(offsets[4]);
  object.id = id;
  object.langugeCode = reader.readStringOrNull(offsets[5]);
  object.lastLocationCfi = reader.readStringOrNull(offsets[6]);
  object.lastUpdate = reader.readDateTime(offsets[7]);
  object.progres = reader.readLong(offsets[8]);
  object.tags = reader.readStringList(offsets[9]);
  return object;
}

P _libraryStorageModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _libraryStorageModelGetId(LibraryStorageModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _libraryStorageModelGetLinks(
  LibraryStorageModel object,
) {
  return [];
}

void _libraryStorageModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  LibraryStorageModel object,
) {
  object.id = id;
}

extension LibraryStorageModelQueryWhereSort
    on QueryBuilder<LibraryStorageModel, LibraryStorageModel, QWhere> {
  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhere>
  anyBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'bookId'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhere>
  anyBookTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'bookTitle'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhere>
  anyBookPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'bookPath'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhere>
  anyBookCoverPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'bookCoverPath'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhere>
  anyLangugeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'langugeCode'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhere>
  anyAuthorsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'authors'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhere>
  anyLastLocationCfi() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastLocationCfi'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhere>
  anyProgres() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'progres'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhere>
  anyTagsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'tags'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhere>
  anyLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastUpdate'),
      );
    });
  }
}

extension LibraryStorageModelQueryWhere
    on QueryBuilder<LibraryStorageModel, LibraryStorageModel, QWhereClause> {
  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
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

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
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

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookIdEqualTo(String bookId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookId', value: [bookId]),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookIdNotEqualTo(String bookId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookId',
                lower: [],
                upper: [bookId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookId',
                lower: [bookId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookId',
                lower: [bookId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookId',
                lower: [],
                upper: [bookId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookIdGreaterThan(String bookId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookId',
          lower: [bookId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookIdLessThan(String bookId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookId',
          lower: [],
          upper: [bookId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookIdBetween(
    String lowerBookId,
    String upperBookId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookId',
          lower: [lowerBookId],
          includeLower: includeLower,
          upper: [upperBookId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookIdStartsWith(String BookIdPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookId',
          lower: [BookIdPrefix],
          upper: ['$BookIdPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookId', value: ['']),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'bookId', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'bookId', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'bookId', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'bookId', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookTitleEqualTo(String bookTitle) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookTitle', value: [bookTitle]),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookTitleNotEqualTo(String bookTitle) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookTitle',
                lower: [],
                upper: [bookTitle],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookTitle',
                lower: [bookTitle],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookTitle',
                lower: [bookTitle],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookTitle',
                lower: [],
                upper: [bookTitle],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookTitleGreaterThan(String bookTitle, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookTitle',
          lower: [bookTitle],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookTitleLessThan(String bookTitle, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookTitle',
          lower: [],
          upper: [bookTitle],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookTitleBetween(
    String lowerBookTitle,
    String upperBookTitle, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookTitle',
          lower: [lowerBookTitle],
          includeLower: includeLower,
          upper: [upperBookTitle],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookTitleStartsWith(String BookTitlePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookTitle',
          lower: [BookTitlePrefix],
          upper: ['$BookTitlePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookTitle', value: ['']),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'bookTitle', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'bookTitle',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'bookTitle',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'bookTitle', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookPathEqualTo(String bookPath) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookPath', value: [bookPath]),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookPathNotEqualTo(String bookPath) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookPath',
                lower: [],
                upper: [bookPath],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookPath',
                lower: [bookPath],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookPath',
                lower: [bookPath],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookPath',
                lower: [],
                upper: [bookPath],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookPathGreaterThan(String bookPath, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookPath',
          lower: [bookPath],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookPathLessThan(String bookPath, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookPath',
          lower: [],
          upper: [bookPath],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookPathBetween(
    String lowerBookPath,
    String upperBookPath, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookPath',
          lower: [lowerBookPath],
          includeLower: includeLower,
          upper: [upperBookPath],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookPathStartsWith(String BookPathPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookPath',
          lower: [BookPathPrefix],
          upper: ['$BookPathPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookPath', value: ['']),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'bookPath', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'bookPath', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'bookPath', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'bookPath', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookCoverPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookCoverPath', value: [null]),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookCoverPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookCoverPath',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookCoverPathEqualTo(String? bookCoverPath) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'bookCoverPath',
          value: [bookCoverPath],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookCoverPathNotEqualTo(String? bookCoverPath) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookCoverPath',
                lower: [],
                upper: [bookCoverPath],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookCoverPath',
                lower: [bookCoverPath],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookCoverPath',
                lower: [bookCoverPath],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'bookCoverPath',
                lower: [],
                upper: [bookCoverPath],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookCoverPathGreaterThan(String? bookCoverPath, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookCoverPath',
          lower: [bookCoverPath],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookCoverPathLessThan(String? bookCoverPath, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookCoverPath',
          lower: [],
          upper: [bookCoverPath],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookCoverPathBetween(
    String? lowerBookCoverPath,
    String? upperBookCoverPath, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookCoverPath',
          lower: [lowerBookCoverPath],
          includeLower: includeLower,
          upper: [upperBookCoverPath],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookCoverPathStartsWith(String BookCoverPathPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'bookCoverPath',
          lower: [BookCoverPathPrefix],
          upper: ['$BookCoverPathPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookCoverPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookCoverPath', value: ['']),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  bookCoverPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'bookCoverPath',
                upper: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'bookCoverPath',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'bookCoverPath',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'bookCoverPath',
                upper: [''],
              ),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  langugeCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'langugeCode', value: [null]),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  langugeCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'langugeCode',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  langugeCodeEqualTo(String? langugeCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'langugeCode',
          value: [langugeCode],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  langugeCodeNotEqualTo(String? langugeCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'langugeCode',
                lower: [],
                upper: [langugeCode],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'langugeCode',
                lower: [langugeCode],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'langugeCode',
                lower: [langugeCode],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'langugeCode',
                lower: [],
                upper: [langugeCode],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  langugeCodeGreaterThan(String? langugeCode, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'langugeCode',
          lower: [langugeCode],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  langugeCodeLessThan(String? langugeCode, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'langugeCode',
          lower: [],
          upper: [langugeCode],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  langugeCodeBetween(
    String? lowerLangugeCode,
    String? upperLangugeCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'langugeCode',
          lower: [lowerLangugeCode],
          includeLower: includeLower,
          upper: [upperLangugeCode],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  langugeCodeStartsWith(String LangugeCodePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'langugeCode',
          lower: [LangugeCodePrefix],
          upper: ['$LangugeCodePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  langugeCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'langugeCode', value: ['']),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  langugeCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'langugeCode', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'langugeCode',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'langugeCode',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'langugeCode', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  authorsElementEqualTo(String authorsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'authors',
          value: [authorsElement],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  authorsElementNotEqualTo(String authorsElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'authors',
                lower: [],
                upper: [authorsElement],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'authors',
                lower: [authorsElement],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'authors',
                lower: [authorsElement],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'authors',
                lower: [],
                upper: [authorsElement],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  authorsElementGreaterThan(String authorsElement, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'authors',
          lower: [authorsElement],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  authorsElementLessThan(String authorsElement, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'authors',
          lower: [],
          upper: [authorsElement],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  authorsElementBetween(
    String lowerAuthorsElement,
    String upperAuthorsElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'authors',
          lower: [lowerAuthorsElement],
          includeLower: includeLower,
          upper: [upperAuthorsElement],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  authorsElementStartsWith(String AuthorsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'authors',
          lower: [AuthorsElementPrefix],
          upper: ['$AuthorsElementPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  authorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'authors', value: ['']),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  authorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'authors', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'authors', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'authors', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'authors', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastLocationCfiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'lastLocationCfi', value: [null]),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastLocationCfiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'lastLocationCfi',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastLocationCfiEqualTo(String? lastLocationCfi) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'lastLocationCfi',
          value: [lastLocationCfi],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastLocationCfiNotEqualTo(String? lastLocationCfi) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastLocationCfi',
                lower: [],
                upper: [lastLocationCfi],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastLocationCfi',
                lower: [lastLocationCfi],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastLocationCfi',
                lower: [lastLocationCfi],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastLocationCfi',
                lower: [],
                upper: [lastLocationCfi],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastLocationCfiGreaterThan(String? lastLocationCfi, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'lastLocationCfi',
          lower: [lastLocationCfi],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastLocationCfiLessThan(String? lastLocationCfi, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'lastLocationCfi',
          lower: [],
          upper: [lastLocationCfi],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastLocationCfiBetween(
    String? lowerLastLocationCfi,
    String? upperLastLocationCfi, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'lastLocationCfi',
          lower: [lowerLastLocationCfi],
          includeLower: includeLower,
          upper: [upperLastLocationCfi],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastLocationCfiStartsWith(String LastLocationCfiPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'lastLocationCfi',
          lower: [LastLocationCfiPrefix],
          upper: ['$LastLocationCfiPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastLocationCfiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'lastLocationCfi', value: ['']),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastLocationCfiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'lastLocationCfi',
                upper: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'lastLocationCfi',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'lastLocationCfi',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'lastLocationCfi',
                upper: [''],
              ),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  progresEqualTo(int progres) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'progres', value: [progres]),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  progresNotEqualTo(int progres) {
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

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  progresGreaterThan(int progres, {bool include = false}) {
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

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  progresLessThan(int progres, {bool include = false}) {
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

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  progresBetween(
    int lowerProgres,
    int upperProgres, {
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

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  tagsElementEqualTo(String tagsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'tags', value: [tagsElement]),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  tagsElementNotEqualTo(String tagsElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tags',
                lower: [],
                upper: [tagsElement],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tags',
                lower: [tagsElement],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tags',
                lower: [tagsElement],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tags',
                lower: [],
                upper: [tagsElement],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  tagsElementGreaterThan(String tagsElement, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'tags',
          lower: [tagsElement],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  tagsElementLessThan(String tagsElement, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'tags',
          lower: [],
          upper: [tagsElement],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  tagsElementBetween(
    String lowerTagsElement,
    String upperTagsElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'tags',
          lower: [lowerTagsElement],
          includeLower: includeLower,
          upper: [upperTagsElement],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  tagsElementStartsWith(String TagsElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'tags',
          lower: [TagsElementPrefix],
          upper: ['$TagsElementPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'tags', value: ['']),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'tags', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'tags', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'tags', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'tags', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastUpdateEqualTo(DateTime lastUpdate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'lastUpdate', value: [lastUpdate]),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastUpdateNotEqualTo(DateTime lastUpdate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastUpdate',
                lower: [],
                upper: [lastUpdate],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastUpdate',
                lower: [lastUpdate],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastUpdate',
                lower: [lastUpdate],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'lastUpdate',
                lower: [],
                upper: [lastUpdate],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastUpdateGreaterThan(DateTime lastUpdate, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'lastUpdate',
          lower: [lastUpdate],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastUpdateLessThan(DateTime lastUpdate, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'lastUpdate',
          lower: [],
          upper: [lastUpdate],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterWhereClause>
  lastUpdateBetween(
    DateTime lowerLastUpdate,
    DateTime upperLastUpdate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'lastUpdate',
          lower: [lowerLastUpdate],
          includeLower: includeLower,
          upper: [upperLastUpdate],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LibraryStorageModelQueryFilter
    on
        QueryBuilder<
          LibraryStorageModel,
          LibraryStorageModel,
          QFilterCondition
        > {
  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'authors'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'authors'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'authors',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'authors',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'authors',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'authors',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'authors',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'authors',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'authors',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'authors',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'authors', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'authors', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'authors', length, true, length, true);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'authors', 0, true, 0, true);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'authors', 0, false, 999999, true);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'authors', 0, true, length, include);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'authors', length, include, 999999, true);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  authorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookCoverPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'bookCoverPath'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookCoverPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'bookCoverPath'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookCoverPathEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'bookCoverPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookCoverPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'bookCoverPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookCoverPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'bookCoverPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookCoverPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'bookCoverPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookCoverPathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'bookCoverPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookCoverPathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'bookCoverPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookCoverPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'bookCoverPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookCoverPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'bookCoverPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookCoverPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bookCoverPath', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookCoverPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'bookCoverPath', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'bookId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'bookId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'bookId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'bookId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'bookId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'bookId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'bookId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'bookId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bookId', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'bookId', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookPathEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'bookPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'bookPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'bookPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'bookPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookPathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'bookPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookPathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'bookPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'bookPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'bookPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bookPath', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'bookPath', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookTitleEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'bookTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'bookTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'bookTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'bookTitle',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookTitleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'bookTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookTitleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'bookTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'bookTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'bookTitle',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bookTitle', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  bookTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'bookTitle', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
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

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
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

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
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

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  langugeCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'langugeCode'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  langugeCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'langugeCode'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  langugeCodeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'langugeCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  langugeCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'langugeCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  langugeCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'langugeCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  langugeCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'langugeCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  langugeCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'langugeCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  langugeCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'langugeCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  langugeCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'langugeCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  langugeCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'langugeCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  langugeCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'langugeCode', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  langugeCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'langugeCode', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastLocationCfiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastLocationCfi'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastLocationCfiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastLocationCfi'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastLocationCfiEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastLocationCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastLocationCfiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastLocationCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastLocationCfiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastLocationCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastLocationCfiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastLocationCfi',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastLocationCfiStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'lastLocationCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastLocationCfiEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'lastLocationCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastLocationCfiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'lastLocationCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastLocationCfiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'lastLocationCfi',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastLocationCfiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastLocationCfi', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastLocationCfiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lastLocationCfi', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastUpdateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdate', value: value),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastUpdateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastUpdate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastUpdateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastUpdate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  lastUpdateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastUpdate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  progresEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'progres', value: value),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  progresGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'progres',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  progresLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'progres',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  progresBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'progres',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tags'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tags'),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tags',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tags',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tags', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tags', value: ''),
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', length, true, length, true);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', 0, true, 0, true);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', 0, false, 999999, true);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', 0, true, length, include);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', length, include, 999999, true);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterFilterCondition>
  tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension LibraryStorageModelQueryObject
    on
        QueryBuilder<
          LibraryStorageModel,
          LibraryStorageModel,
          QFilterCondition
        > {}

extension LibraryStorageModelQueryLinks
    on
        QueryBuilder<
          LibraryStorageModel,
          LibraryStorageModel,
          QFilterCondition
        > {}

extension LibraryStorageModelQuerySortBy
    on QueryBuilder<LibraryStorageModel, LibraryStorageModel, QSortBy> {
  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByBookCoverPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookCoverPath', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByBookCoverPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookCoverPath', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByBookPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookPath', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByBookPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookPath', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByBookTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookTitle', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByBookTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookTitle', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByLangugeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langugeCode', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByLangugeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langugeCode', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByLastLocationCfi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLocationCfi', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByLastLocationCfiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLocationCfi', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByProgres() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progres', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  sortByProgresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progres', Sort.desc);
    });
  }
}

extension LibraryStorageModelQuerySortThenBy
    on QueryBuilder<LibraryStorageModel, LibraryStorageModel, QSortThenBy> {
  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByBookCoverPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookCoverPath', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByBookCoverPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookCoverPath', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByBookPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookPath', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByBookPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookPath', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByBookTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookTitle', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByBookTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookTitle', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByLangugeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langugeCode', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByLangugeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'langugeCode', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByLastLocationCfi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLocationCfi', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByLastLocationCfiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLocationCfi', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByProgres() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progres', Sort.asc);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QAfterSortBy>
  thenByProgresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progres', Sort.desc);
    });
  }
}

extension LibraryStorageModelQueryWhereDistinct
    on QueryBuilder<LibraryStorageModel, LibraryStorageModel, QDistinct> {
  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QDistinct>
  distinctByAuthors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authors');
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QDistinct>
  distinctByBookCoverPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'bookCoverPath',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QDistinct>
  distinctByBookId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QDistinct>
  distinctByBookPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QDistinct>
  distinctByBookTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QDistinct>
  distinctByLangugeCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'langugeCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QDistinct>
  distinctByLastLocationCfi({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'lastLocationCfi',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QDistinct>
  distinctByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdate');
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QDistinct>
  distinctByProgres() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progres');
    });
  }

  QueryBuilder<LibraryStorageModel, LibraryStorageModel, QDistinct>
  distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }
}

extension LibraryStorageModelQueryProperty
    on QueryBuilder<LibraryStorageModel, LibraryStorageModel, QQueryProperty> {
  QueryBuilder<LibraryStorageModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LibraryStorageModel, List<String>?, QQueryOperations>
  authorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authors');
    });
  }

  QueryBuilder<LibraryStorageModel, String?, QQueryOperations>
  bookCoverPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookCoverPath');
    });
  }

  QueryBuilder<LibraryStorageModel, String, QQueryOperations> bookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookId');
    });
  }

  QueryBuilder<LibraryStorageModel, String, QQueryOperations>
  bookPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookPath');
    });
  }

  QueryBuilder<LibraryStorageModel, String, QQueryOperations>
  bookTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookTitle');
    });
  }

  QueryBuilder<LibraryStorageModel, String?, QQueryOperations>
  langugeCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'langugeCode');
    });
  }

  QueryBuilder<LibraryStorageModel, String?, QQueryOperations>
  lastLocationCfiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastLocationCfi');
    });
  }

  QueryBuilder<LibraryStorageModel, DateTime, QQueryOperations>
  lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdate');
    });
  }

  QueryBuilder<LibraryStorageModel, int, QQueryOperations> progresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progres');
    });
  }

  QueryBuilder<LibraryStorageModel, List<String>?, QQueryOperations>
  tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }
}
