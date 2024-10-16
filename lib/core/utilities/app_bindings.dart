import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/find_animation_controller.dart';
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

class FindAnimationControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FindAnimationController(),
    );
  }
}
