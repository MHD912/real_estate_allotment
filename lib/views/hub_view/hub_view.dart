import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/custom_navigation_rail_controller.dart';
import 'package:real_estate_allotment/controllers/hub_controller.dart';
import 'package:real_estate_allotment/core/widgets/app_window_border.dart';
import 'package:real_estate_allotment/views/allotments_view/allotments_view.dart';
import 'package:real_estate_allotment/views/hub_view/widgets/custom_navigation_rail.dart';
import 'package:real_estate_allotment/views/lots_view/lots_view.dart';
import 'package:real_estate_allotment/views/real_estates_view/real_estates_view.dart';

class HubView extends StatelessWidget {
  // final double _deviceWidth /* , _deviceHeight */;
  final HubController _hubController;
  HubView({super.key})
      :
        // _deviceWidth = Get.width,
        // _deviceHeight = Get.height,
        _hubController = Get.find<HubController>();

  final List<Widget> _viewsList = [
    const RealEstatesView(),
    const LotsView(),
    const AllotmentsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _hubController.focusNode,
      child: Scaffold(
        body: AppWindowBorder(
          child: Row(
            children: <Widget>[
              Expanded(
                child: GetBuilder<CustomNavigationRailController>(
                  builder: (controller) => Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _viewsList[controller.selectedIndex],
                  ),
                ),
              ),
              _navigationRail(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navigationRail(BuildContext context) {
    return GetBuilder<CustomNavigationRailController>(
      builder: (railController) => CustomNavigationRail(
        destinations: [
          CustomNavigationRailDestination(
            icon: Icons.apartment,
            label: "العقارات",
          ),
          CustomNavigationRailDestination(
            icon: Icons.home_work,
            label: "المقاسم",
          ),
          CustomNavigationRailDestination(
            icon: Icons.groups,
            label: "الاختصاص",
          ),
        ],
        selectedIndex: railController.selectedIndex,
        onDestinationSelected: (index) => railController.setDestination(
          newIndex: index,
        ),
      ),
    );
  }
}
