import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';

enum InputResult { success, requiredInput, error, duplicateNumberForProperty }

class EditLotController extends GetxController {
  final isar = Get.find<IsarService>().isar;

  final lotNumberController = TextEditingController();
  final lotValueController = TextEditingController();
  final totalShareController = TextEditingController();

  late final int lotId;
  late final Lot? lot;

  Future<bool> getLotInfo() async {
    lot = await isar.lots.get(lotId);
    return setInput();
  }

  InputResult _validateInput() {
    bool isEmpty = (lotNumberController.text.isEmpty ||
        lotValueController.text.isEmpty ||
        totalShareController.text.isEmpty);

    if (isEmpty) {
      return InputResult.requiredInput;
    } else {
      return InputResult.success;
    }
  }

  Future<InputResult> submitLot() async {
    final inputValidation = _validateInput();
    if (inputValidation != InputResult.success) return inputValidation;

    try {
      if (await _checkIsDuplicateNumber()) {
        return InputResult.duplicateNumberForProperty;
      }
      await isar.writeTxn(
        () async => await isar.lots.put(
          Lot(
            id: lotId,
            lotNumber: lotNumberController.text.trim(),
            value: int.parse(lotValueController.text.trim()),
            totalShare: int.parse(totalShareController.text.trim()),
            propertyId: lot!.propertyId,
          ),
        ),
      );
      return InputResult.success;
    } catch (e) {
      debugPrint('$runtimeType (Submit Lot) Error: $e');
      return InputResult.error;
    }
  }

  Future<bool> _checkIsDuplicateNumber() async {
    return await isar.lots
        .where()
        .propertyIdLotNumberEqualTo(
          lot!.propertyId,
          lotNumberController.text.trim(),
        )
        .isNotEmpty();
  }

  bool setInput() {
    if (lot == null) false;
    lotNumberController.text = lot!.lotNumber;
    lotValueController.text = "${lot!.value}";
    totalShareController.text = "${lot!.totalShare}";
    return true;
  }
}
