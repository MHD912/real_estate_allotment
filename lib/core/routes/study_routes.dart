import 'package:get/get.dart';
import 'package:real_estate_allotment/core/routes/app_routes.dart';
import 'package:real_estate_allotment/core/utilities/app_bindings.dart';
import 'package:real_estate_allotment/views/studies/add_study_view/add_study_view.dart';
import 'package:real_estate_allotment/views/studies/edit_study_view/edit_study_view.dart';
import 'package:real_estate_allotment/views/studies/study_management_view/study_management_view.dart';

class StudyRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.addStudy,
      page: () => AddStudyView(),
      binding: AddStudyBindings(),
    ),
    GetPage(
      name: AppRoutes.editStudy,
      page: () => EditStudyView(),
      binding: EditStudyBindings(),
    ),
    GetPage(
      name: AppRoutes.manageStudies,
      page: () => StudyManagementView(),
      binding: StudyManagementBindings(),
    ),
  ];
}
