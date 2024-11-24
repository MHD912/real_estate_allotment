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

  final shareholderNameFocus = FocusNode();
  final shareFocus = FocusNode();

  @override
  void dispose() {
    shareholderNameController.dispose();
    shareController.dispose();

    shareholderNameFocus.dispose();
    shareFocus.dispose();
    super.dispose();
  }

  Future<bool> checkIsDuplicate(String shareholderName);
  bool validateInput();

  void resetInput();
}
