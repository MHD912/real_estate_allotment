import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

abstract class PropertyAllotmentController extends AllotmentController {
  final participationRateController = TextEditingController(text: "1.0");

  late final int propertyId;

  bool checkPropertyRemainingShare({
    required Lot property,
    required double share,
  }) {
    if (property.remainingShare >= share) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> checkIsDuplicate(int stakeholderId) async {
    try {
      return await isar.realEstateAllotments
          .where()
          .propertyIdStakeholderIdEqualTo(propertyId, stakeholderId)
          .isNotEmpty();
    } catch (e) {
      debugPrint('$runtimeType (Check Duplicate) Error: $e');
      return false;
    }
  }

  Future<Lot?> getProperty() async {
    try {
      return await isar.realEstates.get(propertyId);
    } catch (e) {
      debugPrint('$runtimeType (Get Property) Error: $e');
      return null;
    }
  }

  ///
  /// In case of updating an existing allotment, the [existingShare] parameter must be specified.
  ///
  Future<void> updatePropertyRemainingShare({
    required Lot realEstate,
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

    final stakeholderId = await submitStakeholder();
    if (stakeholderId == null) return InputResult.error;

    // Only check for duplicates when adding new allotment
    if (existingAllotment == null && await checkIsDuplicate(stakeholderId)) {
      return InputResult.duplicateStakeholder;
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
            stakeholderId: stakeholderId,
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
