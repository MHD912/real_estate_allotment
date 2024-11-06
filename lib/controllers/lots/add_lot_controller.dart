import 'package:real_estate_allotment/controllers/lots/lot_controller.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

// TODO: lot value is not getting deducted from property value
class AddLotController extends LotController {
  @override
  Future<InputResult> submitLot() async {
    final result = await handleLotSubmission(
      existingLot: null,
    );
    if (result == InputResult.success) clearInput();
    return result;
  }

  @override
  void clearInput() {
    lotNumberController.clear();
    lotValueController.clear();
    totalShareController.text = "2400";
  }

  @override
  Future<bool> updatePropertyRemainingValue({
    required RealEstate realEstate,
    required double newLotValue,
  }) async {
    if (realEstate.remainingValue < newLotValue) return false;

    realEstate.remainingValue -= newLotValue;
    await isar.realEstates.put(realEstate);
    return true;
  }
}
