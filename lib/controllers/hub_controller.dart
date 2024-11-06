import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/studies/active_study_controller.dart';

class HubController extends GetxController {
  final FocusNode focusNode;

  HubController() : focusNode = FocusNode();

  @override
  void onClose() {
    Get.find<ActiveStudyController>().activeStudy = null;
    super.onClose();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void rebuildView() {
    update(["init_home"]);
  }
}
