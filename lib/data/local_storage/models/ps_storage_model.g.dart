// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ps_storage_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPsStorageModelCollection on Isar {
  IsarCollection<PsStorageModel> get psStorageModels => this.collection();
}

const PsStorageModelSchema = CollectionSchema(
  name: r'PsStorageModel',
  id: 2003071842882217828,
  properties: {
    r'bookId': PropertySchema(id: 0, name: r'bookId', type: IsarType.string),
    r'colorHex': PropertySchema(id: 1, name: r'colorHex', type: IsarType.long),
    r'date': PropertySchema(id: 2, name: r'date', type: IsarType.dateTime),
    r'pageCfi': PropertySchema(id: 3, name: r'pageCfi', type: IsarType.string),
    r'ps': PropertySchema(id: 4, name: r'ps', type: IsarType.string),
    r'psCfi': PropertySchema(id: 5, name: r'psCfi', type: IsarType.string),
    r'tags': PropertySchema(id: 6, name: r'tags', type: IsarType.stringList),
    r'text': PropertySchema(id: 7, name: r'text', type: IsarType.string),
    r'underline': PropertySchema(
      id: 8,
      name: r'underline',
      type: IsarType.bool,
    ),
  },

  estimateSize: _psStorageModelEstimateSize,
  serialize: _psStorageModelSerialize,
  deserialize: _psStorageModelDeserialize,
  deserializeProp: _psStorageModelDeserializeProp,
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
    r'psCfi': IndexSchema(
      id: 4636610599104639056,
      name: r'psCfi',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'psCfi',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'pageCfi': IndexSchema(
      id: -2709925271756818586,
      name: r'pageCfi',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'pageCfi',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'ps': IndexSchema(
      id: -6090199293828572994,
      name: r'ps',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'ps',
          type: IndexType.value,
          caseSensitive: true,
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
    r'colorHex': IndexSchema(
      id: 2188384667941088878,
      name: r'colorHex',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'colorHex',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'underline': IndexSchema(
      id: 7382405817616687168,
      name: r'underline',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'underline',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
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
  },
  links: {},
  embeddedSchemas: {},

  getId: _psStorageModelGetId,
  getLinks: _psStorageModelGetLinks,
  attach: _psStorageModelAttach,
  version: '3.3.0',
);

int _psStorageModelEstimateSize(
  PsStorageModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bookId.length * 3;
  {
    final value = object.pageCfi;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ps;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.psCfi;
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
  bytesCount += 3 + object.text.length * 3;
  return bytesCount;
}

void _psStorageModelSerialize(
  PsStorageModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bookId);
  writer.writeLong(offsets[1], object.colorHex);
  writer.writeDateTime(offsets[2], object.date);
  writer.writeString(offsets[3], object.pageCfi);
  writer.writeString(offsets[4], object.ps);
  writer.writeString(offsets[5], object.psCfi);
  writer.writeStringList(offsets[6], object.tags);
  writer.writeString(offsets[7], object.text);
  writer.writeBool(offsets[8], object.underline);
}

PsStorageModel _psStorageModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PsStorageModel();
  object.bookId = reader.readString(offsets[0]);
  object.colorHex = reader.readLongOrNull(offsets[1]);
  object.date = reader.readDateTime(offsets[2]);
  object.id = id;
  object.pageCfi = reader.readStringOrNull(offsets[3]);
  object.ps = reader.readStringOrNull(offsets[4]);
  object.psCfi = reader.readStringOrNull(offsets[5]);
  object.tags = reader.readStringList(offsets[6]);
  object.text = reader.readString(offsets[7]);
  object.underline = reader.readBool(offsets[8]);
  return object;
}

P _psStorageModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringList(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _psStorageModelGetId(PsStorageModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _psStorageModelGetLinks(PsStorageModel object) {
  return [];
}

void _psStorageModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  PsStorageModel object,
) {
  object.id = id;
}

extension PsStorageModelQueryWhereSort
    on QueryBuilder<PsStorageModel, PsStorageModel, QWhere> {
  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhere> anyBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'bookId'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhere> anyText() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'text'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhere> anyPsCfi() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'psCfi'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhere> anyPageCfi() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'pageCfi'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhere> anyPs() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IndexWhereClause.any(indexName: r'ps'));
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhere> anyTagsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'tags'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhere> anyColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'colorHex'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhere> anyUnderline() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'underline'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension PsStorageModelQueryWhere
    on QueryBuilder<PsStorageModel, PsStorageModel, QWhereClause> {
  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> bookIdEqualTo(
    String bookId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookId', value: [bookId]),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> bookIdBetween(
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  bookIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'bookId', value: ['']),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> textEqualTo(
    String text,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'text', value: [text]),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> textLessThan(
    String text, {
    bool include = false,
  }) {
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> textBetween(
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'text', value: ['']),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  psCfiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'psCfi', value: [null]),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  psCfiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'psCfi',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> psCfiEqualTo(
    String? psCfi,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'psCfi', value: [psCfi]),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  psCfiNotEqualTo(String? psCfi) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'psCfi',
                lower: [],
                upper: [psCfi],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'psCfi',
                lower: [psCfi],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'psCfi',
                lower: [psCfi],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'psCfi',
                lower: [],
                upper: [psCfi],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  psCfiGreaterThan(String? psCfi, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'psCfi',
          lower: [psCfi],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> psCfiLessThan(
    String? psCfi, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'psCfi',
          lower: [],
          upper: [psCfi],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> psCfiBetween(
    String? lowerPsCfi,
    String? upperPsCfi, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'psCfi',
          lower: [lowerPsCfi],
          includeLower: includeLower,
          upper: [upperPsCfi],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  psCfiStartsWith(String PsCfiPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'psCfi',
          lower: [PsCfiPrefix],
          upper: ['$PsCfiPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  psCfiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'psCfi', value: ['']),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  psCfiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'psCfi', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'psCfi', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'psCfi', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'psCfi', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  pageCfiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'pageCfi', value: [null]),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  pageCfiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'pageCfi',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  pageCfiEqualTo(String? pageCfi) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'pageCfi', value: [pageCfi]),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  pageCfiNotEqualTo(String? pageCfi) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'pageCfi',
                lower: [],
                upper: [pageCfi],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'pageCfi',
                lower: [pageCfi],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'pageCfi',
                lower: [pageCfi],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'pageCfi',
                lower: [],
                upper: [pageCfi],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  pageCfiGreaterThan(String? pageCfi, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'pageCfi',
          lower: [pageCfi],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  pageCfiLessThan(String? pageCfi, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'pageCfi',
          lower: [],
          upper: [pageCfi],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  pageCfiBetween(
    String? lowerPageCfi,
    String? upperPageCfi, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'pageCfi',
          lower: [lowerPageCfi],
          includeLower: includeLower,
          upper: [upperPageCfi],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  pageCfiStartsWith(String PageCfiPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'pageCfi',
          lower: [PageCfiPrefix],
          upper: ['$PageCfiPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  pageCfiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'pageCfi', value: ['']),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  pageCfiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'pageCfi', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'pageCfi', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'pageCfi', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'pageCfi', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> psIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'ps', value: [null]),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  psIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'ps',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> psEqualTo(
    String? ps,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'ps', value: [ps]),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> psNotEqualTo(
    String? ps,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ps',
                lower: [],
                upper: [ps],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ps',
                lower: [ps],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ps',
                lower: [ps],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ps',
                lower: [],
                upper: [ps],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> psGreaterThan(
    String? ps, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'ps',
          lower: [ps],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> psLessThan(
    String? ps, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'ps',
          lower: [],
          upper: [ps],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> psBetween(
    String? lowerPs,
    String? upperPs, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'ps',
          lower: [lowerPs],
          includeLower: includeLower,
          upper: [upperPs],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> psStartsWith(
    String PsPrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'ps',
          lower: [PsPrefix],
          upper: ['$PsPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> psIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'ps', value: ['']),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  psIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'ps', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'ps', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'ps', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'ps', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  tagsElementEqualTo(String tagsElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'tags', value: [tagsElement]),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'tags', value: ['']),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  colorHexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'colorHex', value: [null]),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  colorHexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'colorHex',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  colorHexEqualTo(int? colorHex) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'colorHex', value: [colorHex]),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  colorHexNotEqualTo(int? colorHex) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'colorHex',
                lower: [],
                upper: [colorHex],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'colorHex',
                lower: [colorHex],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'colorHex',
                lower: [colorHex],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'colorHex',
                lower: [],
                upper: [colorHex],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  colorHexGreaterThan(int? colorHex, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'colorHex',
          lower: [colorHex],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  colorHexLessThan(int? colorHex, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'colorHex',
          lower: [],
          upper: [colorHex],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  colorHexBetween(
    int? lowerColorHex,
    int? upperColorHex, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'colorHex',
          lower: [lowerColorHex],
          includeLower: includeLower,
          upper: [upperColorHex],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  underlineEqualTo(bool underline) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'underline', value: [underline]),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
  underlineNotEqualTo(bool underline) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'underline',
                lower: [],
                upper: [underline],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'underline',
                lower: [underline],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'underline',
                lower: [underline],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'underline',
                lower: [],
                upper: [underline],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> dateEqualTo(
    DateTime date,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'date', value: [date]),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterWhereClause> dateBetween(
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
}

extension PsStorageModelQueryFilter
    on QueryBuilder<PsStorageModel, PsStorageModel, QFilterCondition> {
  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  bookIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bookId', value: ''),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  bookIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'bookId', value: ''),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  colorHexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'colorHex'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  colorHexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'colorHex'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  colorHexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'colorHex', value: value),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  colorHexGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'colorHex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  colorHexLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'colorHex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  colorHexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'colorHex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'date', value: value),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  pageCfiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pageCfi'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  pageCfiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pageCfi'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  pageCfiEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pageCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  pageCfiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pageCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  pageCfiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pageCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  pageCfiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pageCfi',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  pageCfiStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pageCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  pageCfiEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pageCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  pageCfiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pageCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  pageCfiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pageCfi',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  pageCfiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pageCfi', value: ''),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  pageCfiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pageCfi', value: ''),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'ps'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'ps'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition> psEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'ps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psLessThan(String? value, {bool include = false, bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition> psBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ps',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'ps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'ps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'ps',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition> psMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'ps',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ps', value: ''),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'ps', value: ''),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psCfiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'psCfi'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psCfiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'psCfi'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psCfiEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'psCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psCfiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'psCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psCfiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'psCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psCfiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'psCfi',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psCfiStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'psCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psCfiEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'psCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psCfiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'psCfi',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psCfiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'psCfi',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psCfiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'psCfi', value: ''),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  psCfiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'psCfi', value: ''),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tags'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tags'),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tags', value: ''),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tags', value: ''),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', length, true, length, true);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', 0, true, 0, true);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', 0, false, 999999, true);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  tagsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', 0, true, length, include);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  tagsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', length, include, 999999, true);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
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

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'text', value: ''),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'text', value: ''),
      );
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterFilterCondition>
  underlineEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'underline', value: value),
      );
    });
  }
}

extension PsStorageModelQueryObject
    on QueryBuilder<PsStorageModel, PsStorageModel, QFilterCondition> {}

extension PsStorageModelQueryLinks
    on QueryBuilder<PsStorageModel, PsStorageModel, QFilterCondition> {}

extension PsStorageModelQuerySortBy
    on QueryBuilder<PsStorageModel, PsStorageModel, QSortBy> {
  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> sortByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy>
  sortByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> sortByColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy>
  sortByColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> sortByPageCfi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageCfi', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy>
  sortByPageCfiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageCfi', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> sortByPs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ps', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> sortByPsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ps', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> sortByPsCfi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'psCfi', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> sortByPsCfiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'psCfi', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> sortByUnderline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'underline', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy>
  sortByUnderlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'underline', Sort.desc);
    });
  }
}

extension PsStorageModelQuerySortThenBy
    on QueryBuilder<PsStorageModel, PsStorageModel, QSortThenBy> {
  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> thenByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy>
  thenByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> thenByColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy>
  thenByColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> thenByPageCfi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageCfi', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy>
  thenByPageCfiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageCfi', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> thenByPs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ps', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> thenByPsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ps', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> thenByPsCfi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'psCfi', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> thenByPsCfiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'psCfi', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy> thenByUnderline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'underline', Sort.asc);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QAfterSortBy>
  thenByUnderlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'underline', Sort.desc);
    });
  }
}

