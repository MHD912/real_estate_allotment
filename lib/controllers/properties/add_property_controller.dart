import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

enum InputResult { success, requiredInput, error }

class AddPropertyController extends GetxController {
  final isar = Get.find<IsarService>().isar;

  final propertyIdController = TextEditingController();
  final propertyValueController = TextEditingController();
  final totalShareController = TextEditingController(text: "2400");
  final cityController = TextEditingController();

  InputResult _validateInput() {
    bool isEmpty = (propertyIdController.text.isEmpty ||
        propertyIdController.text.isEmpty ||
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
      await isar.writeTxn(
        () => isar.realEstates.put(
          RealEstate(
            propertyId: int.parse(propertyIdController.text.trim()),
            totalShare: int.parse(totalShareController.text.trim()),
            city: cityController.text.trim(),
            value: int.parse(propertyValueController.text.trim()),
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

  void clearInput() {
    propertyIdController.clear();
    propertyValueController.clear();
    totalShareController.text = "2400";
    cityController.clear();
  }
}
