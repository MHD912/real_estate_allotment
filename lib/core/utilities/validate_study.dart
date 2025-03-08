import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/studies/active_study_controller.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class ValidateStudy {
  static final _isar = Get.find<IsarService>().isar;
  static Future<String> validateRealEstates() async {
    final int activeStudyId = Get.find<ActiveStudyController>().activeStudy!.id;

    String errorReport = "";

    // Real Estates Validation
    final realEstates = await _isar.realEstates
        .where()
        .studyIdEqualToAnyCityPropertyNumber(activeStudyId)
        .findAll();

    List<RealEstate> invalidRealEstates = realEstates
        .where(
          (realEstate) => realEstate.remainingShare != 0,
        )
        .toList();

    if (invalidRealEstates.isNotEmpty) {
      for (var realEstate in invalidRealEstates) {
        if (realEstate.remainingShare.isNegative) {
          errorReport +=
              "الحصة المتبقية للعقار رقم ${realEstate.propertyNumber} تحمل قيمة سالبة\n";
        } else {
          errorReport +=
              "الحصة المتبقية للعقار رقم ${realEstate.propertyNumber} لم يتم استهلاكها بعد\n";
        }
      }
    }

    invalidRealEstates = realEstates
        .where(
          (realEstate) => realEstate.remainingValue != 0,
        )
        .toList();

    if (invalidRealEstates.isNotEmpty) {
      for (var realEstate in invalidRealEstates) {
        if (realEstate.remainingValue.isNegative) {
          errorReport +=
              "القيمة المتبقية للعقار رقم ${realEstate.propertyNumber} تحمل قيمة سالبة\n";
        } else {
          errorReport +=
              "القيمة المتبقية للعقار رقم ${realEstate.propertyNumber} لم يتم استهلاكها بعد\n";
        }
      }
    }
    return errorReport;
  }

  static Future<String> validateLots() async {
    final int activeStudyId = Get.find<ActiveStudyController>().activeStudy!.id;

    String errorReport = "";
    final realEstates = await _isar.realEstates
        .where()
        .studyIdEqualToAnyCityPropertyNumber(activeStudyId)
        .findAll();

    // Lots validation
    for (var realEstate in realEstates) {
      final lots = await _isar.lots
          .where()
          .propertyIdEqualToAnyLotNumber(realEstate.id)
          .findAll();

      List<Lot> invalidLots = lots
          .where(
            (lot) => lot.remainingShare != 0,
          )
          .toList();

      if (invalidLots.isNotEmpty) {
        for (var lot in invalidLots) {
          if (lot.remainingShare.isNegative) {
            errorReport +=
                "الحصة المتبقية للمقسم رقم ${lot.lotNumber} تحمل قيمة سالبة\n";
          } else {
            errorReport +=
                "الحصة المتبقية للمقسم رقم ${lot.lotNumber} لم يتم استهلاكها بعد\n";
          }
        }
      }
    }
    return errorReport;
  }
}
