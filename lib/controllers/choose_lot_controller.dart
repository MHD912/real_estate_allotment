import 'package:get/get.dart';

class ChooseLotController extends GetxController {
  bool areLotsVisible = false;

  void toggleLotsVisibility() {
    areLotsVisible = !areLotsVisible;
    update(['lots_visibility']);
  }
}
