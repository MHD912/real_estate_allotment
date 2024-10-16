import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/templates/home_content_template.dart';

class AllotmentsView extends StatelessWidget {
  const AllotmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeContentTemplate(
      pageTitle: "إدارة الاختصاص",
      leftButtonLabel: "إضافة اختصاص",
      leftButtonOnPressed: () => Get.toNamed(AppRoutes.allotmentTypeAdd),
      rightButtonLabel: "عرض الاختصاص",
      rightButtonOnPressed: () => Get.toNamed(AppRoutes.allotmentTypeFind),
    );
  }
}
