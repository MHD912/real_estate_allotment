import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/studies/active_study_controller.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

enum DeleteResult { success, lotError, error }

class AllPropertiesController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  late List<RealEstate> properties;

  Future<bool> getProperties() async {
    try {
      final studyId = Get.find<ActiveStudyController>().activeStudy!.id;
      properties = await isar.realEstates
          .where()
          .studyIdEqualToAnyCityPropertyNumber(studyId)
          .findAll();
      return true;
    } catch (e) {
      debugPrint('$runtimeType (Get Properties) Error: $e');
      return false;
    }
  }

  Future<DeleteResult> deleteProperty({required int propertyId}) async {
    try {
      final result = await isar.writeTxn(
        () async {
          bool success;
          success = await _deleteLots(
            propertyId: propertyId,
          );
          if (!success) return DeleteResult.lotError;

          success = await isar.realEstates.delete(propertyId);
          if (!success) return DeleteResult.error;

          return DeleteResult.success;
        },
      );
      if (result == DeleteResult.success) update();
      return result;
    } catch (e) {
      debugPrint('$runtimeType (Delete Property) Error: $e');
      return DeleteResult.error;
    }
  }

  Future<bool> _deleteLots({required int propertyId}) async {
    final lotIdsList = await isar.lots
        .where()
        .propertyIdEqualToAnyLotNumber(propertyId)
        .idProperty()
        .findAll();
    final result = await isar.lots.deleteAll(lotIdsList);

    if (result == lotIdsList.length) {
      return true;
    } else {
      return false;
    }
  }
}
