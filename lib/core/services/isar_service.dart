import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class IsarService {
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [RealEstateSchema],
      directory: dir.path,
    );
    final realEstate = isar.realEstates;
  }
}
