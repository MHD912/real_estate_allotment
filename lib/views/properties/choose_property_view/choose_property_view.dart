import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/properties/choose_property_controller.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/widgets/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/views/properties/add_property_view/widgets/custom_labeled_text_field.dart';

enum ChoosePropertyViewMode { lotProperty, allotmentProperty }

class ChoosePropertyView extends StatelessWidget {
  final ChoosePropertyViewMode viewMode;
  final _controller = Get.find<ChoosePropertyController>();
  ChoosePropertyView({
    super.key,
    required this.viewMode,
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
        _pageTitle(),
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 2,
          child: _informationSection(),
        ),
        Expanded(
          flex: 3,
          child: _actionsRow(),
        ),
        Spacer(),
      ],
    );
  }

  Widget _pageTitle() {
    return Text(
      (viewMode == ChoosePropertyViewMode.lotProperty)
          ? "قم بتحديد العقار الذي يتبع له المقسم"
          : "قم بتحديد عقار لإضافة اختصاص ",
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
              child: _propertyIdTextField(),
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

  Widget _propertyIdTextField() {
    return CustomLabeledTextField(
      label: "رقم العقار",
      controller: _controller.propertyIdController,
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
        (viewMode == ChoosePropertyViewMode.lotProperty)
            ? AppRoutes.addLot
            : AppRoutes.addPropertyAllotment,
      ),
    );
  }
}
