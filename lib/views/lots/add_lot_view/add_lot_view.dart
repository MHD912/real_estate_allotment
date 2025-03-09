import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/lots/add_lot_controller.dart';
import 'package:real_estate_allotment/controllers/lots/lot_controller.dart';
import 'package:real_estate_allotment/controllers/properties/property_details_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/utilities/back_button_shortcut.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_labeled_text_field.dart';
import 'package:real_estate_allotment/core/widgets/property_details_widget.dart';
import 'package:real_estate_allotment/views/lots/lot_description_widget.dart';

class AddLotView extends StatelessWidget {
  final _controller = Get.find<AddLotController>();
  AddLotView({super.key}) {
    _controller.property = Get.arguments['property'];
    Get.lazyPut(
      () => PropertyDetailsController(property: _controller.property),
    );
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
      children: [
        Expanded(
          flex: 3,
          child: _pageTitle(context),
        ),
        Expanded(
          flex: 5,
          child: _informationSection(context),
        ),
        Spacer(),
        Expanded(
          child: _actionsRow(context),
        ),
        Spacer(),
      ],
    );
  }

  Widget _pageTitle(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        "إضافة مقسم جديد",
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
    );
  }

  Widget _informationSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            PropertyDetailsWidget(
              isAllotment: false,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _lotNumberTextField(context),
            ),
            Expanded(
              child: _lotValueTextField(context),
            ),
            Expanded(
              child: _totalShareTextField(context),
            ),
            Expanded(
              child: _lotDescriptionDropdownList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lotNumberTextField(BuildContext context) {
    return CustomLabeledTextField(
      autofocus: true,
      label: "رقم المقسم",
      inputFormat: InputFormat.digits,
      controller: _controller.lotNumberController,
      focusNode: _controller.lotNumberFocus,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(_controller.lotValueFocus);
      },
    );
  }

  Widget _lotValueTextField(BuildContext context) {
    return CustomLabeledTextField(
      label: "قيمة المقسم",
      inputFormat: InputFormat.currency,
      controller: _controller.lotValueController,
      focusNode: _controller.lotValueFocus,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(_controller.totalShareFocus);
      },
    );
  }

  Widget _totalShareTextField(BuildContext context) {
    return CustomLabeledTextField(
      label: "الحصة الكلية",
      inputFormat: InputFormat.decimal,
      controller: _controller.totalShareController,
      focusNode: _controller.totalShareFocus,
      onEditingComplete: () async {
        FocusScope.of(context).requestFocus(_controller.lotNumberFocus);
        await _submitInfo(context);
      },
    );
  }

  Widget _lotDescriptionDropdownList() {
    return LotDescriptionWidget(
      controller: _controller,
    );
  }

  Widget _actionsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _addButton(context),
        SizedBox(
          width: AppLayout.width(50),
        ),
        _resetButton(context),
      ],
    );
  }

  Widget _addButton(BuildContext context) {
    return CustomTextButton(
      label: "إضافة",
      onPressed: () async {
        await _submitInfo(context);
      },
    );
  }

  Widget _resetButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () => _controller.resetInput(),
      label: "إعادة تعيين",
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      textColor: Theme.of(context).colorScheme.onPrimaryContainer,
    );
  }

  Future<void> _submitInfo(BuildContext context) async {
    final result = await _controller.submitLot();
    if (!context.mounted) return;
    switch (result) {
      case InputResult.success:
        AppToast.show(
          context: context,
          type: AppToastType.success,
          description: "تم إضافة المقسم بنجاح.",
        );
        Get.find<PropertyDetailsController>().updateRemainingValue();
        _controller.resetInput();
        break;
      case InputResult.requiredInput:
        AppToast.show(
          context: context,
          type: AppToastType.error,
          description: "يجب تعبئة كافة الحقول.",
        );
        break;
      case InputResult.duplicateNumberForProperty:
        AppToast.show(
          context: context,
          type: AppToastType.error,
          description: "يوجد مقسم بهذا الرقم في هذا العقار مسجل مسبقاً.",
        );
        break;
      case InputResult.error:
        AppToast.show(
          context: context,
          type: AppToastType.error,
          description: "لم نتمكن من إضافة هذا المقسم.",
        );
        break;
      case InputResult.exceededPropertyValue:
        AppToast.show(
          context: context,
          type: AppToastType.error,
          description: "لقد تجاوز مجموع قيم المقاسم قيمة العقار الحالي.",
        );
        break;
      case InputResult.shareExceeded:
        AppToast.show(
          context: context,
          type: AppToastType.error,
          description:
              "مجموع حصص الاختصاصات غير متوافقة مع قيمة الحصة المدخلة.",
        );
        break;
    }
  }
}
