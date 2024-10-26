import 'package:isar/isar.dart';

part 'lot_allotment.g.dart';

@collection
class LotAllotment {
  Id id;
  int share;
  int? shareValue;
  int stakeholderId;
  int lotId;

  LotAllotment({
    this.id = Isar.autoIncrement,
    required this.share,
    this.shareValue,
    required this.stakeholderId,
    required this.lotId,
  });
}
