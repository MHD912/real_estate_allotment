import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_bindings.dart';
import 'package:real_estate_allotment/views/add_lot_view/add_lot_view.dart';
import 'package:real_estate_allotment/views/add_property_view/add_property_view.dart';
import 'package:real_estate_allotment/views/all_properties_view/all_properties_view.dart';
import 'package:real_estate_allotment/views/choose_lot_view/choose_lot_view.dart';
import 'package:real_estate_allotment/views/choose_property_view/choose_property_view.dart';
import 'package:real_estate_allotment/views/edit_lot_view/edit_lot_view.dart';
import 'package:real_estate_allotment/views/edit_property_view/edit_property_view.dart';
import 'package:real_estate_allotment/views/home_view/home_view.dart';
import 'package:real_estate_allotment/views/hub_view/hub_view.dart';

class AppRoutes {
  static const String home = '/home';
  static const String hub = '/hub';
  static const String addProperty = '/add_property';
  static const String editProperty = '/edit_property';
  static const String allProperties = '/all_property';
  static const String chooseProperty = '/choose_property';
  static const String addLot = '/add_lot';
  static const String chooseLot = '/choose_lot';
  static const String editLot = '/edit_lot';

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
      name: chooseProperty,
      page: () => ChoosePropertyView(),
    ),
    GetPage(
      name: addLot,
      page: () => AddLotView(),
    ),
    GetPage(
      name: chooseLot,
      page: () => ChooseLotView(),
      binding: ChooseLotBindings(),
    ),
    GetPage(
      name: editLot,
      page: () => EditLotView(),
    ),
  ];
}
