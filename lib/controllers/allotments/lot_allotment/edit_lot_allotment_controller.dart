import 'package:flutter/widgets.dart';
import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/lot_allotment/lot_allotment_controller.dart';
import 'package:real_estate_allotment/models/allotment/lot_allotment/lot_allotment.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';

class EditLotAllotmentController extends LotAllotmentController {
  late final LotAllotment existingAllotment;

  @override
  Future<InputResult> submitLotAllotment() async {
    return await handleAllotmentSubmission(
      existingAllotment: existingAllotment,
    );
  }

  @override
  Future<InputResult> updateLotRemainingShare({
    required double newShare,
  }) async {
    lot.remainingShare += existingAllotment.share;
    if (lot.remainingShare < newShare) return InputResult.shareDepleted;

    lot.remainingShare -= newShare;
    if (lot.remainingShare.abs() < 1e-4) {
      lot.remainingShare = 0;
    }
    try {
      await isar.lots.put(lot);
      return InputResult.success;
    } catch (e) {
      debugPrint("$runtimeType (Update Lot) Error: $e");
      return InputResult.error;
    }
  }

  @override
  Future<InputResult> putAllotment({
    required LotAllotment lotAllotment,
  }) async {
    final result = await updateLotRemainingShare(
      newShare: lotAllotment.share,
    );
    if (result != InputResult.success) return result;

    try {
      await isar.lotAllotments.put(
        lotAllotment,
      );
      return InputResult.success;
    } catch (e) {
      debugPrint("$runtimeType (Put Allotment) Error: $e");
      return InputResult.error;
    }
  }

  @override
  void resetInput() {
    shareholderNameController.text = existingAllotment.shareholderName;
    shareController.text = "${existingAllotment.share}";
  }
}
