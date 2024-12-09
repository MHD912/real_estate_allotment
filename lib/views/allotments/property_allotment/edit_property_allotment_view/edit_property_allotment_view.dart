import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_property_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/property_allotment/edit_property_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/properties/choose_property_controller.dart';
import 'package:real_estate_allotment/controllers/properties/property_details_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/utilities/back_button_shortcut.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/core/widgets/property_details_widget.dart';
import 'package:real_estate_allotment/core/widgets/custom_labeled_text_field.dart';
import 'package:real_estate_allotment/views/allotments/property_allotment/widgets/contractor_checkbox.dart';

class EditPropertyAllotmentView extends StatelessWidget {
  final _controller = Get.find<EditPropertyAllotmentController>();

  EditPropertyAllotmentView({super.key}) {
    _controller.property = Get.find<ChoosePropertyController>().property!;
    _controller.existingAllotment = Get.arguments['allotment'];
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
          flex: 2,
          child: _pageTitle(context),
        ),
        Expanded(
          flex: 4,
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
        "تعديل اختصاص عقار",
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
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
        width: Get.mediaQuery.size.width,
        child: Column(
          children: [
            Expanded(
              child: PropertyDetailsWidget(
                isAllotment: true,
              ),
            ),
            Expanded(
              child: _ownerNameTextField(context),
            ),
            Expanded(
              child: _shareTextField(context),
            ),
            Expanded(
              child: _participationRateTextField(context),
            ),
            const SizedBox(height: 5),
            GetBuilder<EditPropertyAllotmentController>(
              id: 'contractor',
              builder: (controller) {
                return ContractorCheckbox(
                  controller: controller,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _ownerNameTextField(BuildContext context) {
    return CustomLabeledTextField(
      autofocus: true,
      label: "اسم المالك",
      controller: _controller.shareholderNameController,
      focusNode: _controller.shareholderNameFocus,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(_controller.shareFocus);
      },
    );
  }

  Widget _shareTextField(BuildContext context) {
    return CustomLabeledTextField(
      label: "الحصة السهمية",
      inputFormat: InputFormat.decimal,
      controller: _controller.shareController,
      focusNode: _controller.shareFocus,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(_controller.participationRateFocus);
      },
    );
  }

  Widget _participationRateTextField(BuildContext context) {
    return CustomLabeledTextField(
      label: "نسبة المشاركة",
      inputFormat: InputFormat.decimal,
      controller: _controller.participationRateController,
      focusNode: _controller.participationRateFocus,
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
      onPressed: () async {
        await _submitInfo(context);
      },
      label: "حفظ",
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
    final result = await _controller.submitPropertyAllotment();
    if (!context.mounted) return;

    switch (result) {
      case InputResult.success:
        AppToast.show(
          context: context,
          type: AppToastType.success,
          description: "تم تعديل الاختصاص بنجاح.",
        );
        final findAllotmentController = Get.find<FindAllotmentController>()
            as FindPropertyAllotmentController;
        await findAllotmentController.getAllotments(
          allotedObjectId: _controller.property.id,
        );
        findAllotmentController.update();
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
          description: "لم نتمكن من تعديل هذا الاختصاص.",
        );
        break;
      case InputResult.shareDepleted:
        AppToast.show(
          context: context,
          type: AppToastType.error,
          description: "لم يتبقى أسهم كافية لتغطية الحصة السهمية المدخلة.",
        );
        break;
      default:
    }
  }
}
