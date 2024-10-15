import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/custom_outlined_button.dart';

class LotsView extends StatelessWidget {
  const LotsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Spacer(),
        Flexible(
          child: Text(
            "إدارة المقاسم",
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
          _addLotButton(),
          SizedBox(
            width: AppLayout.width(80),
          ),
          _viewLotsButton(),
        ],
      ),
    );
  }

  CustomOutlinedButton _addLotButton() {
    return CustomOutlinedButton(
      label: "إضافة مقسم",
      onPressed: () => Get.toNamed(AppRoutes.chooseProperty),
    );
  }

  CustomOutlinedButton _viewLotsButton() {
    return CustomOutlinedButton(
      label: "عرض المقاسم",
      onPressed: () {},
    );
  }
}
