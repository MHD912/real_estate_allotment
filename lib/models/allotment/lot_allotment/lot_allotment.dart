import 'package:isar/isar.dart';
import 'package:real_estate_allotment/models/allotment/allotment.dart';

part 'lot_allotment.g.dart';

@collection
class LotAllotment extends Allotment {
  @override
  Id id;

  @override
  double share;

  @override
  String shareholderName;

  @Index(composite: [CompositeIndex('shareholderName')])
  int lotId;

  @Index()
  int propertyAllotmentId;

  LotAllotment({
    this.id = Isar.autoIncrement,
    required this.share,
    required this.shareholderName,
    required this.lotId,
    required this.propertyAllotmentId,
  });
}
