import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';
import 'package:real_estate_allotment/models/stakeholder/stakeholder.dart';

enum InputResult {
  success,
  requiredInput,
  error,
  duplicateStakeholderForProperty,
  propertySharesDepleted
}

abstract class PropertyAllotmentController extends GetxController {
  final isar = Get.find<IsarService>().isar;

  final ownerNameController = TextEditingController();
  final shareController = TextEditingController();
  final participationRateController = TextEditingController(text: "1.0");

  late final int propertyId;

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

  Future<List<String>> getStakeholderNames({required String name}) async {
    try {
      return await isar.stakeholders
          .where()
          .filter()
          .nameContains(name)
          .nameProperty()
          .findAll();
    } catch (e) {
      debugPrint('$runtimeType (Get Stakeholder Names) Error: $e');
      return List.empty();
    }
  }

  Future<int?> submitStakeholder() async {
    if (ownerNameController.text.isEmpty) return null;
    try {
      int? stakeholderId;

      // Check if stakeholder is already in the database
      stakeholderId = await isar.stakeholders
          .where()
          .nameEqualTo(ownerNameController.text.trim())
          .idProperty()
          .findFirst();

      if (stakeholderId != null) return stakeholderId;

      // Add stakeholder to the database and return their ID
      return await isar.writeTxn<int>(
        () async {
          stakeholderId = await isar.stakeholders.put(
            Stakeholder(
              name: ownerNameController.text.trim(),
            ),
          );
          return stakeholderId!;
        },
      );
    } catch (e) {
      debugPrint('$runtimeType (Submit Stakeholder) Error: $e');
      return null;
    }
  }

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

  Future<bool> checkIsDuplicateForProperty(int stakeholderId) async {
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

  Future<RealEstate?> getProperty() async {
    try {
      return await isar.realEstates.get(propertyId);
    } catch (e) {
      debugPrint('$runtimeType (Get Property) Error: $e');
      return null;
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
    if (existingAllotment == null &&
        await checkIsDuplicateForProperty(stakeholderId)) {
      return InputResult.duplicateStakeholderForProperty;
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
      return InputResult.propertySharesDepleted;
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

  ///
  /// In case of updating an existing allotment, the [existingShare] parameter must be specified.
  ///
  Future<void> updatePropertyRemainingShare({
    required RealEstate realEstate,
    required double newShare,
    double? existingShare,
  });

  Future<InputResult> submitPropertyAllotment();

  void resetInput();
}
