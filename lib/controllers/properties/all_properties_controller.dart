import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class AllPropertiesController extends GetxController {
  final isar = Get.find<IsarService>().isar;

  List<RealEstate> getProperties() {
    return isar.realEstates.where().findAllSync();
  }
}
