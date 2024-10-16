import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/templates/home_content_template.dart';

class LotsView extends StatelessWidget {
  const LotsView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeContentTemplate(
      pageTitle: "إدارة المقاسم",
      leftButtonLabel: "إضافة مقسم",
      leftButtonOnPressed: () => Get.toNamed(AppRoutes.chooseLotProperty),
      rightButtonLabel: "عرض المقاسم",
      rightButtonOnPressed: () => Get.toNamed(AppRoutes.findLot),
    );
  }
}
