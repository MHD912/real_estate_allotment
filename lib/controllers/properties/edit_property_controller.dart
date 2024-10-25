import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

enum InputResult { success, requiredInput, error }

class EditPropertyController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  final propertyIdController = TextEditingController();
  final propertyValueController = TextEditingController();
  final totalShareController = TextEditingController();
  final cityController = TextEditingController();

  late final int propertyIsarId;
  late final RealEstate? realEstate;

  Future<bool> getPropertyInfo() async {
    realEstate = await isar.realEstates.get(propertyIsarId);
    return setInput();
  }

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
            id: propertyIsarId,
            propertyId: int.parse(propertyIdController.text.trim()),
            totalShare: int.parse(totalShareController.text.trim()),
            value: int.parse(propertyValueController.text.trim()),
            city: cityController.text.trim(),
          ),
        ),
      );
      return InputResult.success;
    } catch (e) {
      debugPrint('$runtimeType (Submit Property) Error: $e');
      return InputResult.error;
    }
  }

  bool setInput() {
    if (realEstate == null) false;
    propertyIdController.text = "${realEstate!.propertyId}";
    propertyValueController.text = "${realEstate!.value}";
    totalShareController.text = "${realEstate!.totalShare}";
    cityController.text = realEstate!.city;
    return true;
  }
}
