// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lot.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLotCollection on Isar {
  IsarCollection<Lot> get lots => this.collection();
}

const LotSchema = CollectionSchema(
  name: r'Lot',
  id: 7106647697071035541,
  properties: {
    r'createdDate': PropertySchema(
      id: 0,
      name: r'createdDate',
      type: IsarType.dateTime,
    ),
    r'lotNumber': PropertySchema(
      id: 1,
      name: r'lotNumber',
      type: IsarType.string,
    ),
    r'propertyId': PropertySchema(
      id: 2,
      name: r'propertyId',
      type: IsarType.long,
    ),
    r'remainingShare': PropertySchema(
      id: 3,
      name: r'remainingShare',
      type: IsarType.double,
    ),
    r'totalShare': PropertySchema(
      id: 4,
      name: r'totalShare',
      type: IsarType.double,
    ),
    r'value': PropertySchema(
      id: 5,
      name: r'value',
      type: IsarType.double,
    )
  },
  estimateSize: _lotEstimateSize,
  serialize: _lotSerialize,
  deserialize: _lotDeserialize,
  deserializeProp: _lotDeserializeProp,
  idName: r'id',
  indexes: {
    r'propertyId_lotNumber': IndexSchema(
      id: 8382752368715285959,
      name: r'propertyId_lotNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'propertyId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'lotNumber',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _lotGetId,
  getLinks: _lotGetLinks,
  attach: _lotAttach,
  version: '3.1.0+1',
);

int _lotEstimateSize(
  Lot object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.lotNumber.length * 3;
  return bytesCount;
}

void _lotSerialize(
  Lot object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdDate);
  writer.writeString(offsets[1], object.lotNumber);
  writer.writeLong(offsets[2], object.propertyId);
  writer.writeDouble(offsets[3], object.remainingShare);
  writer.writeDouble(offsets[4], object.totalShare);
  writer.writeDouble(offsets[5], object.value);
}

Lot _lotDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Lot(
    id: id,
    lotNumber: reader.readString(offsets[1]),
    propertyId: reader.readLong(offsets[2]),
    totalShare: reader.readDouble(offsets[4]),
    value: reader.readDouble(offsets[5]),
  );
  object.createdDate = reader.readDateTime(offsets[0]);
  object.remainingShare = reader.readDouble(offsets[3]);
  return object;
}

P _lotDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lotGetId(Lot object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _lotGetLinks(Lot object) {
  return [];
}

void _lotAttach(IsarCollection<dynamic> col, Id id, Lot object) {
  object.id = id;
}

extension LotQueryWhereSort on QueryBuilder<Lot, Lot, QWhere> {
  QueryBuilder<Lot, Lot, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LotQueryWhere on QueryBuilder<Lot, Lot, QWhereClause> {
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

  QueryBuilder<Lot, Lot, QAfterWhereClause> propertyIdEqualToAnyLotNumber(
      int propertyId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'propertyId_lotNumber',
        value: [propertyId],
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterWhereClause> propertyIdNotEqualToAnyLotNumber(
      int propertyId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'propertyId_lotNumber',
              lower: [],
              upper: [propertyId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'propertyId_lotNumber',
              lower: [propertyId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'propertyId_lotNumber',
              lower: [propertyId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'propertyId_lotNumber',
              lower: [],
              upper: [propertyId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Lot, Lot, QAfterWhereClause> propertyIdGreaterThanAnyLotNumber(
    int propertyId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'propertyId_lotNumber',
        lower: [propertyId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterWhereClause> propertyIdLessThanAnyLotNumber(
    int propertyId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'propertyId_lotNumber',
        lower: [],
        upper: [propertyId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterWhereClause> propertyIdBetweenAnyLotNumber(
    int lowerPropertyId,
    int upperPropertyId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'propertyId_lotNumber',
        lower: [lowerPropertyId],
        includeLower: includeLower,
        upper: [upperPropertyId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterWhereClause> propertyIdLotNumberEqualTo(
      int propertyId, String lotNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'propertyId_lotNumber',
        value: [propertyId, lotNumber],
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterWhereClause>
      propertyIdEqualToLotNumberNotEqualTo(int propertyId, String lotNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'propertyId_lotNumber',
              lower: [propertyId],
              upper: [propertyId, lotNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'propertyId_lotNumber',
              lower: [propertyId, lotNumber],
              includeLower: false,
              upper: [propertyId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'propertyId_lotNumber',
              lower: [propertyId, lotNumber],
              includeLower: false,
              upper: [propertyId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'propertyId_lotNumber',
              lower: [propertyId],
              upper: [propertyId, lotNumber],
              includeUpper: false,
            ));
      }
    });
  }
}

extension LotQueryFilter on QueryBuilder<Lot, Lot, QFilterCondition> {
  QueryBuilder<Lot, Lot, QAfterFilterCondition> createdDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> createdDateGreaterThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> createdDateLessThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> createdDateBetween(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> lotNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> lotNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> lotNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> lotNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lotNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> lotNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> lotNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> lotNumberContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> lotNumberMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lotNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> lotNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lotNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> lotNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lotNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> propertyIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Lot, Lot, QAfterFilterCondition> propertyIdGreaterThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> propertyIdLessThan(
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

  QueryBuilder<Lot, Lot, QAfterFilterCondition> propertyIdBetween(
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

extension LotQueryObject on QueryBuilder<Lot, Lot, QFilterCondition> {}

extension LotQueryLinks on QueryBuilder<Lot, Lot, QFilterCondition> {}

extension LotQuerySortBy on QueryBuilder<Lot, Lot, QSortBy> {
  QueryBuilder<Lot, Lot, QAfterSortBy> sortByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> sortByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> sortByLotNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotNumber', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> sortByLotNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotNumber', Sort.desc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> sortByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> sortByPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.desc);
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

extension LotQuerySortThenBy on QueryBuilder<Lot, Lot, QSortThenBy> {
  QueryBuilder<Lot, Lot, QAfterSortBy> thenByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
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

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByLotNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotNumber', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByLotNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotNumber', Sort.desc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.asc);
    });
  }

  QueryBuilder<Lot, Lot, QAfterSortBy> thenByPropertyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyId', Sort.desc);
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

extension LotQueryWhereDistinct on QueryBuilder<Lot, Lot, QDistinct> {
  QueryBuilder<Lot, Lot, QDistinct> distinctByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdDate');
    });
  }

  QueryBuilder<Lot, Lot, QDistinct> distinctByLotNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lotNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Lot, Lot, QDistinct> distinctByPropertyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyId');
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

extension LotQueryProperty on QueryBuilder<Lot, Lot, QQueryProperty> {
  QueryBuilder<Lot, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Lot, DateTime, QQueryOperations> createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdDate');
    });
  }

  QueryBuilder<Lot, String, QQueryOperations> lotNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lotNumber');
    });
  }

  QueryBuilder<Lot, int, QQueryOperations> propertyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyId');
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
