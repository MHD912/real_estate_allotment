import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

abstract class PropertyAllotmentController extends AllotmentController {
  final participationRateController = TextEditingController(text: "1.0");

  late final RealEstate property;

  @override
  bool validateInput() {
    return (shareholderNameController.text.isEmpty ||
        shareController.text.isEmpty ||
        participationRateController.text.isEmpty);
  }

  @override
  Future<bool> checkIsDuplicate(String shareholderName) async {
    try {
      return await isar.realEstateAllotments
          .where()
          .propertyIdShareholderNameEqualTo(property.id, shareholderName)
          .isNotEmpty();
    } catch (e) {
      debugPrint('$runtimeType (Check Duplicate) Error: $e');
      return false;
    }
  }

  @protected
  Future<InputResult> handleAllotmentSubmission({
    required RealEstateAllotment? existingAllotment,
  }) async {
    final isNotValid = validateInput();
    if (isNotValid) return InputResult.requiredInput;

    final shareholderName = shareholderNameController.text.trim();
    final share = double.parse(shareController.text.trim());
    final participationRate =
        double.parse(participationRateController.text.trim());

    // Only check for duplicates when adding new allotment
    if (existingAllotment == null && await checkIsDuplicate(shareholderName)) {
      return InputResult.duplicateShareholder;
    }

    final allotment = RealEstateAllotment(
      id: existingAllotment?.id ?? Isar.autoIncrement,
      share: share,
      participationRate: participationRate,
      shareholderName: shareholderName,
      propertyId: property.id,
      dateCreated: existingAllotment?.createdDate,
    );

    try {
      return await isar.writeTxn(
        () async {
          return await putAllotment(propertyAllotment: allotment);
        },
      );
    } catch (e) {
      debugPrint('$runtimeType (Handle Allotment Submission) Error: $e');
      return InputResult.error;
    }
  }

  Future<InputResult> updatePropertyRemainingShare({
    required double newShare,
  });

  Future<InputResult> putAllotment({
    required RealEstateAllotment propertyAllotment,
  });

  Future<InputResult> submitPropertyAllotment();
}
