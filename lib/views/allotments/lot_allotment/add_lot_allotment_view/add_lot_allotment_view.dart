import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/lot_allotment/add_lot_allotment_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/core/widgets/type_a_head_labeled_text_field.dart';
import 'package:real_estate_allotment/views/allotments/widgets/lot_details_widget.dart';
import 'package:real_estate_allotment/core/widgets/custom_labeled_text_field.dart';

class AddLotAllotment extends StatelessWidget {
  final _controller = Get.find<AddLotAllotmentController>();
  AddLotAllotment({super.key}) {
    _controller.property = Get.arguments['property'];
    _controller.lot = Get.arguments['lot'];
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
        "إضافة اختصاص مقسم",
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
              child: LotDetailsWidget(
                propertyNumber: _controller.property.propertyNumber,
                city: _controller.property.city,
                lotNumber: _controller.lot.lotNumber,
              ),
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
    return TypeAHeadLabeledTextField(
      label: "اسم المالك",
      controller: _controller.shareholderNameController,
      suggestionsController: SuggestionsController(),
      suggestionsCallback: (input) async {
        return await _controller.getShareholderNames(
          name: input,
        );
      },
    );
  }

  Widget _shareTextField() {
    return CustomLabeledTextField(
      label: "الحصة السهمية",
      controller: _controller.shareController,
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
        final result = await _controller.submitLotAllotment();
        if (!context.mounted) return;

        switch (result) {
          case InputResult.success:
            AppToast.show(
              context: context,
              type: AppToastType.success,
              description: "تم إضافة الاختصاص بنجاح.",
            );
            break;
          case InputResult.requiredInput:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "يجب تعبئة كافة الحقول.",
            );
            break;
          case InputResult.duplicateShareholder:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "يوجد اختصاص لهذا المالك في هذه المقسم مسجل مسبقاً.",
            );
            break;
          case InputResult.error:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "لم نتمكن من إضافة هذا الاختصاص.",
            );
            break;
          case InputResult.shareDepleted:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "لم يتبقى أسهم كافية لتغطية الحصة السهمية المدخلة.",
            );
            break;
        }
      },
    );
  }

  Widget _resetButton() {
    return CustomTextButton(
      onPressed: () {
        _controller.resetInput();
      },
      label: "إعادة تعيين",
      backgroundColor: Get.theme.colorScheme.secondaryContainer,
    );
  }
}
