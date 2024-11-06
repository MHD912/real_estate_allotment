import 'package:get/get.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';

abstract class FindAllotmentController extends GetxController {
  final isar = Get.find<IsarService>().isar;

  Future<bool> deleteAllotment({required int allotmentId});

  Future<bool> getAllotments({required int? allotedObjectId});

  Future<bool> getStakeholderNames();
}
