import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/allotments/allotment_controller.dart';
import 'package:real_estate_allotment/models/allotment/lot_allotment/lot_allotment.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

abstract class LotAllotmentController extends AllotmentController {
  late final Lot lot;
  late final RealEstate property;

  @override
  bool validateInput() {
    return (shareholderNameController.text.isEmpty ||
        shareController.text.isEmpty);
  }

  @override
  Future<bool> checkIsDuplicate(String shareholderName) async {
    try {
      return await isar.lotAllotments
          .where()
          .lotIdShareholderNameEqualTo(lot.id, shareholderName)
          .isNotEmpty();
    } catch (e) {
      debugPrint('$runtimeType (Check Duplicate) Error: $e');
      return false;
    }
  }

  Future<int> _getPropertyAllotmentId(String shareholderName) async {
    final id = await isar.realEstateAllotments
        .where()
        .propertyIdShareholderNameEqualTo(property.id, shareholderName)
        .idProperty()
        .findFirst();
    return id!;
  }

  @protected
  Future<InputResult> handleAllotmentSubmission({
    required LotAllotment? existingAllotment,
  }) async {
    final isNotValid = validateInput();
    if (isNotValid) return InputResult.requiredInput;

    final share = double.parse(shareController.text.trim());
    final shareholderName = shareholderNameController.text.trim();

    // Only check for duplicates when adding new allotment
    if (existingAllotment == null && await checkIsDuplicate(shareholderName)) {
      return InputResult.duplicateShareholder;
    }

    final allotment = LotAllotment(
      id: existingAllotment?.id ?? Isar.autoIncrement,
      share: share,
      shareholderName: shareholderName,
      lotId: lot.id,
      propertyAllotmentId: await _getPropertyAllotmentId(shareholderName),
      dateCreated: existingAllotment?.createdDate,
    );
    try {
      return await isar.writeTxn(
        () async {
          return await putAllotment(lotAllotment: allotment);
        },
      );
    } catch (e) {
      debugPrint('$runtimeType (Handle Allotment Submission) Error: $e');
      return InputResult.error;
    }
  }

  Future<List<String>> getShareholderNames({required String name}) async {
    try {
      return await isar.realEstateAllotments
          .where()
          .propertyIdEqualToAnyShareholderName(property.id)
          .filter()
          .shareholderNameContains(name)
          .shareholderNameProperty()
          .findAll();
    } catch (e) {
      debugPrint('$runtimeType (Get Shareholder Names) Error: $e');
      return List.empty();
    }
  }

  Future<InputResult> updateLotRemainingShare({
    required double newShare,
  });

  Future<InputResult> putAllotment({
    required LotAllotment lotAllotment,
  });

  Future<InputResult> submitLotAllotment();
}
