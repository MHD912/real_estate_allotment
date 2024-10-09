import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HubController extends GetxController {
  final FocusNode focusNode;

  HubController() : focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void rebuildView() {
    update(["init_home"]);
  }
}
