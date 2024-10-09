import 'package:get/get.dart';

enum RailNavigationDestinations {
  home,
  realEstates,
}

class CustomNavigationRailController extends GetxController {
  int selectedIndex = 0;
  CustomNavigationRailController();

  void setDestination({
    required int newIndex,
  }) {
    selectedIndex = newIndex;
    update();
  }
}
