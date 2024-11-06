import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

enum DeleteResult { success, lotError, propertyError, error }

class FindLotController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  List<Lot> lotsList = [];

  Future<bool> getLots({required int? propertyId}) async {
    if (propertyId == null) return false;
    try {
      lotsList = await isar.lots
          .where()
          .propertyIdEqualToAnyLotNumber(propertyId)
          .findAll();
      return true;
    } catch (e) {
      debugPrint('$runtimeType (Get Lots) Error: $e');
      return false;
    }
  }

  Future<DeleteResult> deleteLot({
    required Lot lot,
    required RealEstate property,
  }) async {
    try {
      final result = await isar.writeTxn(
        () async {
          bool success;
          success = await _updatePropertyValue(
            realEstate: property,
            lotValue: lot.value,
          );
          if (!success) return DeleteResult.propertyError;

          success = await isar.lots.delete(lot.id);
          if (!success) return DeleteResult.lotError;

          return DeleteResult.success;
        },
      );
      if (result == DeleteResult.success) update();
      return result;
    } catch (e) {
      debugPrint('$runtimeType (Delete Lot) Error: $e');
      return DeleteResult.error;
    }
  }

  Future<bool> _updatePropertyValue({
    required RealEstate realEstate,
    required double lotValue,
  }) async {
    realEstate.remainingValue += lotValue;
    try {
      await isar.realEstates.put(realEstate);
      return true;
    } catch (e) {
      debugPrint("$runtimeType (Update Property) Error: $e");
      return false;
    }
  }
}
