import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/core/utilities/price_extension.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

enum InputResult {
  success,
  requiredInput,
  error,
  duplicateNumberForProperty,
  exceededPropertyValue,
  shareExceeded,
}

enum LotDescription {
  trade,
  normal,
}

abstract class LotController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  final lotNumberController = TextEditingController();
  final lotValueController = TextEditingController();
  final totalShareController = TextEditingController(text: "2400");
  final lotDescriptionController = TextEditingController();

  final lotNumberFocus = FocusNode();
  final lotValueFocus = FocusNode();
  final totalShareFocus = FocusNode();

  late final RealEstate property;

  @override
  void dispose() {
    lotNumberController.dispose();
    lotValueController.dispose();
    totalShareController.dispose();
    lotDescriptionController.dispose();

    lotNumberFocus.dispose();
    lotValueFocus.dispose();
    totalShareFocus.dispose();

    super.dispose();
  }

  bool _validateInput() {
    return (lotNumberController.text.isEmpty ||
        lotValueController.text.isEmpty ||
        totalShareController.text.isEmpty);
  }

  Future<bool> _checkIsDuplicateForProperty(String? description) async {
    try {
      // Check if property is duplicate based on lot number and description.
      return await isar.lots
          .where()
          .propertyIdLotNumberEqualTo(
            property.id,
            lotNumberController.text.trim(),
          )
          .filter()
          .descriptionEqualTo(description)
          .isNotEmpty();
    } catch (e) {
      debugPrint('$runtimeType (Check Duplicate) Error: $e');
      return false;
    }
  }

  @protected
  Future<InputResult> handleLotSubmission({required Lot? existingLot}) async {
    final isNotValid = _validateInput();
    if (isNotValid) return InputResult.requiredInput;

    final String? lotDescription;
    if (lotDescriptionController.text.isEmpty) {
      lotDescription = null;
    } else {
      lotDescription = lotDescriptionController.text;
    }

    if (existingLot == null &&
        await _checkIsDuplicateForProperty(lotDescription)) {
      return InputResult.duplicateNumberForProperty;
    }
    final lot = Lot(
      id: existingLot?.id ?? Isar.autoIncrement,
      lotNumber: lotNumberController.text.trim(),
      value: lotValueController.text.trim().parseSeparatedDouble(),
      totalShare: double.parse(totalShareController.text.trim()),
      description: lotDescription,
      propertyId: property.id,
      dateCreated: existingLot?.createdDate,
    );

    try {
      return await isar.writeTxn<InputResult>(
        () async {
          return await putLot(lot: lot);
        },
      );
    } catch (e) {
      debugPrint('$runtimeType (Submit Lot) Error: $e');
      return InputResult.error;
    }
  }

  void resetInput();

  Future<InputResult> putLot({
    required Lot lot,
  });

  Future<InputResult> submitLot();

  ///
  /// In case of updating an existing allotment, the [existingShare] parameter must be specified.
  ///
  Future<bool> updatePropertyRemainingValue({
    required RealEstate realEstate,
    required double newLotValue,
  });
}
