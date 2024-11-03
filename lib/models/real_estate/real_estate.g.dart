// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estate.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRealEstateCollection on Isar {
  IsarCollection<Lot> get realEstates => this.collection();
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
      type: IsarType.float,
    ),
    r'totalShare': PropertySchema(
      id: 3,
      name: r'totalShare',
      type: IsarType.float,
    ),
    r'value': PropertySchema(
      id: 4,
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
    r'city_propertyNumber': IndexSchema(
      id: -5138013216022033302,
      name: r'city_propertyNumber',
      unique: false,
      replace: false,
      properties: [
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
  Lot object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.city.length * 3;
  bytesCount += 3 + object.propertyNumber.length * 3;
  return bytesCount;
}

void _realEstateSerialize(
  Lot object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.city);
  writer.writeString(offsets[1], object.propertyNumber);
  writer.writeFloat(offsets[2], object.remainingShare);
  writer.writeFloat(offsets[3], object.totalShare);
  writer.writeDouble(offsets[4], object.value);
}

Lot _realEstateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Lot(
    city: reader.readString(offsets[0]),
    id: id,
    propertyNumber: reader.readString(offsets[1]),
    totalShare: reader.readFloat(offsets[3]),
    value: reader.readDouble(offsets[4]),
  );
  object.remainingShare = reader.readFloat(offsets[2]);
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
      return (reader.readFloat(offset)) as P;
    case 3:
      return (reader.readFloat(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _realEstateGetId(Lot object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _realEstateGetLinks(Lot object) {
  return [];
}

void _realEstateAttach(IsarCollection<dynamic> col, Id id, Lot object) {
  object.id = id;
}

extension RealEstateQueryWhereSort on QueryBuilder<Lot, Lot, QWhere> {
  QueryBuilder<Lot, Lot, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RealEstateQueryWhere on QueryBuilder<Lot, Lot, QWhereClause> {
  QueryBuilder<Lot, Lot, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Lot, Lot, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Lot, Lot, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Lot, Lot, QAfterWhereClause> idBetween(
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

  QueryBuilder<Lot, Lot, QAfterWhereClause> cityEqualToAnyPropertyNumber(
      String city) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'city_propertyNumber',
        value: [city],
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterWhereClause> cityNotEqualToAnyPropertyNumber(
      String city) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'city_propertyNumber',
              lower: [],
              upper: [city],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'city_propertyNumber',
              lower: [city],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'city_propertyNumber',
              lower: [city],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'city_propertyNumber',
              lower: [],
              upper: [city],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Lot, Lot, QAfterWhereClause> cityPropertyNumberEqualTo(
      String city, String propertyNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'city_propertyNumber',
        value: [city, propertyNumber],
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterWhereClause> cityEqualToPropertyNumberNotEqualTo(
      String city, String propertyNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'city_propertyNumber',
              lower: [city],
              upper: [city, propertyNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'city_propertyNumber',
              lower: [city, propertyNumber],
              includeLower: false,
              upper: [city],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'city_propertyNumber',
              lower: [city, propertyNumber],
              includeLower: false,
              upper: [city],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'city_propertyNumber',
              lower: [city],
              upper: [city, propertyNumber],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RealEstateQueryFilter on QueryBuilder<Lot, Lot, QFilterCondition> {
  QueryBuilder<Lot, Lot, QAfterFilterCondition> cityEqualTo(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> cityGreaterThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> cityLessThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> cityBetween(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> cityStartsWith(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> cityEndsWith(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> cityContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> cityMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'city',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> cityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> cityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> propertyNumberEqualTo(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> propertyNumberGreaterThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> propertyNumberLessThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> propertyNumberBetween(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> propertyNumberStartsWith(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> propertyNumberEndsWith(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> propertyNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'propertyNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> propertyNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'propertyNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> propertyNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> propertyNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'propertyNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> remainingShareEqualTo(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> remainingShareGreaterThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> remainingShareLessThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> remainingShareBetween(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> totalShareEqualTo(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> totalShareGreaterThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> totalShareLessThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> totalShareBetween(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> valueEqualTo(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> valueGreaterThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> valueLessThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> valueBetween(
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

extension RealEstateQueryObject on QueryBuilder<Lot, Lot, QFilterCondition> {}

extension RealEstateQueryLinks on QueryBuilder<Lot, Lot, QFilterCondition> {}

extension RealEstateQuerySortBy on QueryBuilder<Lot, Lot, QSortBy> {
  QueryBuilder<Lot, Lot, QAfterSortBy> sortByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> sortByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> sortByPropertyNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyNumber', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> sortByPropertyNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyNumber', Sort.desc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> sortByRemainingShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingShare', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> sortByRemainingShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingShare', Sort.desc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> sortByTotalShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalShare', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> sortByTotalShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalShare', Sort.desc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension RealEstateQuerySortThenBy on QueryBuilder<Lot, Lot, QSortThenBy> {
  QueryBuilder<Lot, Lot, QAfterSortBy> thenByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByPropertyNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyNumber', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByPropertyNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyNumber', Sort.desc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByRemainingShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingShare', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByRemainingShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainingShare', Sort.desc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByTotalShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalShare', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByTotalShareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalShare', Sort.desc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension RealEstateQueryWhereDistinct on QueryBuilder<Lot, Lot, QDistinct> {
  QueryBuilder<Lot, Lot, QDistinct> distinctByCity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'city', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Lot, Lot, QDistinct> distinctByPropertyNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Lot, Lot, QDistinct> distinctByRemainingShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remainingShare');
    });
  }

  QueryBuilder<Lot, Lot, QDistinct> distinctByTotalShare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalShare');
    });
  }

  QueryBuilder<Lot, Lot, QDistinct> distinctByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value');
    });
  }
}

extension RealEstateQueryProperty on QueryBuilder<Lot, Lot, QQueryProperty> {
  QueryBuilder<Lot, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Lot, String, QQueryOperations> cityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'city');
    });
  }

  QueryBuilder<Lot, String, QQueryOperations> propertyNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyNumber');
    });
  }

  QueryBuilder<Lot, double, QQueryOperations> remainingShareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remainingShare');
    });
  }

  QueryBuilder<Lot, double, QQueryOperations> totalShareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalShare');
    });
  }

  QueryBuilder<Lot, double, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}
