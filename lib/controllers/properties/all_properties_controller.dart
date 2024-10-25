import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class AllPropertiesController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  late List<RealEstate> properties;

  Future<bool> getProperties() async {
    try {
      properties = await isar.realEstates.where().findAll();
      return true;
    } catch (e) {
      debugPrint('$runtimeType (Get Properties) Error: $e');
      return false;
    }
  }

  Future<bool> deleteProperty({required int propertyIsarId}) async {
    try {
      final result = await isar.writeTxn(
        () => isar.realEstates.delete(propertyIsarId),
      );
      if (result == true) update();
      return result;
    } catch (e) {
      debugPrint('$runtimeType (Delete Property) Error: $e');
      return false;
    }
  }
}
