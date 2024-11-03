import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_property_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/property_allotment/edit_property_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/properties/choose_property_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/core/widgets/property_details_widget.dart';
import 'package:real_estate_allotment/core/widgets/custom_labeled_text_field.dart';
import 'package:real_estate_allotment/core/widgets/type_a_head_labeled_text_field.dart';

class EditPropertyAllotmentView extends StatelessWidget {
  final _controller = Get.find<EditPropertyAllotmentController>();
  final _choosePropertyController = Get.find<ChoosePropertyController>();
  EditPropertyAllotmentView({super.key}) {
    _controller.propertyAllotment = Get.arguments['allotment'];
    _controller.stakeholderName = Get.arguments['stakeholder_name'];
    _controller.propertyId = _controller.propertyAllotment.propertyId;
    _controller.resetInput();
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
          flex: 2,
          child: _pageTitle(),
        ),
        Expanded(
          flex: 4,
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
        "تعديل اختصاص عقار",
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
              child: PropertyDetailsWidget(
                propertyNumber: _choosePropertyController.currentPropertyNumber,
                city: _choosePropertyController.currentCity,
              ),
            ),
            Expanded(
              child: _ownerNameTextField(),
            ),
            Expanded(
              child: _shareTextField(),
            ),
            Expanded(
              child: _participationRateTextField(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ownerNameTextField() {
    return TypeAHeadLabeledTextField(
      label: "اسم المالك",
      controller: _controller.ownerNameController,
      suggestionsCallback: (input) async {
        return await _controller.getStakeholderNames(name: input);
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

  Widget _participationRateTextField() {
    return CustomLabeledTextField(
      label: "نسبة المشاركة",
      controller: _controller.participationRateController,
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
      onPressed: () async {
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
              allotedObjectId: _controller.propertyId,
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
      label: "حفظ",
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
