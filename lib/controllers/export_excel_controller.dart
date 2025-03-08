import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/controllers/studies/active_study_controller.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/core/utilities/excel/excel.dart';
import 'package:real_estate_allotment/core/utilities/excel/excel_multi_real_estate.dart';
import 'package:real_estate_allotment/core/utilities/excel/excel_one_real_estate.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';

class ExportExcelController extends GetxController {
  final isar = Get.find<IsarService>().isar;

  Future<bool> export() async {
    final studyId = Get.find<ActiveStudyController>().activeStudy!.id;
    final realEstateCount = await isar.realEstates
        .where()
        .studyIdEqualToAnyCityPropertyNumber(studyId)
        .count();

    final Excel excelExport;
    if (realEstateCount > 1) {
      excelExport = ExcelMultiRealEstate();
    } else {
      excelExport = ExcelOneRealEstate();
    }

    await excelExport.migrateDataToSheet();
    final success = await excelExport.saveExcelDocument();
    return success;
  }
}
