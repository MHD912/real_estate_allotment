import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_allotment_controller.dart';
import 'package:real_estate_allotment/models/allotment/allotment.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class FindPropertyAllotmentController extends FindAllotmentController {
  List<RealEstateAllotment> realEstateAllotmentList = [];

  @override
  Future<bool> getAllotments({required int allotedObjectId}) async {
    try {
      realEstateAllotmentList = await isar.realEstateAllotments
          .where()
          .propertyIdEqualToAnyShareholderName(allotedObjectId)
          .sortByCreatedDate()
          .findAll();
      update();
      return true;
    } catch (e) {
      debugPrint('$runtimeType (Get Property Allotments) Error: $e');
      return false;
    }
  }

  @override
  Future<bool> deleteAllotment({
    required Allotment allotment,
    required Object allotedObject,
  }) async {
    try {
      final result = await isar.writeTxn(
        () async {
          bool success;
          success = await _updatePropertyShare(
            realEstate: allotedObject as RealEstate,
            allotmentShare: allotment.share,
          );
          if (!success) return false;

          success = await isar.realEstateAllotments.delete(allotment.id);
          if (!success) return false;

          return true;
        },
      );
      if (result == true) update();
      return result;
    } catch (e) {
      debugPrint('$runtimeType (Delete Property Allotment) Error: $e');
      return false;
    }
  }

  Future<bool> _updatePropertyShare({
    required RealEstate realEstate,
    required double allotmentShare,
  }) async {
    realEstate.remainingShare += allotmentShare;
    try {
      await isar.realEstates.put(realEstate);
      return true;
    } catch (e) {
      debugPrint("$runtimeType (Update Property Share) Error: $e");
      return false;
    }
  }
}
