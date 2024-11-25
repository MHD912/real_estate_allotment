import 'package:flutter/widgets.dart';
import 'package:real_estate_allotment/controllers/properties/property_controller.dart';
import 'package:real_estate_allotment/core/utilities/parse_decimal.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class EditPropertyController extends PropertyController {
  late final RealEstate existingProperty;

  @override
  Future<InputResult> putProperty({
    required RealEstate property,
  }) async {
    // Update and check if the remaining value is sufficient
    final valueDifference =
        decimal('${property.value}') - decimal('${existingProperty.value}');
    final remainingValue =
        decimal('${existingProperty.remainingValue}') + valueDifference;
    if (remainingValue < decimal('0')) {
      return InputResult.valueExceeded;
    } else {
      property.remainingValue = remainingValue.toDouble();
    }

    // Update and check if the remaining share is sufficient
    final shareDifference = decimal('${property.totalShare}') -
        decimal('${existingProperty.totalShare}');
    final remainingShare =
        decimal('${existingProperty.remainingShare}') + shareDifference;
    if (remainingShare < decimal('0')) {
      return InputResult.shareExceeded;
    } else {
      property.remainingShare = remainingShare.toDouble();
    }

    // Put updated property in the database
    try {
      await isar.realEstates.put(property);
      return InputResult.success;
    } catch (e) {
      debugPrint("$runtimeType (Put Property) Error: $e");
      return InputResult.error;
    }
  }

  @override
  Future<InputResult> submitProperty() async {
    return await handlePropertySubmission(
      existingProperty: existingProperty,
    );
  }

  ///
  /// For the "Edit Controller", this method set the input to existing property values
  ///
  @override
  void resetInput() {
    propertyNumberController.text = existingProperty.propertyNumber;
    propertyValueController.text = "${existingProperty.value.round()}";
    totalShareController.text = "${existingProperty.totalShare}";
    cityController.text = existingProperty.city;
  }
}
