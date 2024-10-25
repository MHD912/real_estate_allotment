import 'package:isar/isar.dart';

part 'lot_allotment.g.dart';

@collection
class LotAllotment {
  Id id;
  int share;
  int shareValue;
  int valueReceived;
  int stakeholderId;
  int lotId;

  LotAllotment({
    this.id = Isar.autoIncrement,
    required this.share,
    required this.shareValue,
    required this.valueReceived,
    required this.stakeholderId,
    required this.lotId,
  });
}
