import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/choose_object_controller.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';

class ChooseLotController extends ChooseObjectController {
  final lotNumberController = TextEditingController();
  final lotNumberSuggestionsController = SuggestionsController<String>();

  @override
  void dispose() {
    lotNumberController.dispose();
    lotNumberSuggestionsController.dispose();
    super.dispose();
  }

  Future<List<String>> getLotNumbers(String input) async {
    try {
      final propertyId = (await getProperty())!.id;

      return await isar.lots
          .where()
          .propertyIdEqualToAnyLotNumber(propertyId)
          .filter()
          .lotNumberStartsWith(input.trim())
          .sortByLotNumberDesc()
          .lotNumberProperty()
          .findAll();
    } catch (e) {
      debugPrint("$runtimeType (Get Lot Numbers) Error: $e");
      return List.empty();
    }
  }

  Future<Lot?> getLot() async {
    return await isar.lots
        .where()
        .propertyIdLotNumberEqualTo(
          property!.id,
          lotNumberController.text.trim(),
        )
        .findFirst();
  }

  @override
  bool checkInput() {
    return (cityController.text.isEmpty ||
        propertyNumberController.text.isEmpty ||
        lotNumberController.text.isEmpty);
  }

  @override
  Future<CheckResult> submitInput() async {
    final isNotValid = checkInput();
    if (isNotValid) return CheckResult.requiredInput;
    try {
      property = await getProperty();
      if (property == null) return CheckResult.propertyError;

      lot = await getLot();
      if (lot == null) return CheckResult.lotError;

      return CheckResult.success;
    } catch (e) {
      debugPrint("$runtimeType (Check Input) Error: $e");
      return CheckResult.error;
    }
  }
}
