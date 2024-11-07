import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';

enum InputResult {
  success,
  requiredInput,
  error,
  duplicateShareholder,
  shareDepleted
}

abstract class AllotmentController extends GetxController {
  final isar = Get.find<IsarService>().isar;

  final shareholderNameController = TextEditingController();
  final shareController = TextEditingController();

  Future<bool> checkIsDuplicate(String shareholderName);
  bool validateInput();

  void resetInput();
}
