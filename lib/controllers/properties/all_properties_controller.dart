import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/studies/active_study_controller.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/allotment/lot_allotment/lot_allotment.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

enum DeleteResult { success, lotError, error, allotmentError }

class AllPropertiesController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  late List<RealEstate> properties;

  Future<bool> getProperties() async {
    try {
      final studyId = Get.find<ActiveStudyController>().activeStudy!.id;
      properties = await isar.realEstates
          .where()
          .studyIdEqualToAnyCityPropertyNumber(studyId)
          .sortByCreatedDate()
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

          success = await _deleteAllotments(
            propertyId: propertyId,
          );
          if (!success) return DeleteResult.allotmentError;

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

  Future<bool> _deleteAllotments({required int propertyId}) async {
    final allotmentIdsList = await isar.realEstateAllotments
        .where()
        .propertyIdEqualToAnyShareholderName(propertyId)
        .idProperty()
        .findAll();
    final result = await isar.realEstateAllotments.deleteAll(allotmentIdsList);
    return (result == allotmentIdsList.length);
  }

  Future<bool> _deleteLots({required int propertyId}) async {
    final lotIdsList = await isar.lots
        .where()
        .propertyIdEqualToAnyLotNumber(propertyId)
        .idProperty()
        .findAll();

    if (lotIdsList.isEmpty) return true;
    bool success;
    for (var lotId in lotIdsList) {
      success = await _deleteLotAllotments(lotId: lotId);
      if (!success) return false;
    }

    final result = await isar.lots.deleteAll(lotIdsList);
    return (result == lotIdsList.length);
  }

  Future<bool> _deleteLotAllotments({required int lotId}) async {
    final allotmentIdsList = await isar.lotAllotments
        .where()
        .lotIdEqualToAnyShareholderName(lotId)
        .idProperty()
        .findAll();
    if (allotmentIdsList.isEmpty) return true;
    final result = await isar.lotAllotments.deleteAll(allotmentIdsList);
    return (result == allotmentIdsList.length);
  }
}
