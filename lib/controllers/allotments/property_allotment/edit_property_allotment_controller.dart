import 'package:flutter/widgets.dart';
import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/property_allotment/property_allotment_controller.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class EditPropertyAllotmentController extends PropertyAllotmentController {
  late final RealEstateAllotment existingAllotment;

  @override
  Future<InputResult> submitPropertyAllotment() async {
    return await handleAllotmentSubmission(
      existingAllotmentId: existingAllotment.id,
    );
  }

  @override
  Future<InputResult> updatePropertyRemainingShare({
    required double newShare,
  }) async {
    property.remainingShare += existingAllotment.share;
    if (property.remainingShare < newShare) return InputResult.shareDepleted;

    property.remainingShare -= newShare;
    try {
      await isar.realEstates.put(property);
      return InputResult.success;
    } catch (e) {
      debugPrint("$runtimeType (Update Property) Error: $e");
      return InputResult.error;
    }
  }

  @override
  Future<InputResult> putAllotment({
    required RealEstateAllotment propertyAllotment,
  }) async {
    final result = await updatePropertyRemainingShare(
      newShare: propertyAllotment.share,
    );
    if (result != InputResult.success) return result;

    try {
      await isar.realEstateAllotments.put(
        propertyAllotment,
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
    participationRateController.text = "${existingAllotment.participationRate}";
  }
}
