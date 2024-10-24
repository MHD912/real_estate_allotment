import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class AddPropertyController extends GetxController {
  final isar = Get.find<IsarService>().isar;

  final propertyIdController = TextEditingController();
  final propertyValueController = TextEditingController();
  final totalShareController = TextEditingController(text: "2400");
  final cityController = TextEditingController();

  Future<void> submitProperty() async {
    final realEstates = isar.realEstates;
    await isar.writeTxn(
      () => realEstates.put(
        RealEstate(
          propertyId: int.parse(propertyIdController.text),
          totalShare: int.parse(totalShareController.text),
          city: cityController.text,
          value: int.parse(propertyValueController.text),
        ),
      ),
    );

    clearInput();
  }

  void clearInput() {
    propertyIdController.clear();
    propertyValueController.clear();
    totalShareController.clear();
    cityController.clear();
  }
}
