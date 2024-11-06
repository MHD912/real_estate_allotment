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
    r'lotId': PropertySchema(
      id: 0,
      name: r'lotId',
      type: IsarType.long,
    ),
    r'share': PropertySchema(
      id: 1,
      name: r'share',
      type: IsarType.double,
    ),
    r'shareValue': PropertySchema(
      id: 2,
      name: r'shareValue',
      type: IsarType.double,
    ),
    r'stakeholderName': PropertySchema(
      id: 3,
      name: r'stakeholderName',
      type: IsarType.string,
    )
  },
  estimateSize: _lotAllotmentEstimateSize,
  serialize: _lotAllotmentSerialize,
  deserialize: _lotAllotmentDeserialize,
  deserializeProp: _lotAllotmentDeserializeProp,
  idName: r'id',
  indexes: {
    r'lotId_stakeholderName': IndexSchema(
      id: 2757893452927807943,
      name: r'lotId_stakeholderName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lotId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'stakeholderName',
          type: IndexType.hash,
          caseSensitive: true,
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
  bytesCount += 3 + object.stakeholderName.length * 3;
  return bytesCount;
}

void _lotAllotmentSerialize(
  LotAllotment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.lotId);
  writer.writeDouble(offsets[1], object.share);
  writer.writeDouble(offsets[2], object.shareValue);
  writer.writeString(offsets[3], object.stakeholderName);
}

LotAllotment _lotAllotmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LotAllotment(
    id: id,
    lotId: reader.readLong(offsets[0]),
    share: reader.readDouble(offsets[1]),
    shareValue: reader.readDouble(offsets[2]),
    stakeholderName: reader.readString(offsets[3]),
  );
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
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
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
      lotIdEqualToAnyStakeholderName(int lotId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lotId_stakeholderName',
        value: [lotId],
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      lotIdNotEqualToAnyStakeholderName(int lotId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_stakeholderName',
              lower: [],
              upper: [lotId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_stakeholderName',
              lower: [lotId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_stakeholderName',
              lower: [lotId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_stakeholderName',
              lower: [],
              upper: [lotId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      lotIdGreaterThanAnyStakeholderName(
    int lotId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lotId_stakeholderName',
        lower: [lotId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      lotIdLessThanAnyStakeholderName(
    int lotId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lotId_stakeholderName',
        lower: [],
        upper: [lotId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      lotIdBetweenAnyStakeholderName(
    int lowerLotId,
    int upperLotId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lotId_stakeholderName',
        lower: [lowerLotId],
        includeLower: includeLower,
        upper: [upperLotId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      lotIdStakeholderNameEqualTo(int lotId, String stakeholderName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lotId_stakeholderName',
        value: [lotId, stakeholderName],
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterWhereClause>
      lotIdEqualToStakeholderNameNotEqualTo(int lotId, String stakeholderName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_stakeholderName',
              lower: [lotId],
              upper: [lotId, stakeholderName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_stakeholderName',
              lower: [lotId, stakeholderName],
              includeLower: false,
              upper: [lotId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_stakeholderName',
              lower: [lotId, stakeholderName],
              includeLower: false,
              upper: [lotId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId_stakeholderName',
              lower: [lotId],
              upper: [lotId, stakeholderName],
              includeUpper: false,
            ));
      }
    });
  }
}

extension LotAllotmentQueryFilter
    on QueryBuilder<LotAllotment, LotAllotment, QFilterCondition> {
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
      shareValueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shareValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareValueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shareValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareValueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shareValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareValueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shareValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      stakeholderNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      stakeholderNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakeholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      stakeholderNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakeholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      stakeholderNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakeholderName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      stakeholderNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stakeholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      stakeholderNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stakeholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      stakeholderNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stakeholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      stakeholderNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stakeholderName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      stakeholderNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeholderName',
        value: '',
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      stakeholderNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stakeholderName',
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

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> sortByShareValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shareValue', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      sortByShareValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shareValue', Sort.desc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      sortByStakeholderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderName', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      sortByStakeholderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderName', Sort.desc);
    });
  }
}

extension LotAllotmentQuerySortThenBy
    on QueryBuilder<LotAllotment, LotAllotment, QSortThenBy> {
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

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> thenByShareValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shareValue', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      thenByShareValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shareValue', Sort.desc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      thenByStakeholderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderName', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      thenByStakeholderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderName', Sort.desc);
    });
  }
}

extension LotAllotmentQueryWhereDistinct
    on QueryBuilder<LotAllotment, LotAllotment, QDistinct> {
  QueryBuilder<LotAllotment, LotAllotment, QDistinct> distinctByLotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lotId');
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QDistinct> distinctByShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'share');
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QDistinct> distinctByShareValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shareValue');
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QDistinct> distinctByStakeholderName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeholderName',
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

  QueryBuilder<LotAllotment, int, QQueryOperations> lotIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lotId');
    });
  }

  QueryBuilder<LotAllotment, double, QQueryOperations> shareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'share');
    });
  }

  QueryBuilder<LotAllotment, double, QQueryOperations> shareValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shareValue');
    });
  }

  QueryBuilder<LotAllotment, String, QQueryOperations>
      stakeholderNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeholderName');
    });
  }
}
