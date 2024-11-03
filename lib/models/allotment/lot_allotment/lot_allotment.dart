import 'package:isar/isar.dart';
import 'package:real_estate_allotment/models/allotment/allotment.dart';

part 'lot_allotment.g.dart';

@collection
class LotAllotment extends Allotment {
  @override
  Id id;

  @override
  double share;

  double? shareValue;

  int stakeholderId;

  @Index(composite: [CompositeIndex('stakeholderId')])
  int lotId;

  LotAllotment({
    this.id = Isar.autoIncrement,
    required this.share,
    this.shareValue,
    required this.stakeholderId,
    required this.lotId,
  });
}
