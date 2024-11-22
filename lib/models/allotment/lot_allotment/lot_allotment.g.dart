// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lot_allotment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLotAllotmentCollection on Isar {
  IsarCollection<LotAllotment> get lotAllotments => this.collection();
}

const LotAllotmentSchema = CollectionSchema(
  name: r'LotAllotment',
  id: 3664845213729577363,
  properties: {
    r'createdDate': PropertySchema(
      id: 0,
      name: r'createdDate',
      type: IsarType.dateTime,
    ),
    r'lotId': PropertySchema(
      id: 1,
      name: r'lotId',
      type: IsarType.long,
    ),
    r'propertyAllotmentId': PropertySchema(
      id: 2,
      name: r'propertyAllotmentId',
      type: IsarType.long,
    ),
    r'share': PropertySchema(
      id: 3,
      name: r'share',
      type: IsarType.double,
    ),
    r'shareholderName': PropertySchema(
      id: 4,
      name: r'shareholderName',
      type: IsarType.string,
    )
  },
  estimateSize: _lotAllotmentEstimateSize,
  serialize: _lotAllotmentSerialize,
  deserialize: _lotAllotmentDeserialize,
  deserializeProp: _lotAllotmentDeserializeProp,
  idName: r'id',
  indexes: {
    r'lotId_shareholderName': IndexSchema(
      id: 1869420888657565483,
      name: r'lotId_shareholderName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lotId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'shareholderName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'propertyAllotmentId': IndexSchema(
      id: -3076202445873713557,
      name: r'propertyAllotmentId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'propertyAllotmentId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _lotAllotmentGetId,
  getLinks: _lotAllotmentGetLinks,
  attach: _lotAllotmentAttach,
  version: '3.1.0+1',
);

int _lotAllotmentEstimateSize(
  LotAllotment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.shareholderName.length * 3;
  return bytesCount;
}

void _lotAllotmentSerialize(
  LotAllotment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdDate);
  writer.writeLong(offsets[1], object.lotId);
  writer.writeLong(offsets[2], object.propertyAllotmentId);
  writer.writeDouble(offsets[3], object.share);
  writer.writeString(offsets[4], object.shareholderName);
}

LotAllotment _lotAllotmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LotAllotment(
    id: id,
    lotId: reader.readLong(offsets[1]),
    propertyAllotmentId: reader.readLong(offsets[2]),
    share: reader.readDouble(offsets[3]),
    shareholderName: reader.readString(offsets[4]),
  );
  object.createdDate = reader.readDateTime(offsets[0]);
  return object;
}

P _lotAllotmentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lotAllotmentGetId(LotAllotment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _lotAllotmentGetLinks(LotAllotment object) {
  return [];
}

void _lotAllotmentAttach(
    IsarCollection<dynamic> col, Id id, LotAllotment object) {
  object.id = id;
}

extension LotAllotmentQueryWhereSort
    on QueryBuilder<LotAllotment, LotAllotment, QWhere> {
  QueryBuilder<LotAllotment, LotAllotment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhere>
      anyPropertyAllotmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'propertyAllotmentId'),
      );
    });
  }
}

