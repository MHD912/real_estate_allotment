import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

enum InputResult { success, requiredInput, error, duplicateNumberForCity }

class EditPropertyController extends GetxController {
  final isar = Get.find<IsarService>().isar;

  final propertyNumberController = TextEditingController();
  final propertyValueController = TextEditingController();
  final totalShareController = TextEditingController();
  final cityController = TextEditingController();

  late final int propertyId;
  late final RealEstate? realEstate;

  Future<bool> getPropertyInfo() async {
    realEstate = await isar.realEstates.get(propertyId);
    return setInput();
  }

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

    if (await _checkIsDuplicateNumberForCity()) {
      return InputResult.duplicateNumberForCity;
    }

    try {
      await isar.writeTxn(
        () async => await isar.realEstates.put(
          RealEstate(
            id: propertyId,
            propertyNumber: propertyNumberController.text.trim(),
            city: cityController.text.trim(),
            value: double.parse(propertyValueController.text.trim()),
            totalShare: double.parse(totalShareController.text.trim()),
          ),
        ),
      );
      return InputResult.success;
    } catch (e) {
      debugPrint('$runtimeType (Submit Property) Error: $e');
      return InputResult.error;
    }
  }

  Future<bool> _checkIsDuplicateNumberForCity() async {
    try {
      if (cityController.text.trim() == realEstate!.city &&
          propertyNumberController.text.trim() == realEstate!.propertyNumber) {
        return false;
      } else {
        return await isar.realEstates
            .where()
            .cityPropertyNumberEqualTo(
              cityController.text.trim(),
              propertyNumberController.text.trim(),
            )
            .isNotEmpty();
      }
    } catch (e) {
      debugPrint('$runtimeType (Check Duplicate) Error: $e');
      return false;
    }
  }

  bool setInput() {
    if (realEstate == null) false;
    propertyNumberController.text = realEstate!.propertyNumber;
    propertyValueController.text = "${realEstate!.value.round()}";
    totalShareController.text = "${realEstate!.totalShare}";
    cityController.text = realEstate!.city;
    return true;
  }
}
