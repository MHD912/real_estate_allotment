import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/study/study.dart';

enum InputResult { success, error, duplicateName, requiredInput }

abstract class StudyController extends GetxController {
  final isar = Get.find<IsarService>().isar;
  final titleController = TextEditingController();
  late Study study;

  Future<InputResult> checkInput() async {
    if (titleController.text.isEmpty) return InputResult.requiredInput;

    final bool isDuplicate;
    try {
      isDuplicate = await isar.studies
          .filter()
          .titleEqualTo(titleController.text.trim())
          .isNotEmpty();
    } catch (e) {
      debugPrint('$runtimeType (Check Input) Error: $e');
      return InputResult.error;
    }
    if (isDuplicate) {
      return InputResult.duplicateName;
    } else {
      return InputResult.success;
    }
  }

  ///
  /// In case of updating an existing study [studyId] can't be null.
  ///
  @protected
  Future<InputResult> handleStudySubmission({int? studyId}) async {
    final checkResult = await checkInput();
    if (checkResult != InputResult.success) return checkResult;

    study = Study(
      id: studyId ?? Isar.autoIncrement,
      title: titleController.text.trim(),
      dateTime: DateTime.now(),
    );

    try {
      await isar.writeTxn(
        () async {
          await isar.studies.put(study);
        },
      );
      return InputResult.success;
    } catch (e) {
      debugPrint('$runtimeType (Submit Study) Error: $e');
      return InputResult.error;
    }
  }

  Future<InputResult> submitStudy();

  void resetInput();
}
