import 'package:get/get.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/allotment/allotment.dart';

abstract class FindAllotmentController extends GetxController {
  final isar = Get.find<IsarService>().isar;

  Future<bool> deleteAllotment({
    required Allotment allotment,
    required Object allotedObject,
  });

  Future<bool> getAllotments({required int allotedObjectId});
}
