import 'package:flutter/widgets.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

enum CheckResult {
  success,
  error,
  requiredInput,
}

class ChoosePropertyController extends GetxController {
  final isar = Get.find<IsarService>().isar;

  final cityController = TextEditingController();
  final propertyNumberController = TextEditingController();
  final propertyNumberSuggestionsController = SuggestionsController<String>();

  int? propertyId;

  late String currentPropertyNumber, currentCity;

  Future<List<String>> getCities(String input) async {
    return await isar.realEstates
        .filter()
        .cityStartsWith(input.trim())
        .distinctByCity()
        .cityProperty()
        .findAll();
  }

  Future<List<String>> getPropertyNumbers(String input) async {
    return await isar.realEstates
        .where()
        .cityEqualToAnyPropertyNumber(cityController.text.trim())
        .filter()
        .propertyNumberStartsWith(input.trim())
        .propertyNumberProperty()
        .findAll();
  }

  Future<CheckResult> checkInput() async {
    if (cityController.text.isEmpty || propertyNumberController.text.isEmpty) {
      return CheckResult.requiredInput;
    }
    propertyId = await isar.realEstates
        .where()
        .cityPropertyNumberEqualTo(
          cityController.text.trim(),
          propertyNumberController.text.trim(),
        )
        .idProperty()
        .findFirst();
    if (propertyId != null) {
      currentCity = cityController.text.trim();
      currentPropertyNumber = propertyNumberController.text.trim();
      return CheckResult.success;
    } else {
      return CheckResult.error;
    }
  }
}
