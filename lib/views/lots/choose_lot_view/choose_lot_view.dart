import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/choose_object_controller.dart';
import 'package:real_estate_allotment/controllers/lots/choose_lot_controller.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/core/widgets/type_a_head_labeled_text_field.dart';

class ChooseLotView extends StatelessWidget {
  final _controller = Get.find<ChooseLotController>();
  ChooseLotView({
    super.key,
  });

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
        Expanded(
          child: _pageTitle(),
        ),
        Spacer(),
        Expanded(
          flex: 3,
          child: _informationSection(),
        ),
        Expanded(
          flex: 2,
          child: _actionsRow(context),
        ),
        Spacer(),
      ],
    );
  }

  Widget _pageTitle() {
    return Text(
      "قم بتحديد المقسم لإضافة اختصاص ",
      style: Get.theme.textTheme.displaySmall?.copyWith(
        fontWeight: FontWeight.bold,
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
              child: _cityTextField(),
            ),
            Expanded(
              child: _propertyNumberTextField(),
            ),
            Expanded(
              child: _lotNumberTextField(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cityTextField() {
    return TypeAHeadLabeledTextField(
      label: "المنطقة",
      controller: _controller.cityController,
      suggestionsController: SuggestionsController(),
      suggestionsCallback: (String input) async {
        _controller.propertyNumberSuggestionsController.refresh();
        return await _controller.getCities(input);
      },
    );
  }

  Widget _propertyNumberTextField() {
    return TypeAHeadLabeledTextField(
      label: "رقم العقار",
      inputFormat: InputFormat.digits,
      controller: _controller.propertyNumberController,
      suggestionsController: _controller.propertyNumberSuggestionsController,
      suggestionsCallback: (String input) async {
        _controller.lotNumberSuggestionsController.refresh();
        return await _controller.getPropertyNumbers(input);
      },
    );
  }

  Widget _lotNumberTextField() {
    return TypeAHeadLabeledTextField(
      label: "رقم المقسم",
      inputFormat: InputFormat.digits,
      controller: _controller.lotNumberController,
      suggestionsController: _controller.lotNumberSuggestionsController,
      suggestionsCallback: (String input) async {
        return await _controller.getLotNumbers(input);
      },
    );
  }

  Widget _actionsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _nextButton(context),
      ],
    );
  }

  Widget _nextButton(BuildContext context) {
    return CustomTextButton(
      label: "التالي",
      onPressed: () async {
        final result = await _controller.submitInput();
        if (!context.mounted) return;
        switch (result) {
          case CheckResult.success:
            Get.toNamed(
              AppRoutes.addLotAllotment,
              arguments: {
                'property': _controller.property,
                'lot': _controller.lot,
              },
            );
            break;
          case CheckResult.requiredInput:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "يجب تعبئة كافة الحقول.",
            );
            break;
          case CheckResult.propertyError:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "المعلومات العقار المدخلة غير صحيحة",
            );
            break;
          case CheckResult.lotError:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "المعلومات المقسم المدخلة غير صحيحة",
            );
            break;
          case CheckResult.error:
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "المعلومات المدخلة غير صحيحة",
            );
            break;
        }
      },
    );
  }
}
