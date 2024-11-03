import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';

enum InputResult { success, requiredInput, error, duplicateNumberForProperty }

class AddLotController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  final lotNumberController = TextEditingController();
  final lotValueController = TextEditingController();
  final totalShareController = TextEditingController(text: "2400");

  late final int propertyId;

  InputResult _validateInput() {
    bool isEmpty = (lotNumberController.text.isEmpty ||
        lotValueController.text.isEmpty ||
        totalShareController.text.isEmpty ||
        totalShareController.text.isEmpty);

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
      if (await _checkIsDuplicateNumberForProperty()) {
        return InputResult.duplicateNumberForProperty;
      }
      await isar.writeTxn(
        () async => await isar.lots.put(
          Lot(
            lotNumber: lotNumberController.text.trim(),
            value: double.parse(lotValueController.text.trim()),
            totalShare: double.parse(totalShareController.text.trim()),
            propertyId: propertyId,
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

  Future<bool> _checkIsDuplicateNumberForProperty() async {
    return await isar.lots
        .where()
        .propertyIdLotNumberEqualTo(
          propertyId,
          lotNumberController.text.trim(),
        )
        .isNotEmpty();
  }

  void clearInput() {
    lotNumberController.clear();
    lotValueController.clear();
    totalShareController.text = "2400";
  }
}
