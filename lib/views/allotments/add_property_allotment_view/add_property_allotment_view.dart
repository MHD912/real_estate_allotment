import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/views/allotments/widgets/property_details_widget.dart';
import 'package:real_estate_allotment/views/properties/add_property_view/widgets/custom_labeled_text_field.dart';

class AddPropertyAllotment extends StatelessWidget {
  const AddPropertyAllotment({super.key});

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
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: _pageTitle(),
        ),
        Expanded(
          flex: 4,
          child: _informationSection(),
        ),
        Spacer(),
        Expanded(
          child: _actionsRow(),
        ),
        Spacer(),
      ],
    );
  }

  Widget _pageTitle() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        "إضافة اختصاص عقار",
        style: Get.theme.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _informationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: SizedBox(
        width: Get.mediaQuery.size.width,
        child: Column(
          children: [
            Expanded(
              child: PropertyDetailsWidget(),
            ),
            Expanded(
              child: _ownerNameTextField(),
            ),
            Expanded(
              child: _shareTextField(),
            ),
            Expanded(
              child: _participationRateTextField(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ownerNameTextField() {
    return CustomLabeledTextField(
      label: "اسم المالك",
    );
  }

  Widget _shareTextField() {
    return CustomLabeledTextField(
      label: "الحصة السهمية",
    );
  }

  Widget _participationRateTextField() {
    return CustomLabeledTextField(
      label: "نسبة المشاركة",
    );
  }

  Widget _actionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _addButton(),
        SizedBox(
          width: AppLayout.width(50),
        ),
        _resetButton(),
      ],
    );
  }

  Widget _addButton() {
    return CustomTextButton(
      label: "إضافة",
      onPressed: () {},
    );
  }

  Widget _resetButton() {
    return CustomTextButton(
      onPressed: () {},
      label: "إعادة تعيين",
      backgroundColor: Get.theme.colorScheme.secondaryContainer,
    );
  }
}
