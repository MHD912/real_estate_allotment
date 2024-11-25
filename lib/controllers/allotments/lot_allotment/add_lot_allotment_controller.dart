import 'package:flutter/widgets.dart';
import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/lot_allotment/lot_allotment_controller.dart';
import 'package:real_estate_allotment/core/utilities/parse_decimal.dart';
import 'package:real_estate_allotment/models/allotment/lot_allotment/lot_allotment.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';

class AddLotAllotmentController extends LotAllotmentController {
  @override
  Future<InputResult> submitLotAllotment() async {
    final result = await handleAllotmentSubmission(
      existingAllotment: null,
    );

    return result;
  }

  @override
  Future<InputResult> updateLotRemainingShare({
    required double newShare,
  }) async {
    if (lot.remainingShare < newShare) return InputResult.shareDepleted;

    final remainingShare =
        decimal('${lot.remainingShare}') - decimal('$newShare');
    lot.remainingShare = remainingShare.toDouble();

    try {
      await isar.lots.put(lot);
      return InputResult.success;
    } catch (e) {
      debugPrint("$runtimeType (Update Lot Share) Error: $e");
      return InputResult.error;
    }
  }

  @override
  Future<InputResult> putAllotment({required LotAllotment lotAllotment}) async {
    final result = await updateLotRemainingShare(
      newShare: lotAllotment.share,
    );
    if (result != InputResult.success) return result;

    try {
      await isar.lotAllotments.put(lotAllotment);
      return InputResult.success;
    } catch (e) {
      debugPrint("$runtimeType (Put Allotment) Error: $e");
      return InputResult.error;
    }
  }

  @override
  void resetInput() {
    shareholderNameController.clear();
    shareController.clear();
  }
}
