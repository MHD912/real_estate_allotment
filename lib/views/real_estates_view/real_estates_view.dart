import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/custom_button.dart';

class RealEstatesView extends StatelessWidget {
  const RealEstatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return _viewContent(context);
  }

  Widget _viewContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "إدارة العقارات",
          style: Get.theme.textTheme.displayMedium,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: AppLayout.height(80),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                label: "إضافة عقار",
                onPressed: () {},
              ),
              SizedBox(
                width: AppLayout.width(80),
              ),
              CustomButton(
                label: "تعديل عقار",
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(),
      ],
    );
  }
}
