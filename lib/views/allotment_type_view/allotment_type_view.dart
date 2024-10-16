import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/templates/home_content_template.dart';
import 'package:real_estate_allotment/core/widgets/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';

class AllotmentTypeView extends StatelessWidget {
  const AllotmentTypeView({super.key});

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
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              _viewContent(context),
              HubButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _viewContent(BuildContext context) {
    return HomeContentTemplate(
      pageTitle: "ما هو نوع الاختصاص",
      leftButtonLabel: "اختصاص مقسم",
      leftButtonOnPressed: () => Get.toNamed(
        AppRoutes.chooseAllotmentLot,
      ),
      rightButtonLabel: "اختصاص عقار",
      rightButtonOnPressed: () => Get.toNamed(
        AppRoutes.chooseAllotmentProperty,
      ),
    );
  }
}
