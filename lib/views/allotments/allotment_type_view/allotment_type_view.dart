import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/templates/home_content_template.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';

enum AllotmentTypeMode { addAllotment, findAllotment }

class AllotmentTypeView extends StatelessWidget {
  final AllotmentTypeMode viewMode;
  const AllotmentTypeView({
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
    return HomeContentTemplate(
      pageTitle: "ما هو نوع الاختصاص",
      leftButtonLabel: "اختصاص مقسم",
      leftButtonOnPressed: () => Get.toNamed(
        (viewMode == AllotmentTypeMode.addAllotment)
            ? AppRoutes.chooseAllotmentLot
            : AppRoutes.findLotAllotment,
      ),
      rightButtonLabel: "اختصاص عقار",
      rightButtonOnPressed: () => Get.toNamed(
        (viewMode == AllotmentTypeMode.addAllotment)
            ? AppRoutes.chooseAllotmentProperty
            : AppRoutes.findPropertyAllotment,
      ),
    );
  }
}
