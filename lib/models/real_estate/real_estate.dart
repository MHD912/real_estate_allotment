import 'package:isar/isar.dart';

part 'real_estate.g.dart';

@collection
class RealEstate {
  Id id;
  short propertyId;
  short totalShare;
  String city;
  int value;
  late short remainingShare;

  RealEstate({
    this.id = Isar.autoIncrement,
    required this.propertyId,
    required this.totalShare,
    required this.city,
    required this.value,
  }) {
    remainingShare = totalShare;
  }
}
