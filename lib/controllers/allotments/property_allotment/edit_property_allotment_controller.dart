import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/property_allotment/property_allotment_controller.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class EditPropertyAllotmentController extends PropertyAllotmentController {
  late final String stakeholderName;
  late final RealEstateAllotment propertyAllotment;

  @override
  Future<InputResult> submitPropertyAllotment() async {
    return handleAllotmentSubmission(existingAllotment: propertyAllotment);
  }

  @override
  Future<void> updatePropertyRemainingShare({
    required Lot realEstate,
    required double newShare,
    double? existingShare,
  }) async {
    realEstate.remainingShare += existingShare ?? 0;
    realEstate.remainingShare -= newShare;
    await isar.realEstates.put(realEstate);
  }

  @override
  void resetInput() {
    ownerNameController.text = stakeholderName;
    shareController.text = "${propertyAllotment.share}";
    participationRateController.text = "${propertyAllotment.participationRate}";
  }
}
