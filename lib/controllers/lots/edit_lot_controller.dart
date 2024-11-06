import 'package:flutter/widgets.dart';
import 'package:real_estate_allotment/controllers/lots/lot_controller.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class EditLotController extends LotController {
  late final Lot existingLot;

  @override
  Future<InputResult> submitLot() async {
    return await handleLotSubmission(
      existingLot: existingLot,
    );
  }

  @override
  void clearInput() {
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
