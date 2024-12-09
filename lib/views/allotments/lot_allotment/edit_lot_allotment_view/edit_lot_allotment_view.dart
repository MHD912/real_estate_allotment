import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/choose_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_lot_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_shareholder_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/lot_allotment/edit_lot_allotment_controller.dart';
import 'package:real_estate_allotment/controllers/allotments/lot_allotment/lot_details_controller.dart';
import 'package:real_estate_allotment/controllers/lots/choose_lot_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/utilities/back_button_shortcut.dart';
import 'package:real_estate_allotment/core/widgets/app_toast.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_button.dart';
import 'package:real_estate_allotment/core/widgets/custom_text_field.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/core/widgets/type_a_head_labeled_text_field.dart';
import 'package:real_estate_allotment/views/allotments/widgets/lot_details_widget.dart';
import 'package:real_estate_allotment/core/widgets/custom_labeled_text_field.dart';

enum ViewMode { chooseLot, chooseAllotment }

class EditLotAllotmentView extends StatelessWidget {
  final _controller = Get.find<EditLotAllotmentController>();
  late final ViewMode _viewMode;
  EditLotAllotmentView({super.key}) {
    _viewMode = Get.arguments['view_mode'];
    final chooseController = (_viewMode == ViewMode.chooseLot)
        ? Get.find<ChooseLotController>()
        : Get.find<ChooseAllotmentController>();
    _controller.property = chooseController.property!;
    _controller.lot = chooseController.lot!;
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
      body: BackButtonShortcut(
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
    );
  }

  Widget _viewContent(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        _pageTitle(context),
        Spacer(),
        Expanded(
          flex: 3,
          child: _informationSection(context),
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

  Widget _pageTitle(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        "تعديل اختصاص مقسم",
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
    );
  }

  Widget _informationSection(BuildContext context) {
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
              child: _ownerNameTextField(context),
            ),
            Expanded(
              child: _shareTextField(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ownerNameTextField(BuildContext context) {
    final suggestionsController = SuggestionsController<String>();
    return TypeAHeadLabeledTextField(
      enabled: false,
      label: "اسم المالك",
      focusNode: _controller.shareholderNameFocus,
      controller: _controller.shareholderNameController,
      onEditingComplete: () {
        suggestionsController.close();
        FocusScope.of(context).requestFocus(_controller.shareFocus);
      },
      suggestionsController: suggestionsController,
      suggestionsCallback: (input) async {
        return await _controller.getShareholderNames(
          name: input,
        );
      },
    );
  }

  Widget _shareTextField(BuildContext context) {
    return CustomLabeledTextField(
      label: "الحصة السهمية",
      autofocus: true,
      inputFormat: InputFormat.decimal,
      focusNode: _controller.shareFocus,
      controller: _controller.shareController,
      onEditingComplete: () async {
        await _submitInfo(context);
      },
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
        _resetButton(context),
      ],
    );
  }

  Widget _saveButton(BuildContext context) {
    return CustomTextButton(
      label: "حفظ",
      onPressed: () async {
        await _submitInfo(context);
      },
    );
  }

  Widget _resetButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () => _controller.resetInput(),
      label: "استعادة",
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      textColor: Theme.of(context).colorScheme.onPrimaryContainer,
    );
  }

  Future<void> _submitInfo(BuildContext context) async {
    final result = await _controller.submitLotAllotment();
    if (!context.mounted) return;

    switch (result) {
      case InputResult.success:
        AppToast.show(
          context: context,
          type: AppToastType.success,
          description: "تم تعديل الاختصاص بنجاح.",
        );
        final findAllotmentController = (_viewMode == ViewMode.chooseLot)
            ? Get.find<FindAllotmentController>() as FindLotAllotmentController
            : Get.find<FindAllotmentController>()
                as FindShareholderAllotmentController;
        if (findAllotmentController is FindLotAllotmentController) {
          await findAllotmentController.getAllotments(
            allotedObjectId: _controller.lot.id,
          );
        } else {
          await findAllotmentController.getAllotments(
            allotedObjectId:
                Get.find<ChooseAllotmentController>().propertyAllotment!.id,
          );
        }
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
  }
}
