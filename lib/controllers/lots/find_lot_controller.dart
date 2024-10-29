import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';

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

  Future<bool> deleteLot({required int lotId}) async {
    try {
      final result = await isar.writeTxn(
        () async => await isar.lots.delete(lotId),
      );
      if (result == true) update();
      return result;
    } catch (e) {
      debugPrint('$runtimeType (Delete Lot) Error: $e');
      return false;
    }
  }
}
