import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/properties/choose_property_controller.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/core/widgets/type_a_head_labeled_text_field.dart';

enum ChoosePropertyViewMode { lotProperty, allotmentProperty }

class ChoosePropertyView extends StatelessWidget {
  final ChoosePropertyViewMode viewMode;
  final _controller = Get.find<ChoosePropertyController>();
  ChoosePropertyView({
    super.key,
    required this.viewMode,
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
        _pageTitle(),
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 2,
          child: _informationSection(),
        ),
        Expanded(
          flex: 3,
          child: _actionsRow(context),
        ),
        Spacer(),
      ],
    );
  }

  Widget _pageTitle() {
    return Text(
      (viewMode == ChoosePropertyViewMode.lotProperty)
          ? "قم بتحديد العقار الذي يتبع له المقسم"
          : "قم بتحديد عقار لإضافة اختصاص ",
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
          ],
        ),
      ),
    );
  }

  Widget _cityTextField() {
    return TypeAHeadLabeledTextField(
      label: "المنطقة",
      controller: _controller.cityController,
      suggestionsCallback: (search) async {
        _controller.propertyNumberSuggestionsController.refresh();
        return await _controller.getCities(search);
      },
    );
  }

  Widget _propertyNumberTextField() {
    return TypeAHeadLabeledTextField(
      label: "رقم العقار",
      controller: _controller.propertyNumberController,
      inputFormat: InputFormat.digits,
      suggestionsController: _controller.propertyNumberSuggestionsController,
      suggestionsCallback: (search) async {
        return await _controller.getPropertyNumbers(search);
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
        final result = await _controller.checkInput();
        if (result == CheckResult.success) {
          Get.toNamed(
            (viewMode == ChoosePropertyViewMode.lotProperty)
                ? AppRoutes.addLot
                : AppRoutes.addPropertyAllotment,
            arguments: {
              'property_id': _controller.propertyId,
              'property_number': _controller.propertyNumberController.text,
              'city': _controller.cityController.text,
            },
          );
        } else if (result == CheckResult.error) {
          if (!context.mounted) return;
          AppToast.show(
            context: context,
            type: AppToastType.error,
            description: "المعلومات المدخلة غير صحيحة",
          );
        } else {
          if (!context.mounted) return;
          AppToast.show(
            context: context,
            type: AppToastType.error,
            description: "يجب تعبئة كافة الحقول.",
          );
        }
      },
    );
  }
}
