abstract class Excel {
  Future<void> migrateDataToSheet();
  Future<bool> saveExcelDocument();
}
