import 'package:isar/isar.dart';

part 'real_estate.g.dart';

@collection
class RealEstate {
  Id id;

  String propertyNumber;

  @Index(composite: [CompositeIndex('propertyNumber')])
  String city;

  double value;

  float totalShare;

  late float remainingShare;

  RealEstate({
    this.id = Isar.autoIncrement,
    required this.propertyNumber,
    required this.city,
    required this.value,
    required this.totalShare,
  }) {
    remainingShare = totalShare;
  }
}
