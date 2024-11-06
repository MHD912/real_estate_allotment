import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/allotments/find_allotment/find_allotment_controller.dart';
import 'package:real_estate_allotment/models/allotment/lot_allotment/lot_allotment.dart';

class FindLotAllotmentController extends FindAllotmentController {
  final lotNumberController = TextEditingController();
  List<LotAllotment> lotAllotmentList = [];

  @override
  Future<bool> getAllotments({required int? allotedObjectId}) async {
    if (allotedObjectId == null) return false;
    try {
      lotAllotmentList = await isar.lotAllotments
          .where()
          .lotIdEqualToAnyShareholderName(allotedObjectId)
          .findAll();
    } catch (e) {
      debugPrint('$runtimeType (Get Lot Allotment) Error: $e');
      return false;
    }
    return await getShareholderNames();
  }

  // TODO: Update logic here
  @override
  Future<bool> getShareholderNames() async {
    // try {
    //   for (var allotment in lotAllotmentList) {
    //     final name = await isar.shareholders
    //         .where()
    //         .idEqualTo(allotment.shareholderId)
    //         .nameProperty()
    //         .findFirst();

    //     if (name == null) return false;
    //     shareholderNames.add(name);
    //   }
    //   return true;
    // } catch (e) {
    //   debugPrint('$runtimeType (Get Shareholders Names) Error: $e');
    return false;
    // }
  }

  @override
  Future<bool> deleteAllotment({required int allotmentId}) async {
    try {
      final result = await isar.writeTxn(
        () async => await isar.lotAllotments.delete(allotmentId),
      );
      if (result == true) update();
      return result;
    } catch (e) {
      debugPrint('$runtimeType (Delete Lot Allotment) Error: $e');
      return false;
    }
  }
}