extension LotAllotmentQueryWhere
    on QueryBuilder<LotAllotment, LotAllotment, QWhereClause> {
  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause> idBetween(
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

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      lotIdEqualToAnyShareholderName(int lotId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lotId_shareholderName',
        value: [lotId],
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      lotIdNotEqualToAnyShareholderName(int lotId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_shareholderName',
              lower: [],
              upper: [lotId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_shareholderName',
              lower: [lotId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_shareholderName',
              lower: [lotId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_shareholderName',
              lower: [],
              upper: [lotId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      lotIdGreaterThanAnyShareholderName(
    int lotId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lotId_shareholderName',
        lower: [lotId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      lotIdLessThanAnyShareholderName(
    int lotId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lotId_shareholderName',
        lower: [],
        upper: [lotId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      lotIdBetweenAnyShareholderName(
    int lowerLotId,
    int upperLotId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lotId_shareholderName',
        lower: [lowerLotId],
        includeLower: includeLower,
        upper: [upperLotId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      lotIdShareholderNameEqualTo(int lotId, String shareholderName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lotId_shareholderName',
        value: [lotId, shareholderName],
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      lotIdEqualToShareholderNameNotEqualTo(int lotId, String shareholderName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_shareholderName',
              lower: [lotId],
              upper: [lotId, shareholderName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_shareholderName',
              lower: [lotId, shareholderName],
              includeLower: false,
              upper: [lotId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_shareholderName',
              lower: [lotId, shareholderName],
              includeLower: false,
              upper: [lotId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_shareholderName',
              lower: [lotId],
              upper: [lotId, shareholderName],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      propertyAllotmentIdEqualTo(int propertyAllotmentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'propertyAllotmentId',
        value: [propertyAllotmentId],
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      propertyAllotmentIdNotEqualTo(int propertyAllotmentId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'propertyAllotmentId',
              lower: [],
              upper: [propertyAllotmentId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'propertyAllotmentId',
              lower: [propertyAllotmentId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'propertyAllotmentId',
              lower: [propertyAllotmentId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'propertyAllotmentId',
              lower: [],
              upper: [propertyAllotmentId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      propertyAllotmentIdGreaterThan(
    int propertyAllotmentId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'propertyAllotmentId',
        lower: [propertyAllotmentId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      propertyAllotmentIdLessThan(
    int propertyAllotmentId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'propertyAllotmentId',
        lower: [],
        upper: [propertyAllotmentId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      propertyAllotmentIdBetween(
    int lowerPropertyAllotmentId,
    int upperPropertyAllotmentId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'propertyAllotmentId',
        lower: [lowerPropertyAllotmentId],
        includeLower: includeLower,
        upper: [upperPropertyAllotmentId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LotAllotmentQueryFilter
    on QueryBuilder<LotAllotment, LotAllotment, QFilterCondition> {
  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      createdDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      createdDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      createdDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      createdDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition> lotIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lotId',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      lotIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lotId',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition> lotIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lotId',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition> lotIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lotId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      propertyAllotmentIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyAllotmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      propertyAllotmentIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyAllotmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      propertyAllotmentIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyAllotmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      propertyAllotmentIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyAllotmentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition> shareEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'share',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'share',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition> shareLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'share',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition> shareBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'share',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareholderNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shareholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareholderNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shareholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareholderNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shareholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareholderNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shareholderName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareholderNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shareholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareholderNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shareholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareholderNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shareholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareholderNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shareholderName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareholderNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shareholderName',
        value: '',
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareholderNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shareholderName',
        value: '',
      ));
    });
  }
}

extension LotAllotmentQueryObject
    on QueryBuilder<LotAllotment, LotAllotment, QFilterCondition> {}

extension LotAllotmentQueryLinks
    on QueryBuilder<LotAllotment, LotAllotment, QFilterCondition> {}

extension LotAllotmentQuerySortBy
    on QueryBuilder<LotAllotment, LotAllotment, QSortBy> {
  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> sortByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      sortByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> sortByLotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotId', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> sortByLotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotId', Sort.desc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      sortByPropertyAllotmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAllotmentId', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      sortByPropertyAllotmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAllotmentId', Sort.desc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> sortByShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'share', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> sortByShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'share', Sort.desc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      sortByShareholderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shareholderName', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      sortByShareholderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shareholderName', Sort.desc);
    });
  }
}

extension LotAllotmentQuerySortThenBy
    on QueryBuilder<LotAllotment, LotAllotment, QSortThenBy> {
  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> thenByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      thenByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> thenByLotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotId', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> thenByLotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotId', Sort.desc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      thenByPropertyAllotmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAllotmentId', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      thenByPropertyAllotmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyAllotmentId', Sort.desc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> thenByShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'share', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> thenByShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'share', Sort.desc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      thenByShareholderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shareholderName', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      thenByShareholderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shareholderName', Sort.desc);
    });
  }
}

extension LotAllotmentQueryWhereDistinct
    on QueryBuilder<LotAllotment, LotAllotment, QDistinct> {
  QueryBuilder<LotAllotment, LotAllotment, QDistinct> distinctByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdDate');
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QDistinct> distinctByLotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lotId');
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QDistinct>
      distinctByPropertyAllotmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyAllotmentId');
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QDistinct> distinctByShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'share');
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QDistinct> distinctByShareholderName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shareholderName',
          caseSensitive: caseSensitive);
    });
  }
}

extension LotAllotmentQueryProperty
    on QueryBuilder<LotAllotment, LotAllotment, QQueryProperty> {
  QueryBuilder<LotAllotment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LotAllotment, DateTime, QQueryOperations> createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdDate');
    });
  }

  QueryBuilder<LotAllotment, int, QQueryOperations> lotIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lotId');
    });
  }

  QueryBuilder<LotAllotment, int, QQueryOperations>
      propertyAllotmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyAllotmentId');
    });
  }

  QueryBuilder<LotAllotment, double, QQueryOperations> shareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'share');
    });
  }

  QueryBuilder<LotAllotment, String, QQueryOperations>
      shareholderNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shareholderName');
    });
  }
}
