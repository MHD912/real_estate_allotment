import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';

enum InputResult {
  success,
  requiredInput,
  error,
  duplicateShareholder,
  shareDepleted
}

abstract class AllotmentController extends GetxController {
  final isar = Get.find<IsarService>().isar;

  final ownerNameController = TextEditingController();
  final shareController = TextEditingController();

  // TODO: Update logic here
  @protected
  Future<int?> submitShareholder() async {
    // if (ownerNameController.text.isEmpty) return null;
    // try {
    //   int? shareholderId;

    //   // Check if shareholder is already in the database
    //   shareholderId = await isar.shareholders
    //       .where()
    //       .nameEqualTo(ownerNameController.text.trim())
    //       .idProperty()
    //       .findFirst();

    //   if (shareholderId != null) return shareholderId;

    //   // Add shareholder to the database and return their ID
    //   return await isar.writeTxn<int>(
    //     () async {
    //       shareholderId = await isar.shareholders.put(
    //         Shareholder(
    //           name: ownerNameController.text.trim(),
    //         ),
    //       );
    //       return shareholderId!;
    //     },
    //   );
    // } catch (e) {
    //   debugPrint('$runtimeType (Submit Shareholder) Error: $e');
    return null;
    // }
  }

  Future<bool> checkIsDuplicate(String shareholderName);
  InputResult validateInput();

  void resetInput();
}
