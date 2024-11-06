// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estate.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRealEstateCollection on Isar {
  IsarCollection<RealEstate> get realEstates => this.collection();
}

const RealEstateSchema = CollectionSchema(
  name: r'RealEstate',
  id: -7012361204818025980,
  properties: {
    r'city': PropertySchema(
      id: 0,
      name: r'city',
      type: IsarType.string,
    ),
    r'propertyNumber': PropertySchema(
      id: 1,
      name: r'propertyNumber',
      type: IsarType.string,
    ),
    r'remainingShare': PropertySchema(
      id: 2,
      name: r'remainingShare',
      type: IsarType.double,
    ),
    r'remainingValue': PropertySchema(
      id: 3,
      name: r'remainingValue',
      type: IsarType.double,
    ),
    r'studyId': PropertySchema(
      id: 4,
      name: r'studyId',
      type: IsarType.long,
    ),
    r'totalShare': PropertySchema(
      id: 5,
      name: r'totalShare',
      type: IsarType.double,
    ),
    r'value': PropertySchema(
      id: 6,
      name: r'value',
      type: IsarType.double,
    )
  },
  estimateSize: _realEstateEstimateSize,
  serialize: _realEstateSerialize,
  deserialize: _realEstateDeserialize,
  deserializeProp: _realEstateDeserializeProp,
  idName: r'id',
  indexes: {
    r'studyId_city_propertyNumber': IndexSchema(
      id: -67422123526328532,
      name: r'studyId_city_propertyNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'studyId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'city',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'propertyNumber',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _realEstateGetId,
  getLinks: _realEstateGetLinks,
  attach: _realEstateAttach,
  version: '3.1.0+1',
);

int _realEstateEstimateSize(
  RealEstate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.city.length * 3;
  bytesCount += 3 + object.propertyNumber.length * 3;
  return bytesCount;
}

void _realEstateSerialize(
  RealEstate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.city);
  writer.writeString(offsets[1], object.propertyNumber);
  writer.writeDouble(offsets[2], object.remainingShare);
  writer.writeDouble(offsets[3], object.remainingValue);
  writer.writeLong(offsets[4], object.studyId);
  writer.writeDouble(offsets[5], object.totalShare);
  writer.writeDouble(offsets[6], object.value);
}

RealEstate _realEstateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RealEstate(
    city: reader.readString(offsets[0]),
    id: id,
    propertyNumber: reader.readString(offsets[1]),
    studyId: reader.readLong(offsets[4]),
    totalShare: reader.readDouble(offsets[5]),
    value: reader.readDouble(offsets[6]),
  );
  object.remainingShare = reader.readDouble(offsets[2]);
  object.remainingValue = reader.readDouble(offsets[3]);
  return object;
}

