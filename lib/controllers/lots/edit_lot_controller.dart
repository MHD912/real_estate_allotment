import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_allotment/controllers/lots/lot_controller.dart';
import 'package:real_estate_allotment/core/utilities/parse_decimal.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

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
    final shareDifference =
        decimal('${lot.totalShare}') - decimal('${existingLot.totalShare}');
    final remainingShare =
        decimal('${existingLot.remainingShare}') + shareDifference;
    if (remainingShare < decimal('0')) return InputResult.shareExceeded;

    property.remainingShare = remainingShare.toDouble();
    await isar.lots.put(lot);
    return InputResult.success;
  }

  @override
  Future<InputResult> submitLot() async {
    return await handleLotSubmission(
      existingLot: existingLot,
    );
  }

  @override
  Future<bool> updatePropertyRemainingValue({
    required RealEstate realEstate,
    required double newLotValue,
  }) async {
    var remainingValue = decimal('${realEstate.remainingValue}') +
        decimal('${existingLot.value}');
    if (remainingValue < decimal('$newLotValue')) return false;

    remainingValue -= decimal('$newLotValue');
    realEstate.remainingValue = remainingValue.toDouble();
    try {
      await isar.realEstates.put(realEstate);
      return true;
    } catch (e) {
      debugPrint("$runtimeType (Update Property) Error: $e");
      return false;
    }
  }

  @override
  void resetInput() {
    lotNumberController.text = existingLot.lotNumber;
    lotValueController.text = separateThousands(existingLot.value.round());
    totalShareController.text = "${existingLot.totalShare}";
  }

  String separateThousands(num value) {
    return NumberFormat('#,##0').format(value);
  }
}
