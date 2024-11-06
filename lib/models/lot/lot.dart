import 'package:isar/isar.dart';

part 'lot.g.dart';

@collection
class Lot {
  Id id;

  String lotNumber;

  double value;

  double totalShare;

  late double remainingShare;

  @Index(composite: [CompositeIndex('lotNumber')])
  int propertyId;

  Lot({
    this.id = Isar.autoIncrement,
    required this.lotNumber,
    required this.propertyId,
    required this.value,
    required this.totalShare,
    double? shareRemaining,
  }) {
    remainingShare = shareRemaining ?? totalShare;
  }
}
