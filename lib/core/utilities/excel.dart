import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:get/get.dart';
import 'package:real_estate_allotment/controllers/studies/active_study_controller.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/allotment/lot_allotment/lot_allotment.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';

class Excel {
  final isar = Get.find<IsarService>().isar;
  final Workbook _workbook = Workbook();
  late final Worksheet _sheet;
  Excel() {
    _setupSheet();
    _setColumnWidths();
    _mergeHeaderCells();
    _setHeadersText();
    _applyHeaderFormatting();
  }
  void _setupSheet() {
    _sheet = _workbook.worksheets[0];
    _sheet.isRightToLeft = true;
    _sheet.name = 'Sheet1';
  }

  void _setColumnWidths() {
    _sheet.getRangeByName('A1').columnWidth = 20.33; // Adjust as needed
    _sheet.getRangeByName('B1').columnWidth = 8.67;
    _sheet.getRangeByName('C1').columnWidth = 8.67;
    _sheet.getRangeByName('D1').columnWidth = 14.22;
    _sheet.getRangeByName('E1').columnWidth = 9.22;
    _sheet.getRangeByName('F1').columnWidth = 9.22;
    _sheet.getRangeByName('G1').columnWidth = 14.78;
    _sheet.getRangeByName('H1').columnWidth = 14.78;
    _sheet.getRangeByName('I1').columnWidth = 14.78;
    _sheet.getRangeByName('J1').columnWidth = 12.56;
    _sheet.getRangeByName('K1').columnWidth = 12.56;
    _sheet.getRangeByName('L1').columnWidth = 8.11;
    _sheet.getRangeByName('M1').columnWidth = 8.11;
  }

  void _mergeHeaderCells() {
    _sheet.getRangeByName('A1:A2').merge();
    _sheet.getRangeByName('B1:B2').merge();
    _sheet.getRangeByName('C1:C2').merge();
    _sheet.getRangeByName('D1:D2').merge();
    _sheet.getRangeByName('E1:I1').merge();
    _sheet.getRangeByName('J1:K1').merge();
    _sheet.getRangeByName('L1:L2').merge();
    _sheet.getRangeByName('M1:M2').merge();
  }

  void _setHeadersText() {
    _sheet.getRangeByIndex(1, 1).setText('الاسم');
    _sheet.getRangeByIndex(1, 2).setText('الحصة السهمية');
    _sheet.getRangeByIndex(1, 3).setText('نسبة المشاركة');
    _sheet.getRangeByIndex(1, 4).setText('الواجب أخذه');
    _sheet.getRangeByIndex(1, 5).setText('المأخوذ فعلا');
    _sheet.getRangeByIndex(2, 5).setText('رقم المقسم');
    _sheet.getRangeByIndex(2, 6).setText('الحصة');
    _sheet.getRangeByIndex(2, 7).setText('قيمة المقسم');
    _sheet.getRangeByIndex(2, 8).setText('قيمة الحصة');
    _sheet.getRangeByIndex(2, 9).setText('الإجمالي');
    _sheet.getRangeByIndex(1, 10).setText('الفرق');
    _sheet.getRangeByIndex(2, 10).setText('الزيادة');
    _sheet.getRangeByIndex(2, 11).setText('النقص');
    _sheet.getRangeByIndex(1, 12).setText('نسبة النقص');
    _sheet.getRangeByIndex(1, 13).setText('نسبة الزيادة');
  }

  void _applyHeaderFormatting() {
    final headerStyle = _workbook.styles.add('HeaderStyle');
    headerStyle.fontName = 'Calibri';
    headerStyle.fontSize = 12;
    headerStyle.bold = true;
    headerStyle.wrapText = true;
    headerStyle.hAlign = HAlignType.center;
    headerStyle.vAlign = VAlignType.center;
    headerStyle.borders.all.lineStyle = LineStyle.thin;

    // Set first header row cell style
    for (int i = 1; i <= 13; i++) {
      _sheet.getRangeByIndex(1, i).cellStyle = headerStyle;
    }

    // Set second header row cell style
    headerStyle.fontSize = 11;

    for (int i = 1; i <= 13; i++) {
      _sheet.getRangeByIndex(2, i).cellStyle = headerStyle;
    }

    headerStyle.borders.all.lineStyle = LineStyle.none;
    headerStyle.borders.bottom.lineStyle = LineStyle.thin;

    for (int i = 5; i <= 9; i++) {
      _sheet.getRangeByIndex(2, i).cellStyle = headerStyle;
    }

    headerStyle.borders.left.lineStyle = LineStyle.thin;
    _sheet.getRangeByName('J2').cellStyle = headerStyle;

    headerStyle.borders.left.lineStyle = LineStyle.none;
    headerStyle.borders.right.lineStyle = LineStyle.thin;
    _sheet.getRangeByName('K2').cellStyle = headerStyle;
  }

