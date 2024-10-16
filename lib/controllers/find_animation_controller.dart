import 'package:get/get.dart';

class FindAnimationController extends GetxController {
  bool areLotsVisible = false;

  void toggleLotsVisibility() {
    areLotsVisible = !areLotsVisible;
    update();
  }
}
