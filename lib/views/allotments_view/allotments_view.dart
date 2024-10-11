import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/custom_outlined_button.dart';

class AllotmentsView extends StatelessWidget {
  const AllotmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Spacer(),
        Flexible(
          child: Text(
            "إدارة الاختصاص",
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
          _addAllotmentButton(),
          SizedBox(
            width: AppLayout.width(80),
          ),
          _viewAllotmentsButton(),
        ],
      ),
    );
  }

  CustomOutlinedButton _addAllotmentButton() {
    return CustomOutlinedButton(
      label: "إضافة اختصاص",
      onPressed: () {},
    );
  }

  CustomOutlinedButton _viewAllotmentsButton() {
    return CustomOutlinedButton(
      label: "عرض الاختصاص",
      onPressed: () {},
    );
  }
}
