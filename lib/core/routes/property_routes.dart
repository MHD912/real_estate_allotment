import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_bindings.dart';
import 'package:real_estate_allotment/views/properties/add_property_view/add_property_view.dart';
import 'package:real_estate_allotment/views/properties/all_properties_view/all_properties_view.dart';
import 'package:real_estate_allotment/views/properties/choose_property_view/choose_property_view.dart';
import 'package:real_estate_allotment/views/properties/edit_property_view/edit_property_view.dart';

class PropertyRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.addProperty,
      page: () => AddPropertyView(),
      binding: AddPropertyBindings(),
    ),
    GetPage(
      name: AppRoutes.editProperty,
      page: () => EditPropertyView(),
      binding: EditPropertyBindings(),
    ),
    GetPage(
      name: AppRoutes.allProperties,
      page: () => AllPropertiesView(),
      binding: AllPropertiesBindings(),
    ),
    GetPage(
      name: AppRoutes.chooseLotProperty,
      page: () => ChoosePropertyView(
        viewMode: ChoosePropertyViewMode.lotProperty,
      ),
      binding: ChoosePropertyBindings(),
    ),
  ];
}