P _realEstateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _realEstateGetId(RealEstate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _realEstateGetLinks(RealEstate object) {
  return [];
}

void _realEstateAttach(IsarCollection<dynamic> col, Id id, RealEstate object) {
  object.id = id;
}

extension RealEstateQueryWhereSort
    on QueryBuilder<RealEstate, RealEstate, QWhere> {
  QueryBuilder<RealEstate, RealEstate, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RealEstateQueryWhere
    on QueryBuilder<RealEstate, RealEstate, QWhereClause> {
  QueryBuilder<RealEstate, RealEstate, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<RealEstate, RealEstate, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterWhereClause> idBetween(
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

  QueryBuilder<RealEstate, RealEstate, QAfterWhereClause>
      studyIdEqualToAnyCityPropertyNumber(int studyId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studyId_city_propertyNumber',
        value: [studyId],
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterWhereClause>
      studyIdNotEqualToAnyCityPropertyNumber(int studyId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studyId_city_propertyNumber',
              lower: [],
              upper: [studyId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studyId_city_propertyNumber',
              lower: [studyId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studyId_city_propertyNumber',
              lower: [studyId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studyId_city_propertyNumber',
              lower: [],
              upper: [studyId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterWhereClause>
      studyIdGreaterThanAnyCityPropertyNumber(
    int studyId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'studyId_city_propertyNumber',
        lower: [studyId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterWhereClause>
      studyIdLessThanAnyCityPropertyNumber(
    int studyId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'studyId_city_propertyNumber',
        lower: [],
        upper: [studyId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterWhereClause>
      studyIdBetweenAnyCityPropertyNumber(
    int lowerStudyId,
    int upperStudyId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'studyId_city_propertyNumber',
        lower: [lowerStudyId],
        includeLower: includeLower,
        upper: [upperStudyId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterWhereClause>
      studyIdCityEqualToAnyPropertyNumber(int studyId, String city) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studyId_city_propertyNumber',
        value: [studyId, city],
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterWhereClause>
      studyIdEqualToCityNotEqualToAnyPropertyNumber(int studyId, String city) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studyId_city_propertyNumber',
              lower: [studyId],
              upper: [studyId, city],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studyId_city_propertyNumber',
              lower: [studyId, city],
              includeLower: false,
              upper: [studyId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studyId_city_propertyNumber',
              lower: [studyId, city],
              includeLower: false,
              upper: [studyId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studyId_city_propertyNumber',
              lower: [studyId],
              upper: [studyId, city],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterWhereClause>
      studyIdCityPropertyNumberEqualTo(
          int studyId, String city, String propertyNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studyId_city_propertyNumber',
        value: [studyId, city, propertyNumber],
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterWhereClause>
      studyIdCityEqualToPropertyNumberNotEqualTo(
          int studyId, String city, String propertyNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studyId_city_propertyNumber',
              lower: [studyId, city],
              upper: [studyId, city, propertyNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studyId_city_propertyNumber',
              lower: [studyId, city, propertyNumber],
              includeLower: false,
              upper: [studyId, city],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studyId_city_propertyNumber',
              lower: [studyId, city, propertyNumber],
              includeLower: false,
              upper: [studyId, city],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studyId_city_propertyNumber',
              lower: [studyId, city],
              upper: [studyId, city, propertyNumber],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RealEstateQueryFilter
    on QueryBuilder<RealEstate, RealEstate, QFilterCondition> {
  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> cityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> cityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> cityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> cityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'city',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> cityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> cityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> cityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> cityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'city',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> cityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> cityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      propertyNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      propertyNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      propertyNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      propertyNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      propertyNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'propertyNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      propertyNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'propertyNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      propertyNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'propertyNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      propertyNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'propertyNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      propertyNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      propertyNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'propertyNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      remainingShareEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remainingShare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      remainingShareGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remainingShare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      remainingShareLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remainingShare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      remainingShareBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remainingShare',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      remainingValueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remainingValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      remainingValueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remainingValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      remainingValueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remainingValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      remainingValueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remainingValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> studyIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studyId',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      studyIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'studyId',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> studyIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'studyId',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> studyIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'studyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> totalShareEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalShare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      totalShareGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalShare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition>
      totalShareLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalShare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> totalShareBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalShare',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> valueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> valueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> valueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterFilterCondition> valueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension RealEstateQueryObject
    on QueryBuilder<RealEstate, RealEstate, QFilterCondition> {}

extension RealEstateQueryLinks
    on QueryBuilder<RealEstate, RealEstate, QFilterCondition> {}

extension RealEstateQuerySortBy
    on QueryBuilder<RealEstate, RealEstate, QSortBy> {
  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> sortByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> sortByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> sortByPropertyNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyNumber', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy>
      sortByPropertyNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyNumber', Sort.desc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> sortByRemainingShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingShare', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy>
      sortByRemainingShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingShare', Sort.desc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> sortByRemainingValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingValue', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy>
      sortByRemainingValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingValue', Sort.desc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> sortByStudyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studyId', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> sortByStudyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studyId', Sort.desc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> sortByTotalShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalShare', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> sortByTotalShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalShare', Sort.desc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension RealEstateQuerySortThenBy
    on QueryBuilder<RealEstate, RealEstate, QSortThenBy> {
  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> thenByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> thenByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> thenByPropertyNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyNumber', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy>
      thenByPropertyNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyNumber', Sort.desc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> thenByRemainingShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingShare', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy>
      thenByRemainingShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingShare', Sort.desc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> thenByRemainingValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingValue', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy>
      thenByRemainingValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingValue', Sort.desc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> thenByStudyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studyId', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> thenByStudyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studyId', Sort.desc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> thenByTotalShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalShare', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> thenByTotalShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalShare', Sort.desc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QAfterSortBy> thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension RealEstateQueryWhereDistinct
    on QueryBuilder<RealEstate, RealEstate, QDistinct> {
  QueryBuilder<RealEstate, RealEstate, QDistinct> distinctByCity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'city', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QDistinct> distinctByPropertyNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RealEstate, RealEstate, QDistinct> distinctByRemainingShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remainingShare');
    });
  }

  QueryBuilder<RealEstate, RealEstate, QDistinct> distinctByRemainingValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remainingValue');
    });
  }

  QueryBuilder<RealEstate, RealEstate, QDistinct> distinctByStudyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studyId');
    });
  }

  QueryBuilder<RealEstate, RealEstate, QDistinct> distinctByTotalShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalShare');
    });
  }

  QueryBuilder<RealEstate, RealEstate, QDistinct> distinctByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value');
    });
  }
}

extension RealEstateQueryProperty
    on QueryBuilder<RealEstate, RealEstate, QQueryProperty> {
  QueryBuilder<RealEstate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RealEstate, String, QQueryOperations> cityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'city');
    });
  }

  QueryBuilder<RealEstate, String, QQueryOperations> propertyNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyNumber');
    });
  }

  QueryBuilder<RealEstate, double, QQueryOperations> remainingShareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remainingShare');
    });
  }

  QueryBuilder<RealEstate, double, QQueryOperations> remainingValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remainingValue');
    });
  }

  QueryBuilder<RealEstate, int, QQueryOperations> studyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studyId');
    });
  }

  QueryBuilder<RealEstate, double, QQueryOperations> totalShareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalShare');
    });
  }

  QueryBuilder<RealEstate, double, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}
