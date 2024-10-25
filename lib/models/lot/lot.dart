import 'package:isar/isar.dart';

part 'lot.g.dart';

@collection
class Lot {
  Id id;
  short lotId;
  short remainingShare;
  short totalShare;
  int propertyId;
  int value;

  Lot({
    this.id = Isar.autoIncrement,
    required this.lotId,
    required this.remainingShare,
    required this.totalShare,
    required this.propertyId,
    required this.value,
  });
}
