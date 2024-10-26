import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/templates/home_content_template.dart';

class PropertiesView extends StatelessWidget {
  const PropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeContentTemplate(
      pageTitle: "إدارة العقارات",
      leftButtonLabel: "إضافة عقار",
      leftButtonOnPressed: () => Get.toNamed(AppRoutes.addProperty),
      rightButtonLabel: "عرض العقارات",
      rightButtonOnPressed: () => Get.toNamed(AppRoutes.allProperties),
    );
  }
}
