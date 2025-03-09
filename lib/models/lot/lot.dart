import 'package:isar/isar.dart';

part 'lot.g.dart';

@collection
class Lot {
  Id id;

  String lotNumber;

  double value;

  double totalShare;

  String? description;

  late double remainingShare;

  late DateTime createdDate;

  @Index(composite: [CompositeIndex('lotNumber')])
  int propertyId;

  Lot({
    this.id = Isar.autoIncrement,
    required this.lotNumber,
    required this.propertyId,
    required this.value,
    required this.totalShare,
    required this.description,
    double? shareRemaining,
    DateTime? dateCreated,
  }) {
    remainingShare = shareRemaining ?? totalShare;
    createdDate = dateCreated ?? DateTime.now();
  }
}
