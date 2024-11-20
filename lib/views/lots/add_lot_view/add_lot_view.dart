import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/lots/add_lot_controller.dart';
import 'package:real_estate_allotment/controllers/lots/lot_controller.dart';
import 'package:real_estate_allotment/controllers/properties/property_details_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_labeled_text_field.dart';
import 'package:real_estate_allotment/core/widgets/property_details_widget.dart';

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
          flex: 3,
          child: _pageTitle(),
        ),
        Expanded(
          flex: 3,
          child: _informationSection(),
        ),
        Spacer(),
        Expanded(
          child: _actionsRow(context),
        ),
        Spacer(),
      ],
    );
  }

  Widget _pageTitle() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        "إضافة مقسم جديد",
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
            PropertyDetailsWidget(
              isAllotment: false,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _lotNumberTextField(),
            ),
            Expanded(
              child: _lotValueTextField(),
            ),
            Expanded(
              child: _totalShareTextField(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lotNumberTextField() {
    return CustomLabeledTextField(
      label: "رقم المقسم",
      controller: _controller.lotNumberController,
      inputFormat: InputFormat.digits,
    );
  }

  Widget _lotValueTextField() {
    return CustomLabeledTextField(
      label: "قيمة المقسم",
      controller: _controller.lotValueController,
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

  Widget _actionsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _addButton(context),
        SizedBox(
          width: AppLayout.width(50),
        ),
        _resetButton(),
      ],
    );
  }

  Widget _addButton(BuildContext context) {
    return CustomTextButton(
      label: "إضافة",
      onPressed: () async {
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
      },
    );
  }

  Widget _resetButton() {
    return CustomTextButton(
      onPressed: () => _controller.resetInput(),
      label: "إعادة تعيين",
      backgroundColor: Get.theme.colorScheme.secondaryContainer,
    );
  }
}
