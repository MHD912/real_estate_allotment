import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/properties/all_properties_controller.dart';
import 'package:real_estate_allotment/controllers/properties/edit_property_controller.dart';
import 'package:real_estate_allotment/controllers/properties/property_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/utilities/back_button_shortcut.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_labeled_text_field.dart';

class EditPropertyView extends StatelessWidget {
  final _controller = Get.find<EditPropertyController>();

  EditPropertyView({super.key}) {
    _controller.existingProperty = Get.arguments['property'];
    _controller.resetInput();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackButtonShortcut(
        child: AppWindowBorder(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
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
      ),
    );
  }

  Widget _viewContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Spacer(),
        _pageTitle(context),
        Spacer(),
        _informationSection(context),
        _actionsRow(context),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }

  Widget _pageTitle(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Text(
        "تعديل عقار",
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
    );
  }

  Widget _informationSection(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 6,
          children: [
            _propertyValueTextField(context),
            _propertyNumberTextField(context),
            _totalShareTextField(context),
            _cityTextField(context),
          ],
        ),
      ),
    );
  }

  Widget _propertyNumberTextField(BuildContext context) {
    return CustomLabeledTextField(
      autofocus: true,
      label: "رقم العقار",
      controller: _controller.propertyNumberController,
      inputFormat: InputFormat.digits,
      focusNode: _controller.propertyNumberFocus,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(_controller.propertyValueFocus);
      },
    );
  }

  Widget _propertyValueTextField(BuildContext context) {
    return CustomLabeledTextField(
      label: "قيمة العقار",
      controller: _controller.propertyValueController,
      inputFormat: InputFormat.currency,
      focusNode: _controller.propertyValueFocus,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(_controller.cityFocus);
      },
    );
  }

  Widget _cityTextField(BuildContext context) {
    return CustomLabeledTextField(
      label: "المنطقة",
      controller: _controller.cityController,
      focusNode: _controller.cityFocus,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(_controller.totalShareFocus);
      },
    );
  }

  Widget _totalShareTextField(BuildContext context) {
    return CustomLabeledTextField(
      label: "الحصة الكلية",
      controller: _controller.totalShareController,
      inputFormat: InputFormat.decimal,
      focusNode: _controller.totalShareFocus,
      onEditingComplete: () async {
        await _submitInfo(context);
      },
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
          _resetButton(context),
        ],
      ),
    );
  }

  Widget _saveButton(BuildContext context) {
    return CustomTextButton(
      label: "حفظ",
      onPressed: () async {
        await _submitInfo(context);
      },
    );
  }

  Widget _resetButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () => _controller.resetInput(),
      label: "استعادة",
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      textColor: Theme.of(context).colorScheme.onSurface,
    );
  }

  Future<void> _submitInfo(BuildContext context) async {
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
        AppToast.show(
          context: context,
          type: AppToastType.error,
          description:
              "القيمة الجديدة للعقار لا تتناسب مع مجموع قيم المقاسم المرتبطة به.",
        );
        break;
      case InputResult.shareExceeded:
        AppToast.show(
          context: context,
          type: AppToastType.error,
          description:
              "الحصة الكلية الجديدة للعقار لا تتناسب مع مجموع حصص المالكين له.",
        );
        break;
    }
  }
}
