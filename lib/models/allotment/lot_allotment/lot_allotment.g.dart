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
      type: IsarType.long,
    ),
    r'shareValue': PropertySchema(
      id: 2,
      name: r'shareValue',
      type: IsarType.long,
    ),
    r'stakeholderId': PropertySchema(
      id: 3,
      name: r'stakeholderId',
      type: IsarType.long,
    ),
    r'valueReceived': PropertySchema(
      id: 4,
      name: r'valueReceived',
      type: IsarType.long,
    )
  },
  estimateSize: _lotAllotmentEstimateSize,
  serialize: _lotAllotmentSerialize,
  deserialize: _lotAllotmentDeserialize,
  deserializeProp: _lotAllotmentDeserializeProp,
  idName: r'id',
  indexes: {},
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
  return bytesCount;
}

void _lotAllotmentSerialize(
  LotAllotment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.lotId);
  writer.writeLong(offsets[1], object.share);
  writer.writeLong(offsets[2], object.shareValue);
  writer.writeLong(offsets[3], object.stakeholderId);
  writer.writeLong(offsets[4], object.valueReceived);
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
    share: reader.readLong(offsets[1]),
    shareValue: reader.readLong(offsets[2]),
    stakeholderId: reader.readLong(offsets[3]),
    valueReceived: reader.readLong(offsets[4]),
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
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
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
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'share',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'share',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition> shareLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'share',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition> shareBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'share',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shareValue',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shareValue',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shareValue',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      shareValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shareValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      stakeholderIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeholderId',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      stakeholderIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakeholderId',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      stakeholderIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakeholderId',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      stakeholderIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakeholderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      valueReceivedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valueReceived',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      valueReceivedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valueReceived',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      valueReceivedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valueReceived',
        value: value,
      ));
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterFilterCondition>
      valueReceivedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valueReceived',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> sortByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      sortByStakeholderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.desc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> sortByValueReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueReceived', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      sortByValueReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueReceived', Sort.desc);
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

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> thenByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      thenByStakeholderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.desc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy> thenByValueReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueReceived', Sort.asc);
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QAfterSortBy>
      thenByValueReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueReceived', Sort.desc);
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

  QueryBuilder<LotAllotment, LotAllotment, QDistinct>
      distinctByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeholderId');
    });
  }

  QueryBuilder<LotAllotment, LotAllotment, QDistinct>
      distinctByValueReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valueReceived');
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

  QueryBuilder<LotAllotment, int, QQueryOperations> shareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'share');
    });
  }

  QueryBuilder<LotAllotment, int, QQueryOperations> shareValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shareValue');
    });
  }

  QueryBuilder<LotAllotment, int, QQueryOperations> stakeholderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeholderId');
    });
  }

  QueryBuilder<LotAllotment, int, QQueryOperations> valueReceivedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valueReceived');
    });
  }
}
