import 'package:isar/isar.dart';

part 'real_estate.g.dart';

@collection
class RealEstate {
  Id id;

  String propertyNumber;

  String city;

  double value;

  late double remainingValue;

  double totalShare;

  late double remainingShare;

  late DateTime createdDate;

  @Index(composite: [CompositeIndex('city'), CompositeIndex('propertyNumber')])
  int studyId;

  RealEstate({
    this.id = Isar.autoIncrement,
    required this.propertyNumber,
    required this.city,
    required this.value,
    required this.totalShare,
    required this.studyId,
    double? valueRemaining,
    double? shareRemaining,
    DateTime? dateCreated,
  }) {
    remainingValue = valueRemaining ?? value;
    remainingShare = shareRemaining ?? totalShare;
    createdDate = dateCreated ?? DateTime.now();
  }
}
