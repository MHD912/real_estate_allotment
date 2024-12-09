import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/lots/edit_lot_controller.dart';
import 'package:real_estate_allotment/controllers/lots/find_lot_controller.dart';
import 'package:real_estate_allotment/controllers/lots/lot_controller.dart';
import 'package:real_estate_allotment/controllers/properties/choose_property_controller.dart';
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

class EditLotView extends StatelessWidget {
  final _controller = Get.find<EditLotController>();
  final _choosePropertyController = Get.find<ChoosePropertyController>();
  EditLotView({
    super.key,
  }) {
    _controller.property = _choosePropertyController.property!;
    _controller.existingLot = Get.arguments['lot'];
    _controller.resetInput();
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
          flex: 3,
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
        "تعديل مقسم",
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
    );
  }

  Widget _informationSection(BuildContext context) {
    return SizedBox(
      width: Get.mediaQuery.size.width,
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
        ],
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
        await _submitInfo(context);
      },
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
          description: "تم تعديل معلومات المقسم.",
        );
        final findLotController = Get.find<FindLotController>();
        await findLotController.getLots(
          propertyId: _controller.existingLot.propertyId,
        );
        findLotController.update();
        Get.back();
        break;
      case InputResult.requiredInput:
        AppToast.show(
          context: context,
          type: AppToastType.error,
          description: "يجب تعبئة كافة الحقول.",
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
      default:
    }
  }
}
