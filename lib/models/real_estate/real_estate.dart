import 'package:isar/isar.dart';

part 'real_estate.g.dart';

@collection
class RealEstate {
  Id id = Isar.autoIncrement;

  short propertyId;
  short remainingShare;
  short totalShare;
  String city;
  int value;

  RealEstate({
    required this.propertyId,
    required this.remainingShare,
    required this.totalShare,
    required this.city,
    required this.value,
  });
}
