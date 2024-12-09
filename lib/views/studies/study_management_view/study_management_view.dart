import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/studies/study_management_controller.dart';
import 'package:real_estate_allotment/core/utilities/app_layout.dart';
import 'package:real_estate_allotment/core/widgets/app_window/app_window_border.dart';
import 'package:real_estate_allotment/core/widgets/dialogs/loading_dialog.dart';
import 'package:real_estate_allotment/views/studies/study_management_view/widgets/study_item_widget.dart';

class StudyManagementView extends StatelessWidget {
  final _controller = Get.find<StudyManagementController>();
  StudyManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppWindowBorder(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: _futureViewContent(),
        ),
      ),
    );
  }

  Widget _futureViewContent() {
    return GetBuilder<StudyManagementController>(
      builder: (controller) => FutureBuilder(
        future: controller.getStudies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _viewContent(
              context,
              sliver: SliverFillRemaining(
                child: LoadingDialog(),
              ),
            );
          } else {
            return _viewContent(
              context,
              sliver: SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.width(250),
                ),
                sliver: _propertiesListView(context),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _viewContent(BuildContext context, {required Widget sliver}) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
            top: AppLayout.height(70),
            bottom: AppLayout.height(50),
          ),
          sliver: _titleWidget(context),
        ),
        sliver,
      ],
    );
  }

  SliverToBoxAdapter _titleWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "اختر العقار الذي ترغب بتعديله",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );
  }

  Widget _propertiesListView(BuildContext context) {
    if (_controller.studies.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(
            "لا يوجد دراسات مسجلة بعد !",
            textDirection: TextDirection.rtl,
            style: Get.textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      );
    }
    return SliverList.builder(
      itemCount: _controller.studies.length,
      itemBuilder: (context, index) {
        return StudyItemWidget(
          index: index,
          study: _controller.studies[index],
        );
      },
    );
  }
}
