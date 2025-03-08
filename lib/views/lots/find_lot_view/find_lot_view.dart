import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/choose_object_controller.dart';
import 'package:real_estate_allotment/controllers/find_animation_controller.dart';
import 'package:real_estate_allotment/controllers/lots/find_lot_controller.dart';
import 'package:real_estate_allotment/controllers/properties/choose_property_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/utilities/back_button_shortcut.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/dialogs/loading_dialog.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/views/lots/find_lot_view/widgets/lot_item_widget.dart';
import 'package:real_estate_allotment/core/widgets/animated_custom_labeled_text_field.dart';

class FindLotView extends StatelessWidget {
  final _controller = Get.find<FindLotController>();
  final _choosePropertyController = Get.find<ChoosePropertyController>();
  final _animationController = Get.find<FindAnimationController>();

  FindLotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackButtonShortcut(
        child: Focus(
          autofocus: true,
          canRequestFocus: true,
          focusNode: _choosePropertyController.escapeFocus,
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
        Expanded(
          flex: 2,
          child: _pageTitle(context),
        ),
        Expanded(
          flex: 8,
          child: Stack(
            children: [
              _lotItemsRow(context),
              _infoActionRow(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _pageTitle(BuildContext context) {
    return GetBuilder<FindAnimationController>(
      builder: (controller) => Text(
        (controller.areLotsVisible)
            ? "اختر المقسم الذي ترغب بتعديله"
            : "قم بتحديد العقار الذي يتبع له المقسم",
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
    );
  }

  Widget _lotItemsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GetBuilder<FindLotController>(
            builder: (controller) {
              if (controller.lotsList.isNotEmpty) {
                return ListView.builder(
                  itemCount: controller.lotsList.length,
                  itemBuilder: (context, index) {
                    return LotItemWidget(
                      index: index,
                      lot: controller.lotsList[index],
                      propertyNumber:
                          _choosePropertyController.property!.propertyNumber,
                    );
                  },
                );
              } else {
                return Container(
                  margin: const EdgeInsets.only(bottom: 200),
                  alignment: Alignment.center,
                  child: Text(
                    "لا يوجد مقاسم مسجلة بعد !",
                    textDirection: TextDirection.rtl,
                    style: Get.textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                );
              }
            },
          ),
        ),
        Spacer(),
      ],
    );
  }

  Widget _infoActionRow() {
    return LayoutBuilder(
      builder: (context, constraints) => Row(
        children: [
          GetBuilder<FindAnimationController>(
            builder: (controller) {
              return AnimatedContainer(
                width:
                    (controller.areLotsVisible) ? constraints.maxWidth / 2 : 0,
                duration: const Duration(milliseconds: 200),
              );
            },
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.surfaceContainer,
              child: Column(
                children: [
                  Spacer(),
                  _informationSection(),
                  Spacer(),
                  _actionsRow(context),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _informationSection() {
    return SizedBox(
      width: Get.mediaQuery.size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                _cityTextField(),
                SizedBox(
                  height: AppLayout.height(20),
                ),
                _propertyNumberTextField(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cityTextField() {
    return GetBuilder<FindAnimationController>(
      builder: (controller) => AnimatedCustomLabeledTextField(
        label: "المنطقة",
        focusNode: _choosePropertyController.cityFocus,
        nextNode: _choosePropertyController.escapeFocus,
        isExpanded: !controller.areLotsVisible,
        controller: _choosePropertyController.cityController,
        suggestionsController: SuggestionsController(),
        suggestionsCallback: (input) async {
          _choosePropertyController.propertyNumberSuggestionsController
              .refresh();
          return await _choosePropertyController.getCities(input);
        },
        onEditingComplete: () =>
            _choosePropertyController.escapeFocus.requestFocus(),
      ),
    );
  }

  Widget _propertyNumberTextField() {
    return GetBuilder<FindAnimationController>(
      builder: (controller) => AnimatedCustomLabeledTextField(
        label: "رقم العقار",
        isExpanded: !controller.areLotsVisible,
        nextNode: _choosePropertyController.escapeFocus,
        focusNode: _choosePropertyController.propertyNumberFocus,
        controller: _choosePropertyController.propertyNumberController,
        suggestionsController:
            _choosePropertyController.propertyNumberSuggestionsController,
        suggestionsCallback: (input) async {
          return await _choosePropertyController.getPropertyNumbers(input);
        },
        onEditingComplete: () =>
            _choosePropertyController.escapeFocus.requestFocus(),
      ),
    );
  }

  Widget _actionsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _searchButton(context),
      ],
    );
  }

  Widget _searchButton(BuildContext context) {
    return CustomTextButton(
      label: "ابحث",
      onPressed: () async {
        final result = await _choosePropertyController.submitInput();
        if (!context.mounted) return;

        if (result == CheckResult.success) {
          Get.dialog(
            LoadingDialog(),
            barrierDismissible: false,
          );
          final success = await _controller.getLots(
            propertyId: _choosePropertyController.property!.id,
          );
          Get.back();
          if (success) {
            _controller.update();
            _animationController.setLotsVisibility(true);
          } else {
            if (!context.mounted) return;
            AppToast.show(
              context: context,
              type: AppToastType.error,
              description: "لم نتمكن من استعادة المقاسم لهذا العقار",
            );
          }
        } else if (result == CheckResult.requiredInput) {
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
