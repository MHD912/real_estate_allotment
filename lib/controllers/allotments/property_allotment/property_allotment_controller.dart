import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

abstract class PropertyAllotmentController extends AllotmentController {
  final participationRateController = TextEditingController(text: "1.0");

  late final RealEstate property;

  bool checkPropertyRemainingShare({
    required RealEstate property,
    required double share,
  }) {
    if (property.remainingShare >= share) {
      return true;
    } else {
      return false;
    }
  }

  // TODO: Update logic here
  @override
  Future<bool> checkIsDuplicate(String shareholderName) async {
    try {
      return await isar.realEstateAllotments
          .where()
          .propertyIdShareholderNameEqualTo(property.id, shareholderName)
          .isNotEmpty();
    } catch (e) {
      debugPrint('$runtimeType (Check Duplicate) Error: $e');
      return false;
    }
  }

  Future<RealEstate?> getProperty() async {
    try {
      return await isar.realEstates.get(property.id);
    } catch (e) {
      debugPrint('$runtimeType (Get Property) Error: $e');
      return null;
    }
  }

  ///
  /// In case of updating an existing allotment, the [existingShare] parameter must be specified.
  ///
  Future<void> updatePropertyRemainingShare({
    required RealEstate realEstate,
    required double newShare,
    double? existingShare,
  });

  @override
  InputResult validateInput() {
    bool isEmpty = (ownerNameController.text.isEmpty ||
        shareController.text.isEmpty ||
        participationRateController.text.isEmpty);

    if (isEmpty) {
      return InputResult.requiredInput;
    } else {
      return InputResult.success;
    }
  }

  @protected
  Future<InputResult> handleAllotmentSubmission({
    required RealEstateAllotment? existingAllotment,
  }) async {
    final inputValidation = validateInput();
    if (inputValidation != InputResult.success) return inputValidation;

    final shareholderId = await submitShareholder();
    if (shareholderId == null) return InputResult.error;

    // Only check for duplicates when adding new allotment
    if (existingAllotment == null && await checkIsDuplicate("shareholderId")) {
      return InputResult.duplicateShareholder;
    }

    final property = await getProperty();
    if (property == null) return InputResult.error;

    final share = double.parse(shareController.text.trim());
    final participationRate =
        double.parse(participationRateController.text.trim());

    // For editing, we need to account for the existing share in the remaining share calculation
    final effectiveShare = (existingAllotment != null)
        // Only check the difference for editing
        ? share - existingAllotment.share
        // Check the full amount for new allotment
        : share;

    // Check if property shares would be depleted
    if (!checkPropertyRemainingShare(
      property: property,
      share: effectiveShare,
    )) {
      return InputResult.shareDepleted;
    }

    // Calculate the value due
    final valueDue = property.value * (share / 2400) * participationRate;

    try {
      await isar.writeTxn(() async {
        await updatePropertyRemainingShare(
          realEstate: property,
          newShare: share,
          existingShare: existingAllotment?.share,
        );

        await isar.realEstateAllotments.put(
          RealEstateAllotment(
            id: existingAllotment?.id ?? Isar.autoIncrement,
            share: share,
            participationRate: participationRate,
            valueDue: valueDue,
            shareholderName: "",
            propertyId: property.id,
          ),
        );
      });

      resetInput();
      return InputResult.success;
    } catch (e) {
      debugPrint('$runtimeType (Submit Property Allotment) Error: $e');
      return InputResult.error;
    }
  }

  Future<InputResult> submitPropertyAllotment();
}
