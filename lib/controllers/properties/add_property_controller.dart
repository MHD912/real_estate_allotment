import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

enum InputResult { success, requiredInput, error, duplicateIdForCity }

class AddPropertyController extends GetxController {
  final isar = Get.find<IsarService>().isar;

  final propertyNumberController = TextEditingController();
  final propertyValueController = TextEditingController();
  final totalShareController = TextEditingController(text: "2400");
  final cityController = TextEditingController();

  InputResult _validateInput() {
    bool isEmpty = (propertyNumberController.text.isEmpty ||
        propertyValueController.text.isEmpty ||
        totalShareController.text.isEmpty ||
        cityController.text.isEmpty);

    if (isEmpty) {
      return InputResult.requiredInput;
    } else {
      return InputResult.success;
    }
  }

  Future<InputResult> submitProperty() async {
    final inputValidation = _validateInput();
    if (inputValidation != InputResult.success) return inputValidation;

    try {
      if (await _checkIsDuplicateIdForCity()) {
        return InputResult.duplicateIdForCity;
      }
      await isar.writeTxn(
        () async => await isar.realEstates.put(
          RealEstate(
            propertyNumber: propertyNumberController.text.trim(),
            city: cityController.text.trim(),
            value: int.parse(propertyValueController.text.trim()),
            totalShare: int.parse(totalShareController.text.trim()),
          ),
        ),
      );
      clearInput();
      return InputResult.success;
    } catch (e) {
      debugPrint('$runtimeType (Submit Property) Error: $e');
      return InputResult.error;
    }
  }

  Future<bool> _checkIsDuplicateIdForCity() async {
    return await isar.realEstates
        .where()
        .cityPropertyNumberEqualTo(
          cityController.text.trim(),
          propertyNumberController.text.trim(),
        )
        .isNotEmpty();
    // .filter()
    // .cityEqualTo(cityController.text.trim())
    // .propertyNumberEqualTo(propertyIdController.text.trim())
    // .isNotEmpty();
  }

  void clearInput() {
    propertyNumberController.clear();
    propertyValueController.clear();
    totalShareController.text = "2400";
    cityController.clear();
  }
}
