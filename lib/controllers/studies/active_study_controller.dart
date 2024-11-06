import 'package:get/get.dart';
import 'package:real_estate_allotment/models/study/study.dart';

class ActiveStudyController extends GetxController {
  Study? _activeStudy;

  Study? get activeStudy => _activeStudy;

  set activeStudy(Study? study) {
    _activeStudy = study;
    update();
  }
}
