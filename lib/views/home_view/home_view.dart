import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/templates/home_content_template.dart';
import 'package:real_estate_allotment/core/widgets/app_window_border.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppWindowBorder(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: HomeContentTemplate(
            pageTitle: "Real Estate Allotment",
            leftButtonLabel: "فتح دراسة سابقة",
            leftButtonOnPressed: () {},
            rightButtonLabel: "دراسة جديدة",
            rightButtonOnPressed: () => Get.toNamed(AppRoutes.hub),
          ),
        ),
      ),
    );
  }
}
