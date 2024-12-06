import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/allotments/choose_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_shareholder_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/choose_object_controller.dart';
import 'package:real_estate_allotment/controllers/find_animation_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/dialogs/loading_dialog.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/core/widgets/animated_custom_labeled_text_field.dart';
import 'package:real_estate_allotment/views/allotments/lot_allotment/find_shareholder_allotment_view/widgets/shareholder_allotment_item_widget.dart';

class FindShareholderAllotmentView extends StatelessWidget {
  final _controller =
      Get.find<FindAllotmentController>() as FindShareholderAllotmentController;
  final _chooseAllotmentController = Get.find<ChooseAllotmentController>();
  final _animationController = Get.find<FindAnimationController>();
  FindShareholderAllotmentView({super.key});

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
          flex: 2,
          child: _pageTitle(),
        ),
        Expanded(
          flex: 8,
          child: Stack(
            children: [
              _allotmentItemsRow(),
              _infoActionRow(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _pageTitle() {
    return GetBuilder<FindAnimationController>(
      builder: (controller) => Text(
        (controller.areLotsVisible)
            ? "اختر المالك الذي ترغب بتعديل اختصاصه"
            : "قم بتحديد المقسم الذي يتبع له الاختصاص",
        style: Get.theme.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _allotmentItemsRow() {
    return Row(
      children: [
        Expanded(
          child: GetBuilder<FindAllotmentController>(
            builder: (controller) {
              controller as FindShareholderAllotmentController;
              if (controller.lotAllotmentList.isNotEmpty) {
                return ListView.builder(
                  itemCount: _controller.lotAllotmentList.length,
                  itemBuilder: (context, index) {
                    return ShareholderAllotmentItemWidget(
                      index: index,
                      lot: _controller.lotList[index]!,
                      allotment: _controller.lotAllotmentList[index],
                    );
                  },
                );
              } else {
                return Container(
                  margin: const EdgeInsets.only(bottom: 200),
                  alignment: Alignment.center,
                  child: Text(
                    "لا يوجد اختصاصات مسجلة بعد !",
                    textDirection: TextDirection.rtl,
                    style: Get.textTheme.titleLarge!.copyWith(
                      color: Get.theme.colorScheme.primary,
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
              color: Get.theme.colorScheme.surfaceContainer,
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
                SizedBox(
                  height: AppLayout.height(20),
                ),
                _shareholderTextField(),
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
        isExpanded: !controller.areLotsVisible,
        controller: _chooseAllotmentController.cityController,
        suggestionsController: SuggestionsController(),
        suggestionsCallback: (input) async {
          _chooseAllotmentController.propertyNumberSuggestionsController
              .refresh();
          return await _chooseAllotmentController.getCities(input);
        },
      ),
    );
  }

  Widget _propertyNumberTextField() {
    return GetBuilder<FindAnimationController>(
      builder: (controller) => AnimatedCustomLabeledTextField(
        label: "رقم العقار",
        isExpanded: !controller.areLotsVisible,
        controller: _chooseAllotmentController.propertyNumberController,
        suggestionsController:
            _chooseAllotmentController.propertyNumberSuggestionsController,
        suggestionsCallback: (input) async {
          _chooseAllotmentController.shareholderSuggestionsController.refresh();
          return await _chooseAllotmentController.getPropertyNumbers(input);
        },
      ),
    );
  }

  Widget _shareholderTextField() {
    return GetBuilder<FindAnimationController>(
      builder: (controller) => AnimatedCustomLabeledTextField(
        label: "المالك",
        isExpanded: !controller.areLotsVisible,
        controller: _chooseAllotmentController.shareholderController,
        suggestionsController:
            _chooseAllotmentController.shareholderSuggestionsController,
        suggestionsCallback: (input) async {
          return await _chooseAllotmentController.getShareholders(input);
        },
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
        final result = await _chooseAllotmentController.submitInput();
        if (!context.mounted) return;

        switch (result) {
          case CheckResult.success:
            Get.dialog(
              LoadingDialog(),
              barrierDismissible: false,
            );
            final success = await _controller.getAllotments(
              allotedObjectId: _chooseAllotmentController.propertyAllotment!.id,
            );
            Get.back();
            if (success) {
              _animationController.setLotsVisibility(true);
            } else {
              if (!context.mounted) return;
              AppToast.show(
                context: context,
                type: AppToastType.error,
                description: "لم نتمكن من استعادة الاختصاصات في هذا العقار",
              );
            }
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
