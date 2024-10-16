import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/find_animation_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/views/lots/find_lot_view/widgets/lot_item_widget.dart';
import 'package:real_estate_allotment/core/widgets/animated_custom_labeled_text_field.dart';

class FindLotView extends StatelessWidget {
  final FindAnimationController _controller;
  FindLotView({super.key}) : _controller = Get.find<FindAnimationController>();

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
              _lotItemsRow(),
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
            ? "اختر المقسم الذي ترغب بتعديله"
            : "قم بتحديد العقار الذي يتبع له المقسم",
        style: Get.theme.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _lotItemsRow() {
    return Row(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return LotItemWidget();
            },
          ),
        ),
        Spacer(),
      ],
    );
  }

  Widget _infoActionRow() {
    return Row(
      children: [
        GetBuilder<FindAnimationController>(
          builder: (controller) {
            return AnimatedContainer(
              width: (controller.areLotsVisible)
                  ? Get.mediaQuery.size.width / 2
                  : 0,
              duration: const Duration(milliseconds: 200),
            );
          },
        ),
        Expanded(
          child: Container(
            color: Get.theme.colorScheme.surfaceContainer,
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              children: [
                Spacer(),
                _informationSection(),
                Spacer(),
                _actionsRow(),
                Spacer(
                  flex: 5,
                ),
              ],
            ),
          ),
        ),
      ],
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
                _propertyIdTextField(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _propertyIdTextField() {
    return GetBuilder<FindAnimationController>(
      builder: (controller) => AnimatedCustomLabeledTextField(
        label: "رقم العقار",
        isExpanded: !controller.areLotsVisible,
      ),
    );
  }

  Widget _cityTextField() {
    return GetBuilder<FindAnimationController>(
      builder: (controller) => AnimatedCustomLabeledTextField(
        label: "المنطقة",
        isExpanded: !controller.areLotsVisible,
      ),
    );
  }

  Widget _actionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _searchButton(),
      ],
    );
  }

  Widget _searchButton() {
    return CustomTextButton(
      label: "ابحث",
      onPressed: () {
        _controller.toggleLotsVisibility();
      },
    );
  }
}
