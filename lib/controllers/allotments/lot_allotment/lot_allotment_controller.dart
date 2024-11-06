import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/models/allotment/lot_allotment/lot_allotment.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';

abstract class LotAllotmentController extends AllotmentController {
  late final int lotId;

  bool checkLotRemainingShare({
    required Lot lot,
    required double share,
  }) {
    if (lot.remainingShare >= share) {
      return true;
    } else {
      return false;
    }
  }

  // TODO: Update logic here
  Future<List<String>> getStakeholderNames({required String name}) async {
    try {
      return await isar.realEstateAllotments
          .where()
          .propertyIdEqualToAnyStakeholderName(0)
          .filter()
          .stakeholderNameContains(name)
          .stakeholderNameProperty()
          .findAll();
    } catch (e) {
      debugPrint('$runtimeType (Get Stakeholder Names) Error: $e');
      return List.empty();
    }
  }

  @override
  Future<bool> checkIsDuplicate(String stakeholderName) async {
    try {
      return await isar.lotAllotments
          .where()
          .lotIdStakeholderNameEqualTo(lotId, stakeholderName)
          .isNotEmpty();
    } catch (e) {
      debugPrint('$runtimeType (Check Duplicate) Error: $e');
      return false;
    }
  }

  Future<Lot?> getLot() async {
    try {
      return await isar.lots.get(lotId);
    } catch (e) {
      debugPrint('$runtimeType (Get Lot) Error: $e');
      return null;
    }
  }

  ///
  /// In case of updating an existing allotment, the [existingShare] parameter must be specified.
  ///
  Future<void> updateLotRemainingShare({
    required Lot lot,
    required double newShare,
    double? existingShare,
  });

  @override
  InputResult validateInput() {
    bool isEmpty =
        (ownerNameController.text.isEmpty || shareController.text.isEmpty);

    if (isEmpty) {
      return InputResult.requiredInput;
    } else {
      return InputResult.success;
    }
  }

  // TODO: Update logic here
  @protected
  Future<InputResult> handleAllotmentSubmission({
    required LotAllotment? existingAllotment,
  }) async {
    final inputValidation = validateInput();
    if (inputValidation != InputResult.success) return inputValidation;

    final stakeholderId = await submitStakeholder();
    if (stakeholderId == null) return InputResult.error;

    // Only check for duplicates when adding new allotment
    if (existingAllotment == null && await checkIsDuplicate("")) {
      return InputResult.duplicateStakeholder;
    }

    final lot = await getLot();
    if (lot == null) return InputResult.error;

    final share = double.parse(shareController.text.trim());

    // For editing, we need to account for the existing share in the remaining share calculation
    final effectiveShare = (existingAllotment != null)
        // Only check the difference for editing
        ? share - existingAllotment.share
        // Check the full amount for new allotment
        : share;

    // Check if property shares would be depleted
    if (!checkLotRemainingShare(
      lot: lot,
      share: effectiveShare,
    )) {
      return InputResult.shareDepleted;
    }

    // Calculate the value due
    final valueDue = lot.value * (share / 2400);

    try {
      await isar.writeTxn(() async {
        await updateLotRemainingShare(
          lot: lot,
          newShare: share,
          existingShare: existingAllotment?.share,
        );

        await isar.lotAllotments.put(
          LotAllotment(
            id: existingAllotment?.id ?? Isar.autoIncrement,
            share: share,
            shareValue: valueDue,
            stakeholderName: "",
            lotId: lot.id,
          ),
        );
      });

      resetInput();
      return InputResult.success;
    } catch (e) {
      debugPrint('$runtimeType (Submit Lot Allotment) Error: $e');
      return InputResult.error;
    }
  }

  Future<InputResult> submitPropertyAllotment();
}
