import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/templates/home_content_template.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/custom_outlined_button.dart';

class RealEstatesView extends StatelessWidget {
  const RealEstatesView({super.key});

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

  Text _pageTitle() {
    return Text(
      "إدارة العقارات",
      style: Get.theme.textTheme.displayMedium,
    );
  }

  Widget _actionsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _addPropertyButton(),
        SizedBox(
          width: AppLayout.width(80),
        ),
        _viewPropertiesButton(),
      ],
    );
  }

  CustomOutlinedButton _addPropertyButton() {
    return CustomOutlinedButton(
      label: "إضافة عقار",
      onPressed: () => Get.toNamed(AppRoutes.addProperty),
    );
  }

  CustomOutlinedButton _viewPropertiesButton() {
    return CustomOutlinedButton(
      label: "عرض العقارات",
      onPressed: () => Get.toNamed(AppRoutes.allProperties),
    );
  }
}
