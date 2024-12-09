import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/studies/active_study_controller.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

enum InputResult {
  success,
  requiredInput,
  error,
  duplicateNumberForCity,
  valueExceeded,
  shareExceeded,
}

abstract class PropertyController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  final studyId = Get.find<ActiveStudyController>().activeStudy!.id;

  final propertyNumberController = TextEditingController();
  final propertyValueController = TextEditingController();
  final totalShareController = TextEditingController(text: "2400");
  final cityController = TextEditingController();

  final propertyNumberFocus = FocusNode();
  final propertyValueFocus = FocusNode();
  final totalShareFocus = FocusNode();
  final cityFocus = FocusNode();
  @override
  void dispose() {
    propertyNumberController.dispose();
    propertyValueController.dispose();
    totalShareController.dispose();
    cityController.dispose();

    propertyNumberFocus.dispose();
    propertyValueFocus.dispose();
    totalShareFocus.dispose();
    cityFocus.dispose();

    super.dispose();
  }

  bool _validateInput() {
    return (propertyNumberController.text.isEmpty ||
        propertyValueController.text.isEmpty ||
        totalShareController.text.isEmpty ||
        cityController.text.isEmpty);
  }

  Future<bool> _checkIsDuplicateNumberForCity() async {
    try {
      return await isar.realEstates
          .where()
          .studyIdCityPropertyNumberEqualTo(
            studyId,
            cityController.text.trim(),
            propertyNumberController.text.trim(),
          )
          .isNotEmpty();
    } catch (e) {
      debugPrint('$runtimeType (Check Duplicate) Error: $e');
      return false;
    }
  }

  @protected
  Future<InputResult> handlePropertySubmission({
    required RealEstate? existingProperty,
  }) async {
    final isNotValid = _validateInput();
    if (isNotValid) return InputResult.requiredInput;

    if (existingProperty == null && await _checkIsDuplicateNumberForCity()) {
      return InputResult.duplicateNumberForCity;
    }

    final property = RealEstate(
      id: existingProperty?.id ?? Isar.autoIncrement,
      propertyNumber: propertyNumberController.text.trim(),
      city: cityController.text.trim(),
      value: double.parse(propertyValueController.text.trim()),
      totalShare: double.parse(totalShareController.text.trim()),
      studyId: studyId,
      dateCreated: existingProperty?.createdDate,
    );

    try {
      return await isar.writeTxn(
        () async {
          return await putProperty(
            property: property,
          );
        },
      );
    } catch (e) {
      debugPrint('$runtimeType (Submit Property) Error: $e');
      return InputResult.error;
    }
  }

  Future<InputResult> putProperty({
    required RealEstate property,
  });

  Future<InputResult> submitProperty();
  void resetInput();
}
