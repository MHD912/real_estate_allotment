import 'package:flutter/widgets.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/studies/active_study_controller.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

enum CheckResult {
  success,
  error,
  requiredInput,
}

class ChoosePropertyController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  final studyId = Get.find<ActiveStudyController>().activeStudy!.id;

  final cityController = TextEditingController();
  final propertyNumberController = TextEditingController();
  final propertyNumberSuggestionsController = SuggestionsController<String>();

  late RealEstate? property;

  Future<List<String>> getCities(String input) async {
    try {
      return await isar.realEstates
          .filter()
          .cityStartsWith(input.trim())
          .distinctByCity()
          .cityProperty()
          .findAll();
    } catch (e) {
      debugPrint("$runtimeType (Get Cities) Error: $e");
      return List.empty();
    }
  }

  Future<List<String>> getPropertyNumbers(String input) async {
    try {
      return await isar.realEstates
          .where()
          .studyIdCityEqualToAnyPropertyNumber(
            studyId,
            cityController.text.trim(),
          )
          .filter()
          .propertyNumberStartsWith(input.trim())
          .propertyNumberProperty()
          .findAll();
    } catch (e) {
      debugPrint("$runtimeType (Get Property Numbers) Error: $e");
      return List.empty();
    }
  }

  Future<CheckResult> checkInput() async {
    if (cityController.text.isEmpty || propertyNumberController.text.isEmpty) {
      return CheckResult.requiredInput;
    }
    try {
      property = await isar.realEstates
          .where()
          .studyIdCityPropertyNumberEqualTo(
            studyId,
            cityController.text.trim(),
            propertyNumberController.text.trim(),
          )
          .findFirst();

      if (property != null) return CheckResult.success;
    } catch (e) {
      debugPrint("$runtimeType (Check Input) Error: $e");
    }
    return CheckResult.error;
  }
}
