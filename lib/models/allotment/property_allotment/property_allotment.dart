import 'package:isar/isar.dart';

part 'property_allotment.g.dart';

@collection
class PropertyAllotment {
  Id id = Isar.autoIncrement;

  double participationRate;
  int share;
  int valueDue;
  int? valueReceived;
  int stakeholderId;
  int propertyId;

  PropertyAllotment({
    required this.participationRate,
    required this.share,
    required this.valueDue,
    required this.valueReceived,
    required this.stakeholderId,
    required this.propertyId,
  });
}
