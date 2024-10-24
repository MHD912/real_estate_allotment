import 'package:isar/isar.dart';

part 'real_estate_allotment.g.dart';

@collection
class RealEstateAllotment {
  Id id = Isar.autoIncrement;

  double participationRate;
  int share;
  int valueDue;
  int? valueReceived;
  int stakeholderId;
  int propertyId;

  RealEstateAllotment({
    required this.participationRate,
    required this.share,
    required this.valueDue,
    required this.valueReceived,
    required this.stakeholderId,
    required this.propertyId,
  });
}
