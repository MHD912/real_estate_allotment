import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/properties/all_properties_controller.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';
import 'package:real_estate_allotment/models/study/study.dart';

class StudyManagementController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  List<Study> studies = [];

  Future<void> getStudies() async {
    try {
      studies = await isar.studies.where().findAll();
    } catch (e) {
      debugPrint('$runtimeType (Get Studies) Error: $e');
    }
  }

  Future<bool> deleteStudy({required int studyId}) async {
    try {
      final studyPropertyIds = await isar.realEstates
          .where()
          .studyIdEqualToAnyCityPropertyNumber(studyId)
          .idProperty()
          .findAll();

      final propertiesController = AllPropertiesController();
      for (var propertyId in studyPropertyIds) {
        propertiesController.deleteProperty(propertyId: propertyId);
      }
      return await isar.writeTxn(
        () async {
          return await isar.studies.delete(studyId);
        },
      );
    } catch (e) {
      debugPrint('$runtimeType (Delete Study) Error: $e');
      return false;
    }
  }
}
