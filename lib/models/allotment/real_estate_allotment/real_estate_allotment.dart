import 'package:isar/isar.dart';

part 'real_estate_allotment.g.dart';

@collection
class RealEstateAllotment {
  Id id;
  int share;
  int valueDue;
  double participationRate;
  int? valueReceived;
  int stakeholderId;
  int propertyId;

  RealEstateAllotment({
    this.id = Isar.autoIncrement,
    required this.participationRate,
    required this.share,
    required this.valueDue,
    this.valueReceived,
    required this.stakeholderId,
    required this.propertyId,
  });
}
