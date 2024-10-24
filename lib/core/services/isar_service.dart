import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:real_estate_allotment/models/allotment/lot_allotment/lot_allotment.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';
import 'package:real_estate_allotment/models/stakeholder/stakeholder.dart';

class IsarService extends GetxService {
  final Isar isar;

  IsarService({required this.isar});

  static Future<IsarService> init() async {
    final dir = await getApplicationSupportDirectory();
    final isar = await Isar.open(
      [
        RealEstateSchema,
        RealEstateAllotmentSchema,
        LotSchema,
        LotAllotmentSchema,
        StakeholderSchema,
      ],
      name: "app_db",
      directory: dir.path,
    );
    return IsarService(isar: isar);
  }
}
