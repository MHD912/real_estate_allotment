import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_lot_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/lot_allotment/edit_lot_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/lot_allotment/lot_details_controller.dart';
import 'package:real_estate_allotment/controllers/lots/choose_lot_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/views/allotments/widgets/lot_details_widget.dart';
import 'package:real_estate_allotment/core/widgets/custom_labeled_text_field.dart';

class EditLotAllotmentView extends StatelessWidget {
  final _controller = Get.find<EditLotAllotmentController>();
  EditLotAllotmentView({super.key}) {
    final chooseLotController = Get.find<ChooseLotController>();
    _controller.property = chooseLotController.property!;
    _controller.lot = chooseLotController.lot!;
    _controller.existingAllotment = Get.arguments['allotment'];
    _controller.resetInput();
    Get.lazyPut(
      () => LotDetailsController(
        city: _controller.property.city,
        propertyNumber: _controller.property.propertyNumber,
        lotNumber: _controller.lot.lotNumber,
        remainingShare: _controller.lot.remainingShare,
      ),
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
        Spacer(),
        _pageTitle(),
        Spacer(),
        Expanded(
          flex: 3,
          child: _informationSection(),
        ),
        Spacer(),
        Expanded(
          child: _actionsRow(context),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }

  Widget _pageTitle() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        "تعديل اختصاص مقسم",
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
              child: LotDetailsWidget(),
            ),
            Expanded(
              child: _ownerNameTextField(),
            ),
            Expanded(
              child: _shareTextField(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ownerNameTextField() {
    return CustomLabeledTextField(
      label: "اسم المالك",
      controller: _controller.shareholderNameController,
    );
  }

  Widget _shareTextField() {
    return CustomLabeledTextField(
      label: "الحصة السهمية",
      controller: _controller.shareController,
    );
  }

  Widget _actionsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _saveButton(context),
        SizedBox(
          width: AppLayout.width(50),
        ),
        _resetButton(),
      ],
    );
  }

  Widget _saveButton(BuildContext context) {
    return CustomTextButton(
      label: "إضافة",
      onPressed: () async {
        final result = await _controller.submitLotAllotment();
        if (!context.mounted) return;

        switch (result) {
          case InputResult.success:
            AppToast.show(
              context: context,
              type: AppToastType.success,
              description: "تم تعديل الاختصاص بنجاح.",
            );
            final findAllotmentController = Get.find<FindAllotmentController>()
                as FindLotAllotmentController;
            await findAllotmentController.getAllotments(
              allotedObjectId: _controller.lot.id,
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
      },
    );
  }

  Widget _resetButton() {
    return CustomTextButton(
      onPressed: () => _controller.resetInput(),
      label: "استعادة",
      backgroundColor: Get.theme.colorScheme.secondaryContainer,
    );
  }
}
