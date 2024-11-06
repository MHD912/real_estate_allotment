import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';

enum InputResult {
  success,
  requiredInput,
  error,
  duplicateStakeholder,
  shareDepleted
}

abstract class AllotmentController extends GetxController {
  final isar = Get.find<IsarService>().isar;

  final ownerNameController = TextEditingController();
  final shareController = TextEditingController();

  // TODO: Update logic here
  @protected
  Future<int?> submitStakeholder() async {
    // if (ownerNameController.text.isEmpty) return null;
    // try {
    //   int? stakeholderId;

    //   // Check if stakeholder is already in the database
    //   stakeholderId = await isar.stakeholders
    //       .where()
    //       .nameEqualTo(ownerNameController.text.trim())
    //       .idProperty()
    //       .findFirst();

    //   if (stakeholderId != null) return stakeholderId;

    //   // Add stakeholder to the database and return their ID
    //   return await isar.writeTxn<int>(
    //     () async {
    //       stakeholderId = await isar.stakeholders.put(
    //         Stakeholder(
    //           name: ownerNameController.text.trim(),
    //         ),
    //       );
    //       return stakeholderId!;
    //     },
    //   );
    // } catch (e) {
    //   debugPrint('$runtimeType (Submit Stakeholder) Error: $e');
    return null;
    // }
  }

  Future<bool> checkIsDuplicate(String stakeholderName);
  InputResult validateInput();

  void resetInput();
}
