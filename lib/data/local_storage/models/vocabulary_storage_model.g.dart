// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_storage_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVocabularyStorageModelCollection on Isar {
  IsarCollection<VocabularyStorageModel> get vocabularyStorageModels =>
      this.collection();
}

const VocabularyStorageModelSchema = CollectionSchema(
  name: r'VocabularyStorageModel',
  id: 6410705626803270033,
  properties: {
    r'bookId': PropertySchema(id: 0, name: r'bookId', type: IsarType.string),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'desc': PropertySchema(id: 2, name: r'desc', type: IsarType.string),
    r'languageCode': PropertySchema(
      id: 3,
      name: r'languageCode',
      type: IsarType.string,
    ),
    r'onLearnVocabulary': PropertySchema(
      id: 4,
      name: r'onLearnVocabulary',
      type: IsarType.bool,
    ),
    r'onShowVocabulary': PropertySchema(
      id: 5,
      name: r'onShowVocabulary',
      type: IsarType.bool,
    ),
    r'sourceWord': PropertySchema(
      id: 6,
      name: r'sourceWord',
      type: IsarType.string,
    ),
    r'text': PropertySchema(id: 7, name: r'text', type: IsarType.string),
  },

  estimateSize: _vocabularyStorageModelEstimateSize,
  serialize: _vocabularyStorageModelSerialize,
  deserialize: _vocabularyStorageModelDeserialize,
  deserializeProp: _vocabularyStorageModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'onShowVocabulary': IndexSchema(
      id: -3949242991817589606,
      name: r'onShowVocabulary',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'onShowVocabulary',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'onLearnVocabulary': IndexSchema(
      id: -1501229075833811453,
      name: r'onLearnVocabulary',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'onLearnVocabulary',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
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
    r'sourceWord': IndexSchema(
      id: -6195775984743901867,
      name: r'sourceWord',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sourceWord',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'text': IndexSchema(
      id: 5145922347574273553,
      name: r'text',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'text',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'desc': IndexSchema(
      id: 2795170529049215929,
      name: r'desc',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'desc',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'languageCode': IndexSchema(
      id: -2261715960661104426,
      name: r'languageCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'languageCode',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _vocabularyStorageModelGetId,
  getLinks: _vocabularyStorageModelGetLinks,
  attach: _vocabularyStorageModelAttach,
  version: '3.3.0',
);

int _vocabularyStorageModelEstimateSize(
  VocabularyStorageModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bookId.length * 3;
  {
    final value = object.desc;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.languageCode.length * 3;
  bytesCount += 3 + object.sourceWord.length * 3;
  bytesCount += 3 + object.text.length * 3;
  return bytesCount;
}

void _vocabularyStorageModelSerialize(
  VocabularyStorageModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bookId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.desc);
  writer.writeString(offsets[3], object.languageCode);
  writer.writeBool(offsets[4], object.onLearnVocabulary);
  writer.writeBool(offsets[5], object.onShowVocabulary);
  writer.writeString(offsets[6], object.sourceWord);
  writer.writeString(offsets[7], object.text);
}

VocabularyStorageModel _vocabularyStorageModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VocabularyStorageModel();
  object.bookId = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.desc = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.languageCode = reader.readString(offsets[3]);
  object.onLearnVocabulary = reader.readBool(offsets[4]);
  object.onShowVocabulary = reader.readBool(offsets[5]);
  object.sourceWord = reader.readString(offsets[6]);
  object.text = reader.readString(offsets[7]);
  return object;
}

P _vocabularyStorageModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vocabularyStorageModelGetId(VocabularyStorageModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vocabularyStorageModelGetLinks(
  VocabularyStorageModel object,
) {
  return [];
}

void _vocabularyStorageModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  VocabularyStorageModel object,
) {
  object.id = id;
}

extension VocabularyStorageModelQueryWhereSort
    on QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QWhere> {
  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterWhere>
  anyOnShowVocabulary() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'onShowVocabulary'),
      );
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterWhere>
  anyOnLearnVocabulary() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'onLearnVocabulary'),
      );
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterWhere>
  anyBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'bookId'),
      );
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterWhere>
  anySourceWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'sourceWord'),
      );
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterWhere>
  anyText() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'text'),
      );
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterWhere>
  anyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'desc'),
      );
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterWhere>
  anyLanguageCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'languageCode'),
      );
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterWhere>
  anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension VocabularyStorageModelQueryWhere
    on
        QueryBuilder<
          VocabularyStorageModel,
          VocabularyStorageModel,
          QWhereClause
        > {
  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
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
    VocabularyStorageModel,
    VocabularyStorageModel,
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
    VocabularyStorageModel,
    VocabularyStorageModel,
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
    VocabularyStorageModel,
    VocabularyStorageModel,
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
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  onShowVocabularyEqualTo(bool onShowVocabulary) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'onShowVocabulary',
          value: [onShowVocabulary],
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  onShowVocabularyNotEqualTo(bool onShowVocabulary) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'onShowVocabulary',
                lower: [],
                upper: [onShowVocabulary],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'onShowVocabulary',
                lower: [onShowVocabulary],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'onShowVocabulary',
                lower: [onShowVocabulary],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'onShowVocabulary',
                lower: [],
                upper: [onShowVocabulary],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  onLearnVocabularyEqualTo(bool onLearnVocabulary) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'onLearnVocabulary',
          value: [onLearnVocabulary],
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  onLearnVocabularyNotEqualTo(bool onLearnVocabulary) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'onLearnVocabulary',
                lower: [],
                upper: [onLearnVocabulary],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'onLearnVocabulary',
                lower: [onLearnVocabulary],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'onLearnVocabulary',
                lower: [onLearnVocabulary],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'onLearnVocabulary',
                lower: [],
                upper: [onLearnVocabulary],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  bookIdEqualTo(String bookId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookId', value: [bookId]),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  bookIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookId', value: ['']),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
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

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  sourceWordEqualTo(String sourceWord) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'sourceWord', value: [sourceWord]),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  sourceWordNotEqualTo(String sourceWord) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sourceWord',
                lower: [],
                upper: [sourceWord],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sourceWord',
                lower: [sourceWord],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sourceWord',
                lower: [sourceWord],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sourceWord',
                lower: [],
                upper: [sourceWord],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  sourceWordGreaterThan(String sourceWord, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'sourceWord',
          lower: [sourceWord],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  sourceWordLessThan(String sourceWord, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'sourceWord',
          lower: [],
          upper: [sourceWord],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  sourceWordBetween(
    String lowerSourceWord,
    String upperSourceWord, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'sourceWord',
          lower: [lowerSourceWord],
          includeLower: includeLower,
          upper: [upperSourceWord],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  sourceWordStartsWith(String SourceWordPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'sourceWord',
          lower: [SourceWordPrefix],
          upper: ['$SourceWordPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  sourceWordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'sourceWord', value: ['']),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  sourceWordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'sourceWord', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'sourceWord',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'sourceWord',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'sourceWord', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  textEqualTo(String text) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'text', value: [text]),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  textNotEqualTo(String text) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'text',
                lower: [],
                upper: [text],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'text',
                lower: [text],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'text',
                lower: [text],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'text',
                lower: [],
                upper: [text],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  textGreaterThan(String text, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'text',
          lower: [text],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  textLessThan(String text, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'text',
          lower: [],
          upper: [text],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  textBetween(
    String lowerText,
    String upperText, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'text',
          lower: [lowerText],
          includeLower: includeLower,
          upper: [upperText],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  textStartsWith(String TextPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'text',
          lower: [TextPrefix],
          upper: ['$TextPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'text', value: ['']),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'text', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'text', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'text', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'text', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  descIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'desc', value: [null]),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  descIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'desc',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  descEqualTo(String? desc) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'desc', value: [desc]),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  descNotEqualTo(String? desc) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'desc',
                lower: [],
                upper: [desc],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'desc',
                lower: [desc],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'desc',
                lower: [desc],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'desc',
                lower: [],
                upper: [desc],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  descGreaterThan(String? desc, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'desc',
          lower: [desc],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  descLessThan(String? desc, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'desc',
          lower: [],
          upper: [desc],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  descBetween(
    String? lowerDesc,
    String? upperDesc, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'desc',
          lower: [lowerDesc],
          includeLower: includeLower,
          upper: [upperDesc],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  descStartsWith(String DescPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'desc',
          lower: [DescPrefix],
          upper: ['$DescPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  descIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'desc', value: ['']),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  descIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'desc', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'desc', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'desc', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'desc', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  languageCodeEqualTo(String languageCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'languageCode',
          value: [languageCode],
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  languageCodeNotEqualTo(String languageCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'languageCode',
                lower: [],
                upper: [languageCode],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'languageCode',
                lower: [languageCode],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'languageCode',
                lower: [languageCode],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'languageCode',
                lower: [],
                upper: [languageCode],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  languageCodeGreaterThan(String languageCode, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'languageCode',
          lower: [languageCode],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  languageCodeLessThan(String languageCode, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'languageCode',
          lower: [],
          upper: [languageCode],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  languageCodeBetween(
    String lowerLanguageCode,
    String upperLanguageCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'languageCode',
          lower: [lowerLanguageCode],
          includeLower: includeLower,
          upper: [upperLanguageCode],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  languageCodeStartsWith(String LanguageCodePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'languageCode',
          lower: [LanguageCodePrefix],
          upper: ['$LanguageCodePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  languageCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'languageCode', value: ['']),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  languageCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'languageCode',
                upper: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'languageCode',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'languageCode',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'languageCode',
                upper: [''],
              ),
            );
      }
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'createdAt', value: [createdAt]),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [],
                upper: [createdAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [createdAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [createdAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createdAt',
                lower: [],
                upper: [createdAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  createdAtGreaterThan(DateTime createdAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [createdAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  createdAtLessThan(DateTime createdAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [],
          upper: [createdAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterWhereClause
  >
  createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createdAt',
          lower: [lowerCreatedAt],
          includeLower: includeLower,
          upper: [upperCreatedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension VocabularyStorageModelQueryFilter
    on
        QueryBuilder<
          VocabularyStorageModel,
          VocabularyStorageModel,
          QFilterCondition
        > {
  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  bookIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bookId', value: ''),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  bookIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'bookId', value: ''),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  descIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'desc'),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  descIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'desc'),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  descEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'desc',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  descGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'desc',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  descLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'desc',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  descBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'desc',
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
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  descStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'desc',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  descEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'desc',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  descContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'desc',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  descMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'desc',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  descIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'desc', value: ''),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  descIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'desc', value: ''),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
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
    VocabularyStorageModel,
    VocabularyStorageModel,
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
    VocabularyStorageModel,
    VocabularyStorageModel,
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
    VocabularyStorageModel,
    VocabularyStorageModel,
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
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  languageCodeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'languageCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  languageCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'languageCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  languageCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'languageCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  languageCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'languageCode',
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
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  languageCodeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'languageCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  languageCodeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'languageCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  languageCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'languageCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  languageCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'languageCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  languageCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'languageCode', value: ''),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  languageCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'languageCode', value: ''),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  onLearnVocabularyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'onLearnVocabulary', value: value),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  onShowVocabularyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'onShowVocabulary', value: value),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  sourceWordEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sourceWord',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  sourceWordGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sourceWord',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  sourceWordLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sourceWord',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  sourceWordBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sourceWord',
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
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  sourceWordStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sourceWord',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  sourceWordEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sourceWord',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  sourceWordContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sourceWord',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  sourceWordMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sourceWord',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  sourceWordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sourceWord', value: ''),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  sourceWordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sourceWord', value: ''),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  textEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  textGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  textLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  textBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'text',
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
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  textStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  textEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'text',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'text',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'text', value: ''),
      );
    });
  }

  QueryBuilder<
    VocabularyStorageModel,
    VocabularyStorageModel,
    QAfterFilterCondition
  >
  textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'text', value: ''),
      );
    });
  }
}

extension VocabularyStorageModelQueryObject
    on
        QueryBuilder<
          VocabularyStorageModel,
          VocabularyStorageModel,
          QFilterCondition
        > {}

extension VocabularyStorageModelQueryLinks
    on
        QueryBuilder<
          VocabularyStorageModel,
          VocabularyStorageModel,
          QFilterCondition
        > {}

extension VocabularyStorageModelQuerySortBy
    on QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QSortBy> {
  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortByDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortByLanguageCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortByLanguageCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortByOnLearnVocabulary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onLearnVocabulary', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortByOnLearnVocabularyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onLearnVocabulary', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortByOnShowVocabulary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onShowVocabulary', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortByOnShowVocabularyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onShowVocabulary', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortBySourceWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceWord', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortBySourceWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceWord', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }
}

extension VocabularyStorageModelQuerySortThenBy
    on
        QueryBuilder<
          VocabularyStorageModel,
          VocabularyStorageModel,
          QSortThenBy
        > {
  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByLanguageCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByLanguageCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByOnLearnVocabulary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onLearnVocabulary', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByOnLearnVocabularyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onLearnVocabulary', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByOnShowVocabulary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onShowVocabulary', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByOnShowVocabularyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'onShowVocabulary', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenBySourceWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceWord', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenBySourceWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceWord', Sort.desc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QAfterSortBy>
  thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }
}

extension VocabularyStorageModelQueryWhereDistinct
    on QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QDistinct> {
  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QDistinct>
  distinctByBookId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QDistinct>
  distinctByDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'desc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QDistinct>
  distinctByLanguageCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'languageCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QDistinct>
  distinctByOnLearnVocabulary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onLearnVocabulary');
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QDistinct>
  distinctByOnShowVocabulary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'onShowVocabulary');
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QDistinct>
  distinctBySourceWord({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceWord', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VocabularyStorageModel, VocabularyStorageModel, QDistinct>
  distinctByText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }
}

extension VocabularyStorageModelQueryProperty
    on
        QueryBuilder<
          VocabularyStorageModel,
          VocabularyStorageModel,
          QQueryProperty
        > {
  QueryBuilder<VocabularyStorageModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VocabularyStorageModel, String, QQueryOperations>
  bookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookId');
    });
  }

  QueryBuilder<VocabularyStorageModel, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<VocabularyStorageModel, String?, QQueryOperations>
  descProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'desc');
    });
  }

  QueryBuilder<VocabularyStorageModel, String, QQueryOperations>
  languageCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'languageCode');
    });
  }

  QueryBuilder<VocabularyStorageModel, bool, QQueryOperations>
  onLearnVocabularyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onLearnVocabulary');
    });
  }

  QueryBuilder<VocabularyStorageModel, bool, QQueryOperations>
  onShowVocabularyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'onShowVocabulary');
    });
  }

  QueryBuilder<VocabularyStorageModel, String, QQueryOperations>
  sourceWordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceWord');
    });
  }

  QueryBuilder<VocabularyStorageModel, String, QQueryOperations>
  textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }
}
