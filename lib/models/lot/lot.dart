import 'package:isar/isar.dart';

part 'lot.g.dart';

@collection
class Lot {
  Id id;
  String lotNumber;
  int value;
  short totalShare;
  late short remainingShare;
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
