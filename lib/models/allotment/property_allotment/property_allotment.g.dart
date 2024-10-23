// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_allotment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPropertyAllotmentCollection on Isar {
  IsarCollection<PropertyAllotment> get propertyAllotments => this.collection();
}

const PropertyAllotmentSchema = CollectionSchema(
  name: r'PropertyAllotment',
  id: -5897067006447682539,
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
  estimateSize: _propertyAllotmentEstimateSize,
  serialize: _propertyAllotmentSerialize,
  deserialize: _propertyAllotmentDeserialize,
  deserializeProp: _propertyAllotmentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _propertyAllotmentGetId,
  getLinks: _propertyAllotmentGetLinks,
  attach: _propertyAllotmentAttach,
  version: '3.1.0+1',
);

int _propertyAllotmentEstimateSize(
  PropertyAllotment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _propertyAllotmentSerialize(
  PropertyAllotment object,
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

PropertyAllotment _propertyAllotmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PropertyAllotment(
    participationRate: reader.readDouble(offsets[0]),
    propertyId: reader.readLong(offsets[1]),
    share: reader.readLong(offsets[2]),
    stakeholderId: reader.readLong(offsets[3]),
    valueDue: reader.readLong(offsets[4]),
    valueReceived: reader.readLongOrNull(offsets[5]),
  );
  object.id = id;
  return object;
}

P _propertyAllotmentDeserializeProp<P>(
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

Id _propertyAllotmentGetId(PropertyAllotment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _propertyAllotmentGetLinks(
    PropertyAllotment object) {
  return [];
}

void _propertyAllotmentAttach(
    IsarCollection<dynamic> col, Id id, PropertyAllotment object) {
  object.id = id;
}

extension PropertyAllotmentQueryWhereSort
    on QueryBuilder<PropertyAllotment, PropertyAllotment, QWhere> {
  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PropertyAllotmentQueryWhere
    on QueryBuilder<PropertyAllotment, PropertyAllotment, QWhereClause> {
  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterWhereClause>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterWhereClause>
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

extension PropertyAllotmentQueryFilter
    on QueryBuilder<PropertyAllotment, PropertyAllotment, QFilterCondition> {
  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
      propertyIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyId',
        value: value,
      ));
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
      shareEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'share',
        value: value,
      ));
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
      stakeholderIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeholderId',
        value: value,
      ));
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
      valueDueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valueDue',
        value: value,
      ));
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
      valueReceivedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'valueReceived',
      ));
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
      valueReceivedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'valueReceived',
      ));
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
      valueReceivedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valueReceived',
        value: value,
      ));
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterFilterCondition>
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

extension PropertyAllotmentQueryObject
    on QueryBuilder<PropertyAllotment, PropertyAllotment, QFilterCondition> {}

extension PropertyAllotmentQueryLinks
    on QueryBuilder<PropertyAllotment, PropertyAllotment, QFilterCondition> {}

extension PropertyAllotmentQuerySortBy
    on QueryBuilder<PropertyAllotment, PropertyAllotment, QSortBy> {
  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      sortByParticipationRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'participationRate', Sort.asc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      sortByParticipationRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'participationRate', Sort.desc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      sortByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.asc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      sortByPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.desc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      sortByShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'share', Sort.asc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      sortByShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'share', Sort.desc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      sortByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.asc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      sortByStakeholderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.desc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      sortByValueDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueDue', Sort.asc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      sortByValueDueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueDue', Sort.desc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      sortByValueReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueReceived', Sort.asc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      sortByValueReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueReceived', Sort.desc);
    });
  }
}

extension PropertyAllotmentQuerySortThenBy
    on QueryBuilder<PropertyAllotment, PropertyAllotment, QSortThenBy> {
  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      thenByParticipationRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'participationRate', Sort.asc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      thenByParticipationRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'participationRate', Sort.desc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      thenByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.asc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      thenByPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.desc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      thenByShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'share', Sort.asc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      thenByShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'share', Sort.desc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      thenByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.asc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      thenByStakeholderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.desc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      thenByValueDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueDue', Sort.asc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      thenByValueDueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueDue', Sort.desc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      thenByValueReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueReceived', Sort.asc);
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QAfterSortBy>
      thenByValueReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valueReceived', Sort.desc);
    });
  }
}

extension PropertyAllotmentQueryWhereDistinct
    on QueryBuilder<PropertyAllotment, PropertyAllotment, QDistinct> {
  QueryBuilder<PropertyAllotment, PropertyAllotment, QDistinct>
      distinctByParticipationRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'participationRate');
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QDistinct>
      distinctByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyId');
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QDistinct>
      distinctByShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'share');
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QDistinct>
      distinctByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeholderId');
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QDistinct>
      distinctByValueDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valueDue');
    });
  }

  QueryBuilder<PropertyAllotment, PropertyAllotment, QDistinct>
      distinctByValueReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valueReceived');
    });
  }
}

extension PropertyAllotmentQueryProperty
    on QueryBuilder<PropertyAllotment, PropertyAllotment, QQueryProperty> {
  QueryBuilder<PropertyAllotment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PropertyAllotment, double, QQueryOperations>
      participationRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'participationRate');
    });
  }

  QueryBuilder<PropertyAllotment, int, QQueryOperations> propertyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyId');
    });
  }

  QueryBuilder<PropertyAllotment, int, QQueryOperations> shareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'share');
    });
  }

  QueryBuilder<PropertyAllotment, int, QQueryOperations>
      stakeholderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeholderId');
    });
  }

  QueryBuilder<PropertyAllotment, int, QQueryOperations> valueDueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valueDue');
    });
  }

  QueryBuilder<PropertyAllotment, int?, QQueryOperations>
      valueReceivedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valueReceived');
    });
  }
}
