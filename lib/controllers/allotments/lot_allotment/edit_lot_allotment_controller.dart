import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/lot_allotment/lot_allotment_controller.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';

class EditLotAllotmentController extends LotAllotmentController {
  @override
  Future<InputResult> submitPropertyAllotment() {
    return handleAllotmentSubmission(existingAllotment: null);
  }

  @override
  Future<void> updateLotRemainingShare({
    required Lot lot,
    required double newShare,
    double? existingShare,
  }) async {
    lot.remainingShare += existingShare ?? 0;
    lot.remainingShare -= newShare;
    await isar.lots.put(lot);
  }

  @override
  void resetInput() {
    ownerNameController.clear();
    shareController.clear();
  }
}
