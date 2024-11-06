import 'package:real_estate_allotment/controllers/studies/study_controller.dart';

class EditStudyController extends StudyController {
  @override
  Future<InputResult> submitStudy() async {
    return await handleStudySubmission(studyId: study.id);
  }

  @override
  void resetInput() {
    titleController.text = study.title;
  }
}
