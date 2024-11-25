import 'package:real_estate_allotment/controllers/lots/lot_controller.dart';
import 'package:real_estate_allotment/core/utilities/parse_decimal.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class AddLotController extends LotController {
  @override
  Future<InputResult> putLot({required Lot lot}) async {
    final success = await updatePropertyRemainingValue(
      realEstate: property,
      newLotValue: lot.value,
    );
    if (!success) return InputResult.exceededPropertyValue;

    await isar.lots.put(lot);
    return InputResult.success;
  }

  @override
  Future<InputResult> submitLot() async {
    final result = await handleLotSubmission(
      existingLot: null,
    );
    return result;
  }

  @override
  void resetInput() {
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

    final remainingValue =
        decimal('${realEstate.remainingValue}') - decimal('$newLotValue');
    realEstate.remainingValue = remainingValue.toDouble();
    await isar.realEstates.put(realEstate);
    return true;
  }
}
