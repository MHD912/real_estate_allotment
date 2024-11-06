import 'package:real_estate_allotment/controllers/studies/study_controller.dart';

class AddStudyController extends StudyController {
  @override
  Future<InputResult> submitStudy() async {
    return await handleStudySubmission();
  }

  @override
  void resetInput() {
    titleController.text = "";
  }
}
