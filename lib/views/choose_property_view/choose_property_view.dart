import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/views/add_property_view/widgets/custom_labeled_text_field.dart';

class ChoosePropertyView extends StatelessWidget {
  const ChoosePropertyView({super.key});

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
        Spacer(),
        Expanded(
          child: _pageTitle(),
        ),
        Spacer(),
        Expanded(
          flex: 2,
          child: _informationSection(),
        ),
        Expanded(
          child: _actionsRow(),
        ),
        Spacer(),
      ],
    );
  }

  Widget _pageTitle() {
    return Text(
      "قم بتحديد العقار الذي يتبع له المقسم",
      style: Get.theme.textTheme.displaySmall?.copyWith(
        fontWeight: FontWeight.bold,
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
            _cityTextField(),
            SizedBox(
              height: AppLayout.height(20),
            ),
            _propertyIdTextField(),
          ],
        ),
      ),
    );
  }

  Widget _propertyIdTextField() {
    return CustomLabeledTextField(
      label: "رقم العقار",
    );
  }

  Widget _cityTextField() {
    return CustomLabeledTextField(
      label: "المنطقة",
    );
  }

  Widget _actionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _nextButton(),
      ],
    );
  }

  Widget _nextButton() {
    return CustomTextButton(
      label: "التالي",
      onPressed: () => Get.toNamed(AppRoutes.addLot),
    );
  }
}
