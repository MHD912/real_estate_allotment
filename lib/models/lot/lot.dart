import 'package:isar/isar.dart';

part 'lot.g.dart';

@collection
class Lot {
  Id id;

  String lotNumber;

  double value;

  float totalShare;

  late float remainingShare;

  @Index(composite: [CompositeIndex('lotNumber')])
  int propertyId;

  Lot({
    this.id = Isar.autoIncrement,
    required this.lotNumber,
    required this.propertyId,
    required this.value,
    required this.totalShare,
  }) {
    remainingShare = totalShare;
  }
}
