import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/allotment_routes.dart';
import 'package:real_estate_allotment/core/routes/lot_routes.dart';
import 'package:real_estate_allotment/core/routes/property_routes.dart';
import 'package:real_estate_allotment/core/routes/study_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_bindings.dart';
import 'package:real_estate_allotment/views/home_view/home_view.dart';
import 'package:real_estate_allotment/views/hub_view/hub_view.dart';

class AppRoutes {
  static const String home = '/';

  static const String addStudy = '/add_study';
  static const String manageStudies = '/manage_studies';
  static const String editStudy = '$manageStudies/edit_study';

  static const String hub = '/hub';

  static const String addProperty = '$hub/add_property';
  static const String allProperties = '$hub/all_property';
  static const String editProperty = '$allProperties/edit_property';

  static const String chooseLotProperty = '$hub/choose_lot_property';
  static const String addLot = '$chooseLotProperty/add_lot';
  static const String findLot = '$hub/find_lot';
  static const String editLot = '$findLot/edit_lot';

  static const String allotmentTypeAdd = '$hub/allotment_type_add';

  static const String chooseAllotmentProperty =
      '$allotmentTypeAdd/choose_allotment_property';
  static const String addPropertyAllotment =
      "$chooseAllotmentProperty/add_property_allotment";

  static const String chooseAllotmentLot =
      '$allotmentTypeAdd/choose_allotment_lot';
  static const String addLotAllotment = '$chooseAllotmentLot/add_lot_allotment';

  static const String allotmentTypeFind = '$hub/allotment_type_find';

  static const String findPropertyAllotment =
      '$allotmentTypeFind/find_property_allotment';
  static const String editPropertyAllotment =
      '$findPropertyAllotment/edit_property_allotment';
  static const String findLotAllotment =
      '$allotmentTypeFind/find_lot_allotment';
  static const String findShareholderAllotment =
      '$allotmentTypeFind/find_shareholder_allotment';
  static const String editLotAllotment = '$findLotAllotment/edit_lot_allotment';

  static final List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => HomeView(),
    ),
    GetPage(
      name: hub,
      page: () => HubView(),
      binding: HubBindings(),
    ),
    ...PropertyRoutes.pages,
    ...LotRoutes.pages,
    ...AllotmentRoutes.pages,
    ...StudyRoutes.pages
  ];
}
