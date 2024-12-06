import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_allotment_controller.dart';
import 'package:real_estate_allotment/models/allotment/allotment.dart';
import 'package:real_estate_allotment/models/allotment/lot_allotment/lot_allotment.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';

class FindShareholderAllotmentController extends FindAllotmentController {
  List<LotAllotment> lotAllotmentList = [];
  List<Lot?> lotList = [];

  @override
  Future<bool> getAllotments({required int allotedObjectId}) async {
    try {
      lotAllotmentList = await isar.lotAllotments
          .where()
          .propertyAllotmentIdEqualTo(allotedObjectId)
          .sortByCreatedDate()
          .findAll();

      lotList = await isar.lots.getAll(
        lotAllotmentList
            .map(
              (e) => e.lotId,
            )
            .toList(),
      );

      update();
      return true;
    } catch (e) {
      debugPrint('$runtimeType (Get Lot Allotment) Error: $e');
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
          success = await _updateLotShare(
            lot: allotedObject as Lot,
            allotmentShare: allotment.share,
          );
          if (!success) return false;

          success = await isar.lotAllotments.delete(allotment.id);
          if (!success) return false;

          return true;
        },
      );
      if (result == true) update();
      return result;
    } catch (e) {
      debugPrint('$runtimeType (Delete Lot Allotment) Error: $e');
      return false;
    }
  }

  Future<bool> _updateLotShare({
    required Lot lot,
    required double allotmentShare,
  }) async {
    lot.remainingShare += allotmentShare;
    try {
      await isar.lots.put(lot);
      return true;
    } catch (e) {
      debugPrint("$runtimeType (Update Lot Share) Error: $e");
      return false;
    }
  }
}
