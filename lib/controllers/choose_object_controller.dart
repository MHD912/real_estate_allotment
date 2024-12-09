import 'package:flutter/widgets.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/studies/active_study_controller.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

enum CheckResult {
  success,
  error,
  requiredInput,
  propertyError,
  lotError,
}

abstract class ChooseObjectController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  final studyId = Get.find<ActiveStudyController>().activeStudy!.id;

  final cityController = TextEditingController();
  final propertyNumberController = TextEditingController();
  final propertyNumberSuggestionsController = SuggestionsController<String>();

  final cityFocus = FocusNode();
  final propertyNumberFocus = FocusNode();
  final escapeFocus = FocusNode();

  RealEstate? property;
  Lot? lot;

  @override
  void dispose() {
    cityController.dispose();
    propertyNumberController.dispose();
    propertyNumberSuggestionsController.dispose();

    cityFocus.dispose();
    propertyNumberFocus.dispose();
    escapeFocus.dispose();
    super.dispose();
  }

  Future<List<String>> getCities(String input) async {
    try {
      return await isar.realEstates
          .where()
          .studyIdEqualToAnyCityPropertyNumber(studyId)
          .filter()
          .cityStartsWith(input.trim())
          .sortByCreatedDateDesc()
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
          .sortByPropertyNumber()
          .propertyNumberProperty()
          .findAll();
    } catch (e) {
      debugPrint("$runtimeType (Get Property Numbers) Error: $e");
      return List.empty();
    }
  }

  Future<RealEstate?> getProperty() async {
    return await isar.realEstates
        .where()
        .studyIdCityPropertyNumberEqualTo(
          studyId,
          cityController.text.trim(),
          propertyNumberController.text.trim(),
        )
        .findFirst();
  }

  bool checkInput();

  Future<CheckResult> submitInput();
}
