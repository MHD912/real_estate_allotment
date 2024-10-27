import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class ChoosePropertyController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  final propertyNumberController = TextEditingController();
  final cityController = TextEditingController();
  final propertyNumberSuggestionsController = SuggestionsController<String>();

  Future<List<String>> getCities(String search) async {
    return await isar.realEstates
        .filter()
        .cityStartsWith(search.trim())
        .distinctByCity()
        .cityProperty()
        .findAll();
  }

  Future<List<String>> getPropertyNumbers(String search) async {
    return await isar.realEstates
        .where()
        .cityEqualToAnyPropertyNumber(cityController.text.trim())
        .filter()
        .propertyNumberStartsWith(search.trim())
        .propertyNumberProperty()
        .findAll();
  }

  Future<bool> checkInput() async {
    return await isar.realEstates
        .where()
        .cityPropertyNumberEqualTo(
          cityController.text.trim(),
          propertyNumberController.text.trim(),
        )
        .isNotEmpty();
  }
}
