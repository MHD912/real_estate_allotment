import 'package:isar/isar.dart';
import 'package:real_estate_allotment/models/allotment/allotment.dart';

part 'real_estate_allotment.g.dart';

@collection
class RealEstateAllotment extends Allotment {
  @override
  Id id;

  @override
  double share;

  double participationRate;

  double valueDue;

  double? valueReceived;

  @override
  String shareholderName;

  @Index(composite: [CompositeIndex('shareholderName')])
  int propertyId;

  RealEstateAllotment({
    this.id = Isar.autoIncrement,
    required this.share,
    required this.participationRate,
    required this.valueDue,
    required this.shareholderName,
    required this.propertyId,
    this.valueReceived,
  });
}
