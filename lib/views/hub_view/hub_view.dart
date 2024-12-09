import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/custom_navigation_rail_controller.dart';
import 'package:real_estate_allotment/controllers/hub_controller.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/views/allotments/allotments_view.dart';
import 'package:real_estate_allotment/views/hub_view/widgets/custom_navigation_rail.dart';
import 'package:real_estate_allotment/views/hub_view/widgets/export_excel.dart';
import 'package:real_estate_allotment/views/lots/lots_view.dart';
import 'package:real_estate_allotment/views/properties/properties_view.dart';

class HubView extends StatelessWidget {
  final HubController _hubController;
  HubView({super.key}) : _hubController = Get.find<HubController>();

  final List<Widget> _viewsList = [
    const PropertiesView(),
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
                child: _viewContent(context),
              ),
              _navigationRail(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _viewContent(BuildContext context) {
    return Stack(
      children: [
        GetBuilder<CustomNavigationRailController>(
          builder: (controller) => Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: _viewsList[controller.selectedIndex],
            ),
          ),
        ),
        Positioned(
          top: 1,
          left: 1,
          child: ExportExcel(),
        ),
      ],
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
