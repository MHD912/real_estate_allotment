import 'package:flutter/widgets.dart';
import 'package:real_estate_allotment/controllers/choose_object_controller.dart';

class ChoosePropertyController extends ChooseObjectController {
  @override
  bool checkInput() {
    return (cityController.text.isEmpty ||
        propertyNumberController.text.isEmpty);
  }

  @override
  Future<CheckResult> submitInput() async {
    final isNotValid = checkInput();
    if (isNotValid) return CheckResult.requiredInput;
    try {
      property = await getProperty();
      if (property != null) return CheckResult.success;
    } catch (e) {
      debugPrint("$runtimeType (Submit Input) Error: $e");
    }
    return CheckResult.error;
  }
}
