import 'package:isar/isar.dart';

part 'real_estate.g.dart';

@collection
class RealEstate {
  Id id = Isar.autoIncrement;

  short realEstateId;
  int price;

  RealEstate({
    required this.realEstateId,
    required this.price,
  });
}
