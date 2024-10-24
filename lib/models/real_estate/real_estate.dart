import 'package:isar/isar.dart';

part 'real_estate.g.dart';

@collection
class RealEstate {
  Id id = Isar.autoIncrement;

  short propertyId;
  short totalShare;
  String city;
  int value;
  late short remainingShare;

  RealEstate({
    required this.propertyId,
    required this.totalShare,
    required this.city,
    required this.value,
  }) {
    remainingShare = totalShare;
  }
}
