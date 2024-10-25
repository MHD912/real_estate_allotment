// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estate_allotment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRealEstateAllotmentCollection on Isar {
  IsarCollection<RealEstateAllotment> get realEstateAllotments =>
      this.collection();
}

const RealEstateAllotmentSchema = CollectionSchema(
  name: r'RealEstateAllotment',
  id: 1602796998568827065,
  properties: {
    r'participationRate': PropertySchema(
      id: 0,
      name: r'participationRate',
      type: IsarType.double,
    ),
    r'propertyId': PropertySchema(
      id: 1,
      name: r'propertyId',
      type: IsarType.long,
    ),
    r'share': PropertySchema(
      id: 2,
      name: r'share',
      type: IsarType.long,
    ),
    r'stakeholderId': PropertySchema(
      id: 3,
      name: r'stakeholderId',
      type: IsarType.long,
    ),
    r'valueDue': PropertySchema(
      id: 4,
      name: r'valueDue',
      type: IsarType.long,
    ),
    r'valueReceived': PropertySchema(
      id: 5,
      name: r'valueReceived',
      type: IsarType.long,
    )
  },
  estimateSize: _realEstateAllotmentEstimateSize,
  serialize: _realEstateAllotmentSerialize,
  deserialize: _realEstateAllotmentDeserialize,
  deserializeProp: _realEstateAllotmentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _realEstateAllotmentGetId,
  getLinks: _realEstateAllotmentGetLinks,
  attach: _realEstateAllotmentAttach,
  version: '3.1.0+1',
);

int _realEstateAllotmentEstimateSize(
  RealEstateAllotment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _realEstateAllotmentSerialize(
  RealEstateAllotment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.participationRate);
  writer.writeLong(offsets[1], object.propertyId);
  writer.writeLong(offsets[2], object.share);
  writer.writeLong(offsets[3], object.stakeholderId);
  writer.writeLong(offsets[4], object.valueDue);
  writer.writeLong(offsets[5], object.valueReceived);
}

RealEstateAllotment _realEstateAllotmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RealEstateAllotment(
    id: id,
    participationRate: reader.readDouble(offsets[0]),
    propertyId: reader.readLong(offsets[1]),
    share: reader.readLong(offsets[2]),
    stakeholderId: reader.readLong(offsets[3]),
    valueDue: reader.readLong(offsets[4]),
    valueReceived: reader.readLongOrNull(offsets[5]),
  );
  return object;
}

P _realEstateAllotmentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _realEstateAllotmentGetId(RealEstateAllotment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _realEstateAllotmentGetLinks(
    RealEstateAllotment object) {
  return [];
}

void _realEstateAllotmentAttach(
    IsarCollection<dynamic> col, Id id, RealEstateAllotment object) {
  object.id = id;
}

extension RealEstateAllotmentQueryWhereSort
    on QueryBuilder<RealEstateAllotment, RealEstateAllotment, QWhere> {
  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RealEstateAllotmentQueryWhere
    on QueryBuilder<RealEstateAllotment, RealEstateAllotment, QWhereClause> {
  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterWhereClause>
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

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterWhereClause>
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

extension RealEstateAllotmentQueryFilter on QueryBuilder<RealEstateAllotment,
    RealEstateAllotment, QFilterCondition> {
  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
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

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
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

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
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

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      participationRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'participationRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      participationRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'participationRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      participationRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'participationRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      participationRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'participationRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      propertyIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyId',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      propertyIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyId',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      propertyIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyId',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      propertyIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      shareEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'share',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
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

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      shareLessThan(
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

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      shareBetween(
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

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      stakeholderIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeholderId',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
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

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
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

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
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

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      valueDueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valueDue',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      valueDueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valueDue',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      valueDueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valueDue',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      valueDueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valueDue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      valueReceivedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'valueReceived',
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      valueReceivedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'valueReceived',
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      valueReceivedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valueReceived',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      valueReceivedGreaterThan(
    int? value, {
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

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      valueReceivedLessThan(
    int? value, {
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

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterFilterCondition>
      valueReceivedBetween(
    int? lower,
    int? upper, {
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

extension RealEstateAllotmentQueryObject on QueryBuilder<RealEstateAllotment,
    RealEstateAllotment, QFilterCondition> {}

extension RealEstateAllotmentQueryLinks on QueryBuilder<RealEstateAllotment,
    RealEstateAllotment, QFilterCondition> {}

extension RealEstateAllotmentQuerySortBy
    on QueryBuilder<RealEstateAllotment, RealEstateAllotment, QSortBy> {
  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      sortByParticipationRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'participationRate', Sort.asc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      sortByParticipationRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'participationRate', Sort.desc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      sortByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.asc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      sortByPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.desc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      sortByShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'share', Sort.asc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      sortByShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'share', Sort.desc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      sortByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.asc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      sortByStakeholderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.desc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      sortByValueDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueDue', Sort.asc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      sortByValueDueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueDue', Sort.desc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      sortByValueReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueReceived', Sort.asc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      sortByValueReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueReceived', Sort.desc);
    });
  }
}

extension RealEstateAllotmentQuerySortThenBy
    on QueryBuilder<RealEstateAllotment, RealEstateAllotment, QSortThenBy> {
  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      thenByParticipationRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'participationRate', Sort.asc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      thenByParticipationRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'participationRate', Sort.desc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      thenByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.asc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      thenByPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.desc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      thenByShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'share', Sort.asc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      thenByShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'share', Sort.desc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      thenByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.asc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      thenByStakeholderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.desc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      thenByValueDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueDue', Sort.asc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      thenByValueDueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueDue', Sort.desc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      thenByValueReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueReceived', Sort.asc);
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QAfterSortBy>
      thenByValueReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueReceived', Sort.desc);
    });
  }
}

extension RealEstateAllotmentQueryWhereDistinct
    on QueryBuilder<RealEstateAllotment, RealEstateAllotment, QDistinct> {
  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QDistinct>
      distinctByParticipationRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'participationRate');
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QDistinct>
      distinctByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyId');
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QDistinct>
      distinctByShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'share');
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QDistinct>
      distinctByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeholderId');
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QDistinct>
      distinctByValueDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valueDue');
    });
  }

  QueryBuilder<RealEstateAllotment, RealEstateAllotment, QDistinct>
      distinctByValueReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valueReceived');
    });
  }
}

extension RealEstateAllotmentQueryProperty
    on QueryBuilder<RealEstateAllotment, RealEstateAllotment, QQueryProperty> {
  QueryBuilder<RealEstateAllotment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RealEstateAllotment, double, QQueryOperations>
      participationRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'participationRate');
    });
  }

  QueryBuilder<RealEstateAllotment, int, QQueryOperations>
      propertyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyId');
    });
  }

  QueryBuilder<RealEstateAllotment, int, QQueryOperations> shareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'share');
    });
  }

  QueryBuilder<RealEstateAllotment, int, QQueryOperations>
      stakeholderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeholderId');
    });
  }

  QueryBuilder<RealEstateAllotment, int, QQueryOperations> valueDueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valueDue');
    });
  }

  QueryBuilder<RealEstateAllotment, int?, QQueryOperations>
      valueReceivedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valueReceived');
    });
  }
}
