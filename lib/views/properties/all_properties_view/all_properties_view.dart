import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/properties/all_properties_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/dialogs/loading_dialog.dart';
import 'package:real_estate_allotment/core/widgets/hub_button.dart';
import 'package:real_estate_allotment/views/properties/all_properties_view/widgets/property_item_widget.dart';

class AllPropertiesView extends StatelessWidget {
  final _controller = Get.find<AllPropertiesController>();
  AllPropertiesView({
    super.key,
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
              _futureViewContent(),
              HubButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _futureViewContent() {
    return GetBuilder<AllPropertiesController>(
      builder: (controller) => FutureBuilder(
        future: controller.getProperties(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _viewContent(
              sliver: SliverFillRemaining(
                child: LoadingDialog(),
              ),
            );
          } else {
            return _viewContent(
              sliver: SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.width(250),
                ),
                sliver: _propertiesListView(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _viewContent({required Widget sliver}) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
            top: AppLayout.height(70),
            bottom: AppLayout.height(50),
          ),
          sliver: _titleWidget(),
        ),
        sliver,
      ],
    );
  }

  SliverToBoxAdapter _titleWidget() {
    return SliverToBoxAdapter(
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
    );
  }

  Widget _propertiesListView() {
    if (_controller.properties.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(
            "لا يوجد عقارات مسجلة بعد !",
            textDirection: TextDirection.rtl,
            style: Get.textTheme.titleLarge!.copyWith(
              color: Get.theme.colorScheme.primary,
            ),
          ),
        ),
      );
    }
    return SliverList.builder(
      itemCount: _controller.properties.length,
      itemBuilder: (context, index) {
        return PropertyItemWidget(
          index: index,
          property: _controller.properties[index],
        );
      },
    );
  }
}
