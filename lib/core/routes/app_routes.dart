import 'package:flutter/material.dart';
import 'package:real_estate_allotment/views/add_lot_view/add_lot_view.dart';
import 'package:real_estate_allotment/views/add_property_view/add_property_view.dart';
import 'package:real_estate_allotment/views/all_properties_view/all_properties_view.dart';
import 'package:real_estate_allotment/views/choose_property_view/choose_property_view.dart';
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

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => HomeView(),
    hub: (context) => HubView(),
    addProperty: (context) => AddPropertyView(),
    editProperty: (context) => EditPropertyView(),
    allProperties: (context) => AllPropertiesView(),
    chooseProperty: (context) => ChoosePropertyView(),
    addLot: (context) => AddLotView(),
  };
}
