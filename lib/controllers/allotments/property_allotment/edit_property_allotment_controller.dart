import 'package:flutter/material.dart';
import 'package:real_estate_allotment/controllers/allotments/property_allotment/property_allotment_controller.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class EditPropertyAllotmentController extends PropertyAllotmentController {
  late final String stakeholderName;
  late final RealEstateAllotment propertyAllotment;

  @override
  void resetInput() {
    ownerNameController.text = stakeholderName;
    shareController.text = "${propertyAllotment.share}";
    participationRateController.text = "${propertyAllotment.participationRate}";
  }

  @override
  Future<void> updatePropertyRemainingShare({
    required RealEstate realEstate,
    required double newShare,
  }) async {
    realEstate.remainingShare += propertyAllotment.share;
    realEstate.remainingShare -= newShare;
    await isar.realEstates.put(realEstate);
  }

  @override
  Future<InputResult> submitPropertyAllotment() async {
    final inputValidation = validateInput();
    if (inputValidation != InputResult.success) return inputValidation;

    final stakeholderId = await submitStakeholder();
    if (stakeholderId == null) return InputResult.error;

    final property = await getProperty();
    if (property == null) return InputResult.error;

    final share = double.parse(
      shareController.text.trim(),
    );

    final participationRate = double.parse(
      participationRateController.text.trim(),
    );

    // Check if all property shares have been depleted
    final success = checkPropertyRemainingShare(
      property: property,
      share: share,
    );
    if (!success) return InputResult.propertySharesDepleted;

    // Calculate the value due
    final valueDue = property.value * (share / 2400) * participationRate;

    try {
      await isar.writeTxn(
        () async {
          // Update the property remaining share
          await updatePropertyRemainingShare(
            realEstate: property,
            newShare: share,
          );

          // Add property allotment to database
          await isar.realEstateAllotments.put(
            RealEstateAllotment(
              id: propertyAllotment.id,
              share: share,
              participationRate: participationRate,
              valueDue: valueDue,
              stakeholderId: stakeholderId,
              propertyId: property.id,
            ),
          );
        },
      );
      return InputResult.success;
    } catch (e) {
      debugPrint('$runtimeType (Submit Property Allotment) Error: $e');
      return InputResult.error;
    }
  }
}
