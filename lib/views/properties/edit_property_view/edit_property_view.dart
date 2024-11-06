import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/properties/all_properties_controller.dart';
import 'package:real_estate_allotment/controllers/properties/edit_property_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_labeled_text_field.dart';

import '../../../controllers/properties/property_controller.dart';

class EditPropertyView extends StatelessWidget {
  final _controller = Get.find<EditPropertyController>();

  EditPropertyView({super.key}) {
    _controller.existingProperty = Get.arguments['property'];
    _controller.clearInput();
  }

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
        _actionsRow(context),
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
            _propertyNumberTextField(),
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
      inputFormat: InputFormat.digits,
    );
  }

  Widget _propertyNumberTextField() {
    return CustomLabeledTextField(
      label: "رقم العقار",
      controller: _controller.propertyNumberController,
      inputFormat: InputFormat.digits,
    );
  }

  Widget _totalShareTextField() {
    return CustomLabeledTextField(
      label: "الحصة الكلية",
      controller: _controller.totalShareController,
      inputFormat: InputFormat.decimal,
    );
  }

  Widget _cityTextField() {
    return CustomLabeledTextField(
      label: "المنطقة",
      controller: _controller.cityController,
    );
  }

  Widget _actionsRow(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _saveButton(context),
          SizedBox(
            width: AppLayout.width(60),
          ),
          _resetButton(),
        ],
      ),
    );
  }

  Widget _saveButton(BuildContext context) {
    return CustomTextButton(
      label: "حفظ",
      onPressed: () async {
        final result = await _controller.submitProperty();
        if (!context.mounted) return;
        switch (result) {
          case InputResult.success:
            AppToast.show(
              context: context,
              type: AppToastType.success,
              description: "تم تعديل معلومات العقار.",
            );
            Get.find<AllPropertiesController>().update();
            Get.back();
            break;
          case InputResult.requiredInput:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "يجب تعبئة كافة الحقول.",
            );
            break;
          case InputResult.duplicateNumberForCity:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "يوجد عقار بهذا الرقم في هذه المنطقة مسجل مسبقاً.",
            );
            break;
          case InputResult.error:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "لم نتمكن من إضافة هذا العقار.",
            );
            break;
          case InputResult.valueExceeded:
            // TODO: use a dialog to make the user choose between applying the change by deleting conflicting lots, or discarding the update
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description:
                  "القيمة الجديدة للعقار لا تتناسب مع مجموع قيم المقاسم المرتبطة به.",
            );
            break;
          case InputResult.shareExceeded:
            // TODO: use a dialog to make the user choose between applying the change by deleting conflicting allotments, or discarding the update
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description:
                  "الحصة الكلية الجديدة للعقار لا تتناسب مع مجموع حصص المالكين له.",
            );
            break;
        }
      },
    );
  }

  Widget _resetButton() {
    return CustomTextButton(
      onPressed: () => _controller.clearInput(),
      label: "استعادة",
      backgroundColor: Get.theme.colorScheme.secondaryContainer,
    );
  }
}