extension PsStorageModelQueryWhereDistinct
    on QueryBuilder<PsStorageModel, PsStorageModel, QDistinct> {
  QueryBuilder<PsStorageModel, PsStorageModel, QDistinct> distinctByBookId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QDistinct> distinctByColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorHex');
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QDistinct> distinctByPageCfi({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pageCfi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QDistinct> distinctByPs({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ps', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QDistinct> distinctByPsCfi({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'psCfi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QDistinct> distinctByText({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PsStorageModel, PsStorageModel, QDistinct>
  distinctByUnderline() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'underline');
    });
  }
}

extension PsStorageModelQueryProperty
    on QueryBuilder<PsStorageModel, PsStorageModel, QQueryProperty> {
  QueryBuilder<PsStorageModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PsStorageModel, String, QQueryOperations> bookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookId');
    });
  }

  QueryBuilder<PsStorageModel, int?, QQueryOperations> colorHexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorHex');
    });
  }

  QueryBuilder<PsStorageModel, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<PsStorageModel, String?, QQueryOperations> pageCfiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pageCfi');
    });
  }

  QueryBuilder<PsStorageModel, String?, QQueryOperations> psProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ps');
    });
  }

  QueryBuilder<PsStorageModel, String?, QQueryOperations> psCfiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'psCfi');
    });
  }

  QueryBuilder<PsStorageModel, List<String>?, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<PsStorageModel, String, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }

  QueryBuilder<PsStorageModel, bool, QQueryOperations> underlineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'underline');
    });
  }
}
