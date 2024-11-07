import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

enum InputResult {
  success,
  requiredInput,
  error,
  duplicateNumberForProperty,
  exceededPropertyValue,
}

abstract class LotController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  final lotNumberController = TextEditingController();
  final lotValueController = TextEditingController();
  final totalShareController = TextEditingController(text: "2400");

  late final RealEstate property;

  bool _validateInput() {
    return (lotNumberController.text.isEmpty ||
        lotValueController.text.isEmpty ||
        totalShareController.text.isEmpty);
  }

  Future<bool> _checkIsDuplicateNumberForProperty() async {
    try {
      return await isar.lots
          .where()
          .propertyIdLotNumberEqualTo(
            property.id,
            lotNumberController.text.trim(),
          )
          .isNotEmpty();
    } catch (e) {
      debugPrint('$runtimeType (Check Duplicate) Error: $e');
      return false;
    }
  }

  @protected
  Future<InputResult> handleLotSubmission({required int? existingLotId}) async {
    final isNotValid = _validateInput();
    if (isNotValid) return InputResult.requiredInput;

    if (existingLotId == null && await _checkIsDuplicateNumberForProperty()) {
      return InputResult.duplicateNumberForProperty;
    }

    final lot = Lot(
      id: existingLotId ?? Isar.autoIncrement,
      lotNumber: lotNumberController.text.trim(),
      value: double.parse(lotValueController.text.trim()),
      totalShare: double.parse(totalShareController.text.trim()),
      propertyId: property.id,
    );

    try {
      return await isar.writeTxn<InputResult>(
        () async {
          final success = await updatePropertyRemainingValue(
            realEstate: property,
            newLotValue: lot.value,
          );
          if (!success) return InputResult.exceededPropertyValue;

          await isar.lots.put(lot);
          return InputResult.success;
        },
      );
    } catch (e) {
      debugPrint('$runtimeType (Submit Lot) Error: $e');
      return InputResult.error;
    }
  }

  void clearInput();

  Future<InputResult> submitLot();

  ///
  /// In case of updating an existing allotment, the [existingShare] parameter must be specified.
  ///
  Future<bool> updatePropertyRemainingValue({
    required RealEstate realEstate,
    required double newLotValue,
    // double? existingLotValue,
  });
}
