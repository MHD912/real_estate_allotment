import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/views/properties/all_properties_view/widgets/property_item_widget.dart';

class AllPropertiesView extends StatelessWidget {
  const AllPropertiesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _viewContent(context);
  }

  Widget _viewContent(BuildContext context) {
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
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(
                      top: AppLayout.height(70),
                      bottom: AppLayout.height(50),
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "اختر العقار الذي ترغب بتعديله",
                            style: Get.theme.textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.width(250),
                    ),
                    sliver: SliverList.list(
                      children: [
                        PropertyItemWidget(),
                        PropertyItemWidget(),
                        PropertyItemWidget(),
                        PropertyItemWidget(),
                        PropertyItemWidget(),
                        PropertyItemWidget(),
                        PropertyItemWidget(),
                        PropertyItemWidget(),
                        PropertyItemWidget(),
                        PropertyItemWidget(),
                        PropertyItemWidget(),
                        PropertyItemWidget(),
                        PropertyItemWidget(),
                        PropertyItemWidget(),
                        PropertyItemWidget(),
                      ],
                    ),
                  ),
                ],
              ),
              HubButton(),
            ],
          ),
        ),
      ),
    );
  }
}
