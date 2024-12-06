import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/choose_object_controller.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';

class ChooseAllotmentController extends ChooseObjectController {
  final shareholderController = TextEditingController();
  final shareholderSuggestionsController = SuggestionsController<String>();

  RealEstateAllotment? propertyAllotment;

  Future<List<String>> getShareholders(String input) async {
    try {
      final propertyId = (await getProperty())!.id;

      return await isar.realEstateAllotments
          .where()
          .propertyIdEqualToAnyShareholderName(propertyId)
          .filter()
          .shareholderNameContains(input)
          .shareholderNameProperty()
          .findAll();
    } catch (e) {
      debugPrint("$runtimeType (Get Shareholder Names) Error: $e");
      return List.empty();
    }
  }

  @override
  bool checkInput() {
    return (cityController.text.isEmpty ||
        propertyNumberController.text.isEmpty ||
        shareholderController.text.isEmpty);
  }

  @override
  Future<CheckResult> submitInput() async {
    final isNotValid = checkInput();
    if (isNotValid) return CheckResult.requiredInput;
    try {
      property = await getProperty();
      if (property == null) return CheckResult.propertyError;
      propertyAllotment = await getAllotment(property!.id);
      return CheckResult.success;
    } catch (e) {
      debugPrint("$runtimeType (Check Input) Error: $e");
      return CheckResult.error;
    }
  }

  Future<RealEstateAllotment?> getAllotment(int propertyId) async {
    return await isar.realEstateAllotments
        .where()
        .propertyIdShareholderNameEqualTo(
          propertyId,
          shareholderController.text,
        )
        .findFirst();
  }
}
