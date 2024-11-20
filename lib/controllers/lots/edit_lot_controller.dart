import 'package:flutter/widgets.dart';
import 'package:real_estate_allotment/controllers/lots/lot_controller.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

// TODO: add a method for updating lot allotments (if any) when modifying the value of the given property
class EditLotController extends LotController {
  late final Lot existingLot;

  @override
  Future<InputResult> putLot({required Lot lot}) async {
    // Update and check if the property remaining value is sufficient
    final success = await updatePropertyRemainingValue(
      realEstate: property,
      newLotValue: lot.value,
    );
    if (!success) return InputResult.exceededPropertyValue;

    // Update and check if the remaining share is sufficient
    final shareDifference = lot.totalShare - existingLot.totalShare;
    property.remainingShare = existingLot.remainingShare + shareDifference;
    if (property.remainingShare < 0) return InputResult.shareExceeded;

    await isar.lots.put(lot);
    return InputResult.success;
  }

  @override
  Future<InputResult> submitLot() async {
    return await handleLotSubmission(
      existingLotId: existingLot.id,
    );
  }

  @override
  void resetInput() {
    lotNumberController.text = existingLot.lotNumber;
    lotValueController.text = "${existingLot.value}";
    totalShareController.text = "${existingLot.totalShare}";
  }

  @override
  Future<bool> updatePropertyRemainingValue({
    required RealEstate realEstate,
    required double newLotValue,
  }) async {
    realEstate.remainingValue += existingLot.value;
    if (realEstate.remainingValue < newLotValue) return false;

    realEstate.remainingValue -= newLotValue;
    try {
      await isar.realEstates.put(realEstate);
      return true;
    } catch (e) {
      debugPrint("$runtimeType (Update Property) Error: $e");
      return false;
    }
  }
}
