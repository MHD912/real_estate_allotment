import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/property_allotment/property_allotment_controller.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class AddPropertyAllotmentController extends PropertyAllotmentController {
  @override
  Future<InputResult> submitPropertyAllotment() async {
    return handleAllotmentSubmission(existingAllotment: null);
  }

  @override
  Future<void> updatePropertyRemainingShare({
    required Lot realEstate,
    required double newShare,
    double? existingShare,
  }) async {
    realEstate.remainingShare -= newShare;
    await isar.realEstates.put(realEstate);
  }

  @override
  void resetInput() {
    ownerNameController.clear();
    shareController.clear();
  }
}
