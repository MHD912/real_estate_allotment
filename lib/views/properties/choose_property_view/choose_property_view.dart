import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/choose_object_controller.dart';
import 'package:real_estate_allotment/controllers/properties/choose_property_controller.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/back_button_shortcut.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/core/widgets/type_a_head_labeled_text_field.dart';

enum ChoosePropertyViewMode { propertyLot, propertyAllotment }

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
      body: BackButtonShortcut(
        child: Focus(
          autofocus: true,
          canRequestFocus: true,
          focusNode: _controller.escapeFocus,
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
      ),
    );
  }

  Widget _viewContent(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        _pageTitle(context),
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

  Widget _pageTitle(BuildContext context) {
    return Text(
      (viewMode == ChoosePropertyViewMode.propertyLot)
          ? "قم بتحديد العقار الذي يتبع له المقسم"
          : "قم بتحديد عقار لإضافة اختصاص ",
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
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
      focusNode: _controller.cityFocus,
      nextNode: _controller.escapeFocus,
      controller: _controller.cityController,
      suggestionsController: SuggestionsController(),
      suggestionsCallback: (search) async {
        _controller.propertyNumberSuggestionsController.refresh();
        return await _controller.getCities(search);
      },
      onEditingComplete: () => _controller.escapeFocus.requestFocus(),
    );
  }

  Widget _propertyNumberTextField() {
    return TypeAHeadLabeledTextField(
      label: "رقم العقار",
      inputFormat: InputFormat.digits,
      nextNode: _controller.escapeFocus,
      focusNode: _controller.propertyNumberFocus,
      controller: _controller.propertyNumberController,
      suggestionsController: _controller.propertyNumberSuggestionsController,
      suggestionsCallback: (search) async {
        return await _controller.getPropertyNumbers(search);
      },
      onEditingComplete: () => _controller.escapeFocus.requestFocus(),
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

        if (result case CheckResult.success) {
          Get.toNamed(
            (viewMode == ChoosePropertyViewMode.propertyLot)
                ? AppRoutes.addLot
                : AppRoutes.addPropertyAllotment,
            arguments: {
              'property': _controller.property,
            },
          )?.then(
            (value) => _controller.escapeFocus.requestFocus(),
          );
        } else if (result case CheckResult.requiredInput) {
          AppToast.show(
            context: context,
            type: AppToastType.error,
            description: "يجب تعبئة كافة الحقول.",
          );
        } else {
          AppToast.show(
            context: context,
            type: AppToastType.error,
            description: "المعلومات المدخلة غير صحيحة",
          );
        }
      },
    );
  }
}
