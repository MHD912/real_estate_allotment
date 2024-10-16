import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_bindings.dart';
import 'package:real_estate_allotment/views/add_lot_allotment_view/add_lot_allotment_view.dart';
import 'package:real_estate_allotment/views/add_lot_view/add_lot_view.dart';
import 'package:real_estate_allotment/views/add_property_allotment_view/add_property_allotment_view.dart';
import 'package:real_estate_allotment/views/add_property_view/add_property_view.dart';
import 'package:real_estate_allotment/views/all_properties_view/all_properties_view.dart';
import 'package:real_estate_allotment/views/allotment_type_view/allotment_type_view.dart';
import 'package:real_estate_allotment/views/choose_lot_view/choose_lot_view.dart';
import 'package:real_estate_allotment/views/find_lot_view/find_lot_view.dart';
import 'package:real_estate_allotment/views/choose_property_view/choose_property_view.dart';
import 'package:real_estate_allotment/views/edit_lot_view/edit_lot_view.dart';
import 'package:real_estate_allotment/views/edit_property_view/edit_property_view.dart';
import 'package:real_estate_allotment/views/home_view/home_view.dart';
import 'package:real_estate_allotment/views/hub_view/hub_view.dart';

class AppRoutes {
  static const String home = '/';
  static const String hub = '/hub';

  static const String addProperty = '$hub/add_property';
  static const String allProperties = '$hub/all_property';
  static const String editProperty = '$allProperties/edit_property';

  static const String chooseLotProperty = '$hub/choose_lot_property';
  static const String addLot = '$chooseLotProperty/add_lot';
  static const String findLot = '$hub/find_lot';
  static const String editLot = '$findLot/edit_lot';

  static const String allotmentType = '$hub/allotment_type';

  static const String chooseAllotmentProperty =
      '$allotmentType/choose_allotment_property';
  static const String addPropertyAllotment =
      "$chooseAllotmentProperty/add_property_allotment";

  static const String chooseAllotmentLot =
      '$allotmentType/choose_allotment_lot';
  static const String addLotAllotment = "$chooseAllotmentLot/add_lot_allotment";

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
    GetPage(
      name: addProperty,
      page: () => AddPropertyView(),
    ),
    GetPage(
      name: editProperty,
      page: () => EditPropertyView(),
    ),
    GetPage(
      name: allProperties,
      page: () => AllPropertiesView(),
    ),
    GetPage(
      name: chooseLotProperty,
      page: () => ChoosePropertyView(
        viewMode: ChoosePropertyViewMode.lotProperty,
      ),
    ),
    GetPage(
      name: addLot,
      page: () => AddLotView(),
    ),
    GetPage(
      name: findLot,
      page: () => FindLotView(),
      binding: ChooseLotBindings(),
    ),
    GetPage(
      name: editLot,
      page: () => EditLotView(),
    ),
    GetPage(
      name: allotmentType,
      page: () => AllotmentTypeView(),
    ),
    GetPage(
      name: chooseAllotmentProperty,
      page: () => ChoosePropertyView(
        viewMode: ChoosePropertyViewMode.allotmentProperty,
      ),
    ),
    GetPage(
      name: addPropertyAllotment,
      page: () => AddPropertyAllotment(),
    ),
    GetPage(
      name: chooseAllotmentLot,
      page: () => ChooseLotView(),
    ),
    GetPage(
      name: addLotAllotment,
      page: () => AddLotAllotment(),
    ),
  ];
}
