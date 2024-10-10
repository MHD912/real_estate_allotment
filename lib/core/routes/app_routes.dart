import 'package:flutter/material.dart';
import 'package:real_estate_allotment/views/add_property_view/add_property_view.dart';
import 'package:real_estate_allotment/views/home_view/home_view.dart';
import 'package:real_estate_allotment/views/hub_view/hub_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/home': (context) => HomeView(),
    '/hub': (context) => HubView(),
    '/add_property': (context) => AddPropertyView(),
  };
}
