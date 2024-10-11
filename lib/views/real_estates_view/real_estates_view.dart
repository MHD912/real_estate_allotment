import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/custom_outlined_button.dart';

class RealEstatesView extends StatelessWidget {
  const RealEstatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Spacer(),
        Flexible(
          child: Text(
            "إدارة العقارات",
            style: Get.theme.textTheme.displayMedium,
          ),
        ),
        Spacer(
          flex: 2,
        ),
        _actionsSection(),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }

  Expanded _actionsSection() {
    return Expanded(
      flex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _addPropertyButton(),
          SizedBox(
            width: AppLayout.width(80),
          ),
          _viewPropertiesButton(),
        ],
      ),
    );
  }

  CustomOutlinedButton _addPropertyButton() {
    return CustomOutlinedButton(
      label: "إضافة عقار",
      onPressed: () => Get.toNamed(
        AppRoutes.addProperty,
      ),
    );
  }

  CustomOutlinedButton _viewPropertiesButton() {
    return CustomOutlinedButton(
      label: "عرض العقارات",
      onPressed: () => Get.toNamed(
        AppRoutes.allProperties,
      ),
    );
  }
}
