import 'package:isar/isar.dart';

part 'lot.g.dart';

@collection
class Lot {
  Id id = Isar.autoIncrement;

  short lotId;
  short remainingShare;
  short totalShare;
  int propertyId;
  int value;

  Lot({
    required this.lotId,
    required this.remainingShare,
    required this.totalShare,
    required this.propertyId,
    required this.value,
  });
}
