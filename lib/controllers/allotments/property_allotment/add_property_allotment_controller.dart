import 'package:flutter/widgets.dart';
import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/property_allotment/property_allotment_controller.dart';
import 'package:real_estate_allotment/core/utilities/parse_decimal.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class AddPropertyAllotmentController extends PropertyAllotmentController {
  @override
  Future<InputResult> submitPropertyAllotment() async {
    final result = await handleAllotmentSubmission(
      existingAllotment: null,
    );
    if (result == InputResult.success) resetInput();
    return result;
  }

  @override
  Future<InputResult> updatePropertyRemainingShare({
    required double newShare,
  }) async {
    if (property.remainingShare < newShare) return InputResult.shareDepleted;

    final remainingShare =
        decimal('${property.remainingShare}') - decimal('$newShare');
    property.remainingShare = remainingShare.toDouble();

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
    shareholderNameController.clear();
    shareController.clear();
  }
}
