import 'package:get/get.dart';

class FindAnimationController extends GetxController {
  bool areLotsVisible = false;

  void toggleLotsVisibility() {
    areLotsVisible = !areLotsVisible;
    update();
  }

  void setLotsVisibility(bool value) {
    final shouldUpdate = (value != areLotsVisible);
    areLotsVisible = value;
    if (shouldUpdate) update();
  }
}
