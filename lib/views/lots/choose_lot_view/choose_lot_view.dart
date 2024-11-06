import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/lots/choose_lot_controller.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_labeled_text_field.dart';

class ChooseLotView extends StatelessWidget {
  final _controller = Get.find<ChooseLotController>();
  ChooseLotView({
    super.key,
  });

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
          flex: 3,
          child: _informationSection(),
        ),
        Expanded(
          flex: 2,
          child: _actionsRow(),
        ),
        Spacer(),
      ],
    );
  }

  Widget _pageTitle() {
    return Text(
      "قم بتحديد المقسم لإضافة اختصاص ",
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
            Expanded(
              child: _cityTextField(),
            ),
            Expanded(
              child: _propertyNumberTextField(),
            ),
            Expanded(
              child: _lotNumberTextField(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cityTextField() {
    return CustomLabeledTextField(
      label: "المنطقة",
      controller: _controller.cityController,
    );
  }

  Widget _propertyNumberTextField() {
    return CustomLabeledTextField(
      label: "رقم العقار",
      controller: _controller.propertyNumberController,
    );
  }

  Widget _lotNumberTextField() {
    return CustomLabeledTextField(
      label: "رقم المقسم",
      controller: _controller.lotNumberController,
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
      onPressed: () => Get.toNamed(
        AppRoutes.addLotAllotment,
      ),
    );
  }
}
