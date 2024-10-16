import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/choose_lot_controller.dart';
import 'package:real_estate_allotment/controllers/custom_navigation_rail_controller.dart';
import 'package:real_estate_allotment/controllers/hub_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      CustomNavigationRailController(),
      permanent: true,
    );
  }
}

class HubBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HubController(),
    );
  }
}

class ChooseLotBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ChooseLotController(),
    );
  }
}