  Future<void> migrateDataToSheet() async {
    try {
      final propertyList = await isar.realEstates
          .where()
          .studyIdEqualToAnyCityPropertyNumber(
            Get.find<ActiveStudyController>().activeStudy!.id,
          )
          .findAll();
      if (propertyList.length == 1) {
        return await _onePropertyStudy(propertyList.first);
      } else {
        return await _multiPropertyStudy();
      }
    } catch (e) {
      debugPrint('$runtimeType (Migrate Data Sheet) Error: $e');
    }
  }

  Future<void> _onePropertyStudy(RealEstate property) async {
    int currentRow = 3;

    final propertyAllotments = await isar.realEstateAllotments
        .where()
        .propertyIdEqualToAnyShareholderName(property.id)
        .findAll();

    for (var propertyAllotment in propertyAllotments) {
      // Set shareholder name
      _sheet
          .getRangeByName('A$currentRow')
          .setText(propertyAllotment.shareholderName);

      // Set property share
      _sheet.getRangeByName('B$currentRow').setNumber(propertyAllotment.share);

      // Set participation rate
      _sheet
          .getRangeByName('C$currentRow')
          .setNumber(propertyAllotment.participationRate);

      // Set value due
      if (propertyAllotment.isContractor) {
        // Count of contractors with equal participation rate
        int count = 1;
        for (var element in propertyAllotments) {
          if (propertyAllotment.participationRate ==
              element.participationRate) {
            if (element.id == propertyAllotment.id) continue;
            count++;
          }
        }
        final actualParticipationRate =
            propertyAllotment.participationRate / count;
        _sheet.getRangeByName('D$currentRow').setFormula(
            '=(B$currentRow/${property.totalShare}*${property.value}) + ($actualParticipationRate*${property.value})');
      } else {
        _sheet.getRangeByName('D$currentRow').setFormula(
            '=B$currentRow/${property.totalShare}*C$currentRow*${property.value}');
      }

      // Get shareholder lot allotments
      final lotAllotments = await isar.lotAllotments
          .where()
          .propertyAllotmentIdEqualTo(propertyAllotment.id)
          .filter()
          .shareholderNameEqualTo(propertyAllotment.shareholderName)
          .findAll();

      // Set value received formula
      int shareholderEndRow = currentRow + lotAllotments.length - 1;
      _sheet
          .getRangeByName('I$currentRow')
          .setFormula('=SUM(H$currentRow:H$shareholderEndRow)');

      // Set value increase formula
      _sheet.getRangeByName('J$currentRow').setFormula(
          '=IF(I$currentRow>D$currentRow,I$currentRow-D$currentRow,0)');

      // Set value decrease formula
      _sheet.getRangeByName('K$currentRow').setFormula(
          '=IF(I$currentRow<D$currentRow,D$currentRow-I$currentRow,0)');

      // Set value increase percentage
      _sheet
          .getRangeByName('L$currentRow')
          .setFormula('=J$currentRow/${property.value}*2400');

      // Set value decrease percentage
      _sheet
          .getRangeByName('M$currentRow')
          .setFormula('=K$currentRow/${property.value}*2400');

      _setCellStyles(
        startRow: currentRow,
        endRow: currentRow + lotAllotments.length - 1,
      );
      for (var lotAllotment in lotAllotments) {
        final lot = await isar.lots
            .where()
            .idEqualTo(
              lotAllotment.lotId,
            )
            .findFirst();
        if (lot == null) return;
        // Set lot number
        _sheet
            .getRangeByName('E$currentRow')
            .setNumber(double.parse(lot.lotNumber));

        // Set lot allotment share
        _sheet.getRangeByName('F$currentRow').setNumber(lotAllotment.share);

        // Set lot value
        _sheet.getRangeByName('G$currentRow').setNumber(lot.value);

        // Set lot allotment share value
        _sheet
            .getRangeByName('H$currentRow')
            .setFormula('=F$currentRow/2400*G$currentRow');
        currentRow++;
      }
    }

    // SET SUMS AND TOTALS ROW

    // Set label
    _sheet.getRangeByName('A$currentRow').setText("المجموع");

    // Set total shares
    _sheet
        .getRangeByName('B$currentRow')
        .setFormula('=SUM(B3:B${currentRow - 1})');

    // Set total values Due
    _sheet
        .getRangeByName('D$currentRow')
        .setFormula('=SUM(D3:D${currentRow - 1})');

    // Set total share values
    _sheet
        .getRangeByName('H$currentRow')
        .setFormula('=SUM(H3:H${currentRow - 1})');

    // Set total value received
    _sheet
        .getRangeByName('I$currentRow')
        .setFormula('=SUM(I3:I${currentRow - 1})');

    // Set total increase difference
    _sheet
        .getRangeByName('J$currentRow')
        .setFormula('=SUM(J3:J${currentRow - 1})');

    // Set total decrease difference
    _sheet
        .getRangeByName('K$currentRow')
        .setFormula('=SUM(K3:K${currentRow - 1})');

    // Set total decrease percentage
    _sheet
        .getRangeByName('L$currentRow')
        .setFormula('=SUM(L3:L${currentRow - 1})');

    // Set total increase percentage
    _sheet
        .getRangeByName('M$currentRow')
        .setFormula('=SUM(M3:M${currentRow - 1})');

    _applyFooterFormatting(currentRow);
    _setNumberFormats(currentRow);
  }

