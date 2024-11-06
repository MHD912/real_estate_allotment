import 'package:flutter/widgets.dart';
import 'package:real_estate_allotment/controllers/properties/property_controller.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class AddPropertyController extends PropertyController {
  @override
  Future<InputResult> putProperty({
    required RealEstate property,
  }) async {
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
    final result = await handlePropertySubmission(
      existingProperty: null,
    );
    if (result == InputResult.success) clearInput();
    return result;
  }

  @override
  void clearInput() {
    propertyNumberController.clear();
    propertyValueController.clear();
    totalShareController.text = "2400";
    cityController.clear();
  }
}
