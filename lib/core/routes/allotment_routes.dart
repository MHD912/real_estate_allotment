import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_bindings.dart';
import 'package:real_estate_allotment/views/allotments/lot_allotment/add_lot_allotment_view/add_lot_allotment_view.dart';
import 'package:real_estate_allotment/views/allotments/property_allotment/add_property_allotment_view/add_property_allotment_view.dart';
import 'package:real_estate_allotment/views/allotments/allotment_type_view/allotment_type_view.dart';
import 'package:real_estate_allotment/views/allotments/lot_allotment/edit_lot_allotment_view/edit_lot_allotment_view.dart';
import 'package:real_estate_allotment/views/allotments/property_allotment/edit_property_allotment_view/edit_property_allotment_view.dart';
import 'package:real_estate_allotment/views/allotments/lot_allotment/find_lot_allotment_view/find_lot_allotment_view.dart';
import 'package:real_estate_allotment/views/allotments/property_allotment/find_property_allotment_view/find_property_allotment_view.dart';
import 'package:real_estate_allotment/views/lots/choose_lot_view/choose_lot_view.dart';
import 'package:real_estate_allotment/views/properties/choose_property_view/choose_property_view.dart';

class AllotmentRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.allotmentTypeAdd,
      page: () => AllotmentTypeView(
        viewMode: AllotmentTypeMode.addAllotment,
      ),
    ),
    GetPage(
      name: AppRoutes.chooseAllotmentProperty,
      page: () => ChoosePropertyView(
        viewMode: ChoosePropertyViewMode.propertyAllotment,
      ),
      binding: ChoosePropertyBindings(),
    ),
    GetPage(
      name: AppRoutes.addPropertyAllotment,
      page: () => AddPropertyAllotment(),
      binding: AddPropertyAllotmentBindings(),
    ),
    GetPage(
      name: AppRoutes.chooseAllotmentLot,
      page: () => ChooseLotView(),
      binding: ChooseLotBindings(),
    ),
    GetPage(
      name: AppRoutes.addLotAllotment,
      page: () => AddLotAllotment(),
      binding: AddLotAllotmentBindings(),
    ),
    GetPage(
      name: AppRoutes.allotmentTypeFind,
      page: () => AllotmentTypeView(
        viewMode: AllotmentTypeMode.findAllotment,
      ),
    ),
    GetPage(
      name: AppRoutes.findPropertyAllotment,
      page: () => FindPropertyAllotmentView(),
      bindings: [
        FindPropertyAllotmentBindings(),
        FindAnimationControllerBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.editPropertyAllotment,
      page: () => EditPropertyAllotmentView(),
      binding: EditPropertyAllotmentBindings(),
    ),
    GetPage(
      name: AppRoutes.findLotAllotment,
      page: () => FindLotAllotmentView(),
      bindings: [
        FindLotAllotmentBindings(),
        FindAnimationControllerBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.editLotAllotment,
      page: () => EditLotAllotmentView(),
      binding: EditLotAllotmentBindings(),
    ),
  ];
}