  void _setCellStyles({
    required int startRow,
    required int endRow,
  }) {
    // Cell Style (A - D)
    final cellStyle = CellStyle(_workbook);
    cellStyle.fontName = 'Calibri';
    cellStyle.fontSize = 11;
    cellStyle.bold = true;

    // Border Style
    cellStyle.borders.right.lineStyle = LineStyle.thin;
    cellStyle.borders.left.lineStyle = LineStyle.thin;

    final bottomCellStyle = cellStyle.clone();
    bottomCellStyle.borders.bottom.lineStyle = LineStyle.thin;

    _sheet.getRangeByName('A$startRow:A$endRow').cellStyle = cellStyle;
    _sheet.getRangeByName('A$endRow').cellStyle = bottomCellStyle;

    final numberCellStyle = cellStyle.clone();
    numberCellStyle.hAlign = HAlignType.center;
    final bottomNumberCellStyle = numberCellStyle.clone();
    bottomNumberCellStyle.borders.bottom.lineStyle = LineStyle.thin;

    _sheet.getRangeByName('B$startRow:B$endRow').cellStyle = numberCellStyle;
    _sheet.getRangeByName('B$endRow').cellStyle = bottomNumberCellStyle;

    _sheet.getRangeByName('C$startRow:C$endRow').cellStyle = numberCellStyle;
    _sheet.getRangeByName('C$endRow').cellStyle = bottomNumberCellStyle;

    _sheet.getRangeByName('D$startRow:D$endRow').cellStyle =
        numberCellStyle.clone();
    _sheet.getRangeByName('D$endRow').cellStyle = bottomNumberCellStyle.clone();

    // Cell Style (E - H)
    final noBorderCellStyle = numberCellStyle.clone();
    noBorderCellStyle.bold = false;
    noBorderCellStyle.borders.right.lineStyle = LineStyle.none;
    noBorderCellStyle.borders.left.lineStyle = LineStyle.none;
    final bottomOnlyCellStyle = noBorderCellStyle.clone();
    bottomOnlyCellStyle.borders.bottom.lineStyle = LineStyle.thin;

    _sheet.getRangeByName('E$startRow:E$endRow').cellStyle = noBorderCellStyle;
    _sheet.getRangeByName('E$endRow').cellStyle = bottomOnlyCellStyle;

    _sheet.getRangeByName('F$startRow:F$endRow').cellStyle =
        noBorderCellStyle.clone();
    _sheet.getRangeByName('F$endRow').cellStyle = bottomOnlyCellStyle.clone();

    _sheet.getRangeByName('G$startRow:G$endRow').cellStyle = noBorderCellStyle;
    _sheet.getRangeByName('G$endRow').cellStyle = bottomOnlyCellStyle;

    _sheet.getRangeByName('H$startRow:H$endRow').cellStyle = noBorderCellStyle;
    _sheet.getRangeByName('H$endRow').cellStyle = bottomOnlyCellStyle;

    final boldNoBorderCellStyle = numberCellStyle.clone();
    boldNoBorderCellStyle.borders.left.lineStyle = LineStyle.none;
    boldNoBorderCellStyle.borders.right.lineStyle = LineStyle.none;
    final boldBottomOnlyStyle = boldNoBorderCellStyle.clone();
    boldBottomOnlyStyle.borders.bottom.lineStyle = LineStyle.thin;

    final leftCellStyle = numberCellStyle.clone();
    leftCellStyle.borders.left.lineStyle = LineStyle.none;
    final bottomLeftStyle = leftCellStyle.clone();
    bottomLeftStyle.borders.bottom.lineStyle = LineStyle.thin;

    // Cell Style (I - M)
    _sheet.getRangeByName('I$startRow:I$endRow').cellStyle = leftCellStyle;
    _sheet.getRangeByName('I$endRow').cellStyle = bottomLeftStyle;

    _sheet.getRangeByName('J$startRow:J$endRow').cellStyle =
        boldNoBorderCellStyle;
    _sheet.getRangeByName('J$endRow').cellStyle = boldBottomOnlyStyle;

    _sheet.getRangeByName('K$startRow:K$endRow').cellStyle = leftCellStyle;
    _sheet.getRangeByName('K$endRow').cellStyle = bottomLeftStyle;

    _sheet.getRangeByName('L$startRow:L$endRow').cellStyle =
        boldNoBorderCellStyle.clone();
    _sheet.getRangeByName('L$endRow').cellStyle = boldBottomOnlyStyle.clone();

    _sheet.getRangeByName('M$startRow:M$endRow').cellStyle =
        leftCellStyle.clone();
    _sheet.getRangeByName('M$endRow').cellStyle = bottomLeftStyle.clone();
  }

