import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/allotments/choose_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_shareholder_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/lot_allotment/add_lot_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/property_allotment/add_property_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/lot_allotment/edit_lot_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/property_allotment/edit_property_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_lot_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_property_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/back_controller.dart';
import 'package:real_estate_allotment/controllers/find_animation_controller.dart';
import 'package:real_estate_allotment/controllers/custom_navigation_rail_controller.dart';
import 'package:real_estate_allotment/controllers/hub_controller.dart';
import 'package:real_estate_allotment/controllers/lots/add_lot_controller.dart';
import 'package:real_estate_allotment/controllers/lots/choose_lot_controller.dart';
import 'package:real_estate_allotment/controllers/lots/edit_lot_controller.dart';
import 'package:real_estate_allotment/controllers/lots/find_lot_controller.dart';
import 'package:real_estate_allotment/controllers/properties/add_property_controller.dart';
import 'package:real_estate_allotment/controllers/properties/all_properties_controller.dart';
import 'package:real_estate_allotment/controllers/properties/choose_property_controller.dart';
import 'package:real_estate_allotment/controllers/properties/edit_property_controller.dart';
import 'package:real_estate_allotment/controllers/studies/active_study_controller.dart';
import 'package:real_estate_allotment/controllers/studies/add_study_controller.dart';
import 'package:real_estate_allotment/controllers/studies/edit_study_controller.dart';
import 'package:real_estate_allotment/controllers/studies/study_management_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ActiveStudyController(),
      permanent: true,
    );
    Get.put(
      BackController(),
      permanent: true,
    );
  }
}

class AddStudyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddStudyController(),
    );
  }
}

class EditStudyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditStudyController(),
    );
  }
}

class StudyManagementBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StudyManagementController(),
    );
  }
}

class HubBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HubController(),
    );
    Get.put(
      CustomNavigationRailController(),
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

class AddPropertyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddPropertyController(),
    );
  }
}

class AllPropertiesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AllPropertiesController(),
    );
  }
}

class EditPropertyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditPropertyController(),
    );
  }
}

class ChoosePropertyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ChoosePropertyController(),
    );
  }
}

class AddLotBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddLotController(),
    );
  }
}

class EditLotBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditLotController(),
    );
  }
}

class ChooseLotBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ChooseLotController(),
    );
  }
}

class FindLotBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FindLotController(),
    );
    Get.lazyPut(
      () => ChoosePropertyController(),
    );
  }
}

class AddPropertyAllotmentBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddPropertyAllotmentController(),
    );
  }
}

class EditPropertyAllotmentBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditPropertyAllotmentController(),
    );
  }
}

class FindPropertyAllotmentBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ChoosePropertyController(),
    );
    Get.lazyPut<FindAllotmentController>(
      () => FindPropertyAllotmentController(),
    );
  }
}

class AddLotAllotmentBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddLotAllotmentController(),
    );
  }
}

class EditLotAllotmentBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditLotAllotmentController(),
    );
  }
}

class FindLotAllotmentBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindAllotmentController>(
      () => FindLotAllotmentController(),
    );
    Get.lazyPut(
      () => ChooseLotController(),
    );
  }
}

class FindShareholderAllotmentBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindAllotmentController>(
      () => FindShareholderAllotmentController(),
    );
    Get.lazyPut(
      () => ChooseAllotmentController(),
    );
  }
}
