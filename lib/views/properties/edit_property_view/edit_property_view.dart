import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/properties/edit_property_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/views/properties/add_property_view/widgets/custom_labeled_text_field.dart';

class EditPropertyView extends StatelessWidget {
  final _controller = Get.find<EditPropertyController>();
  EditPropertyView({super.key});

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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Spacer(),
        _pageTitle(),
        Spacer(),
        _informationSection(),
        _actionsRow(),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }

  Widget _pageTitle() {
    return Expanded(
      flex: 2,
      child: Text(
        "تعديل عقار",
        style: Get.theme.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _informationSection() {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 6,
          children: [
            _propertyValueTextField(),
            _propertyIdTextField(),
            _totalShareTextField(),
            _cityTextField(),
          ],
        ),
      ),
    );
  }

  Widget _propertyValueTextField() {
    return CustomLabeledTextField(
      label: "قيمة العقار",
      controller: _controller.propertyValueController,
    );
  }

  Widget _propertyIdTextField() {
    return CustomLabeledTextField(
      label: "رقم العقار",
      controller: _controller.propertyIdController,
    );
  }

  Widget _totalShareTextField() {
    return CustomLabeledTextField(
      label: "الحصة الكلية",
      controller: _controller.totalShareController,
    );
  }

  Widget _cityTextField() {
    return CustomLabeledTextField(
      label: "المنطقة",
      controller: _controller.cityController,
    );
  }

  Widget _actionsRow() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _saveButton(),
          SizedBox(
            width: AppLayout.width(60),
          ),
          _resetButton(),
        ],
      ),
    );
  }

  Widget _saveButton() {
    return CustomTextButton(
      label: "حفظ",
      onPressed: () {},
    );
  }

  Widget _resetButton() {
    return CustomTextButton(
      onPressed: () {},
      label: "استعادة",
      backgroundColor: Get.theme.colorScheme.secondaryContainer,
    );
  }
}