  void _applyFooterFormatting(int rowNumber) {
    final cellStyle = CellStyle(_workbook);
    cellStyle.borders.all.lineStyle = LineStyle.thin;
    cellStyle.hAlign = HAlignType.center;
    cellStyle.fontName = 'Calibri';
    cellStyle.fontSize = 11;
    cellStyle.bold = true;

    final labelCellStyle = cellStyle.clone();
    labelCellStyle.hAlign = HAlignType.right;

    _sheet.getRangeByName('A$rowNumber').cellStyle = labelCellStyle;
    _sheet.getRangeByName('B$rowNumber:D$rowNumber').cellStyle = cellStyle;

    final bottomOnlyCellStyle = cellStyle.clone();
    bottomOnlyCellStyle.borders.all.lineStyle = LineStyle.none;
    bottomOnlyCellStyle.borders.bottom.lineStyle = LineStyle.thin;

    final bottomLeftCellStyle = bottomOnlyCellStyle.clone();
    bottomLeftCellStyle.borders.right.lineStyle = LineStyle.thin;

    _sheet.getRangeByName('E$rowNumber:H$rowNumber').cellStyle =
        bottomOnlyCellStyle;
    _sheet.getRangeByName('I$rowNumber').cellStyle = bottomLeftCellStyle;

    _sheet.getRangeByName('J$rowNumber').cellStyle = bottomOnlyCellStyle;
    _sheet.getRangeByName('K$rowNumber').cellStyle = bottomLeftCellStyle;

    _sheet.getRangeByName('L$rowNumber').cellStyle = bottomOnlyCellStyle;
    _sheet.getRangeByName('M$rowNumber').cellStyle = bottomLeftCellStyle;
  }

  void _setNumberFormats(int rowCount) {
    _sheet.getRangeByName('D3:D$rowCount').numberFormat = '#,##0';

    _sheet.getRangeByName('G3:G$rowCount').numberFormat = '#,##0';
    _sheet.getRangeByName('H3:H$rowCount').numberFormat = '#,##0';
    _sheet.getRangeByName('I3:I$rowCount').numberFormat = '#,##0';

    _sheet.getRangeByName('J3:J$rowCount').numberFormat = '#,##0';
    _sheet.getRangeByName('K3:K$rowCount').numberFormat = '#,##0';

    _sheet.getRangeByName('L3:L$rowCount').numberFormat = '0.0##';
    _sheet.getRangeByName('M3:M$rowCount').numberFormat = '0.0##';
  }

  Future<void> _multiPropertyStudy() async {}

  Future<bool> saveExcelDocument() async {
    try {
      // Save file
      final List<int> bytes = _workbook.saveAsStream();
      _workbook.dispose();

      // Store file locally
      final fileName = Get.find<ActiveStudyController>().activeStudy!.title;
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/$fileName.xlsx';
      final file = File(path);
      await file.writeAsBytes(bytes, flush: true);
      debugPrint('Excel file saved to $path');
      return true;
    } catch (e) {
      debugPrint('$runtimeType (Save Excel Document) Error: $e');
      return false;
    }
  }
}
