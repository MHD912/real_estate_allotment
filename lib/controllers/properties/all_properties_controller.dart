import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class AllPropertiesController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  late List<Lot> properties;

  Future<bool> getProperties() async {
    try {
      properties = await isar.realEstates.where().sortByCity().findAll();
      return true;
    } catch (e) {
      debugPrint('$runtimeType (Get Properties) Error: $e');
      return false;
    }
  }

  Future<bool> deleteProperty({required int propertyId}) async {
    try {
      final result = await isar.writeTxn(
        () async => await isar.realEstates.delete(propertyId),
      );
      if (result == true) update();
      return result;
    } catch (e) {
      debugPrint('$runtimeType (Delete Property) Error: $e');
      return false;
    }
  }
}
