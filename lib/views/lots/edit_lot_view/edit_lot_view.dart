import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/lots/edit_lot_controller.dart';
import 'package:real_estate_allotment/controllers/lots/find_lot_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/dialogs/error_dialog.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_labeled_text_field.dart';

class EditLotView extends StatelessWidget {
  final _controller = Get.find<EditLotController>();
  EditLotView({super.key}) {
    _controller.lotId = Get.arguments['lot_id'];
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
              _futureViewContent(context),
              HubButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _futureViewContent(BuildContext context) {
    return FutureBuilder(
      future: _controller.getLotInfo(),
      builder: (context, snapshot) {
        return _viewContent(context);
      },
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
        "تعديل مقسم",
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
    );
  }

  Widget _lotValueTextField() {
    return CustomLabeledTextField(
      label: "قيمة المقسم",
      controller: _controller.lotValueController,
    );
  }

  Widget _totalShareTextField() {
    return CustomLabeledTextField(
      label: "الحصة الكلية",
      controller: _controller.totalShareController,
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
      label: "حفظ",
      onPressed: () async {
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
              propertyId: _controller.lot!.propertyId,
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
          case InputResult.duplicateNumberForProperty:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "يوجد مقسم بهذا الرقم في هذه العقار مسجل مسبقاً.",
            );
            break;
          case InputResult.error:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "لم نتمكن من إضافة هذا المقسم.",
            );
            break;
          default:
        }
      },
    );
  }

  Widget _resetButton() {
    return CustomTextButton(
      onPressed: () async {
        final success = _controller.setInput();
        if (!success) {
          await Get.dialog(
            ErrorDialog(),
          );
        }
      },
      label: "استعادة",
      backgroundColor: Get.theme.colorScheme.secondaryContainer,
    );
  }
}
