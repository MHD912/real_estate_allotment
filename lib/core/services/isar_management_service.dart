import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:real_estate_allotment/core/services/isar_service.dart';
import 'package:real_estate_allotment/models/allotment/lot_allotment/lot_allotment.dart';
import 'package:real_estate_allotment/models/allotment/real_estate_allotment/real_estate_allotment.dart';
import 'package:real_estate_allotment/models/lot/lot.dart';
import 'package:real_estate_allotment/models/real_estate/real_estate.dart';
import 'package:real_estate_allotment/models/study/study.dart';

class IsarManagementService {
  final _isar = Get.find<IsarService>().isar;

  /// Exports all data from the database to a JSON file with user-selected save location
  Future<File?> exportDatabaseToJson() async {
    try {
      // Open file picker for save location
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath(
        dialogTitle: 'Select Backup Location',
      );

      if (selectedDirectory == null) {
        debugPrint('Export cancelled by user');
        return null;
      }

      // Prepare the export data
      final exportData = {
        'studies': await _exportCollection<Study>(),
        'lots': await _exportCollection<Lot>(),
        'realEstates': await _exportCollection<RealEstate>(),
        'lotAllotments': await _exportCollection<LotAllotment>(),
        'realEstateAllotments': await _exportCollection<RealEstateAllotment>(),
      };

      // Create a timestamp for the filename
      final timestamp = DateTime.now()
          .toIso8601String()
          .replaceAll(':', '-')
          .replaceAll('.', '-');

      final file = File('$selectedDirectory/isar_backup_$timestamp.json');

      // Convert to JSON and write to file
      final jsonString = const JsonEncoder.withIndent('  ').convert(exportData);
      return await file.writeAsString(jsonString, flush: true);
    } catch (e) {
      debugPrint('Error during database export: $e');
      return null;
    }
  }

  /// Imports data from a user-selected JSON file
  Future<bool> importDatabaseFromJsonFile() async {
    try {
      // Open file picker to select JSON backup file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
        dialogTitle: 'Select Isar Database Backup',
      );

      if (result == null) {
        debugPrint('Import cancelled by user');
        return false;
      }

      // Get the file path
      String? filePath = result.files.single.path;
      if (filePath == null) {
        debugPrint('No file selected');
        return false;
      }

      // Read the file
      final file = File(filePath);
      final jsonString = await file.readAsString();
      final Map<String, dynamic> exportData = jsonDecode(jsonString);

      // Start a write transaction
      await _isar.writeTxn(() async {
        // Clear existing data from all collections
        await _isar.clear();

        // Import studies
        if (exportData['studies'] != null) {
          final studies = (exportData['studies'] as List)
              .map((map) => Study(
                    id: map['id'],
                    title: map['title'],
                    dateCreated: DateTime.parse(map['dateCreated']),
                  ))
              .toList();
          await _isar.studies.putAll(studies);
        }

        // Import lots
        if (exportData['lots'] != null) {
          final lots = (exportData['lots'] as List)
              .map((map) => Lot(
                    id: map['id'],
                    lotNumber: map['lotNumber'],
                    propertyId: map['propertyId'],
                    value: map['value'],
                    totalShare: map['totalShare'],
                    shareRemaining: map['remainingShare'],
                    dateCreated: DateTime.parse(map['createdDate']),
                  ))
              .toList();
          await _isar.lots.putAll(lots);
        }

        // Import real estates
        if (exportData['realEstates'] != null) {
          final realEstates = (exportData['realEstates'] as List)
              .map((map) => RealEstate(
                    id: map['id'],
                    propertyNumber: map['propertyNumber'],
                    city: map['city'],
                    value: map['value'],
                    totalShare: map['totalShare'],
                    studyId: map['studyId'],
                    valueRemaining: map['remainingValue'],
                    shareRemaining: map['remainingShare'],
                    dateCreated: DateTime.parse(map['createdDate']),
                  ))
              .toList();
          await _isar.realEstates.putAll(realEstates);
        }

        // Import lot allotments
        if (exportData['lotAllotments'] != null) {
          final lotAllotments = (exportData['lotAllotments'] as List)
              .map((map) => LotAllotment(
                    id: map['id'],
                    share: map['share'],
                    shareholderName: map['shareholderName'],
                    lotId: map['lotId'],
                    propertyAllotmentId: map['propertyAllotmentId'],
                    dateCreated: DateTime.parse(map['createdDate']),
                  ))
              .toList();
          await _isar.lotAllotments.putAll(lotAllotments);
        }

        // Import real estate allotments
        if (exportData['realEstateAllotments'] != null) {
          final realEstateAllotments =
              (exportData['realEstateAllotments'] as List)
                  .map((map) => RealEstateAllotment(
                        id: map['id'],
                        share: map['share'],
                        participationRate: map['participationRate'],
                        shareholderName: map['shareholderName'],
                        isContractor: map['is_contractor'],
                        propertyId: map['propertyId'],
                        dateCreated: DateTime.parse(map['createdDate']),
                      ))
                  .toList();
          await _isar.realEstateAllotments.putAll(realEstateAllotments);
        }
      });

      return true;
    } catch (e) {
      debugPrint('Error during database import: $e');
      return false;
    }
  }

  /// Generic method to export a specific collection
  Future<List<Map<String, dynamic>>> _exportCollection<T>() async {
    final collection = _isar.collection<T>();
    final items = await collection.where().findAll();

    // Convert each item to a map
    return items.map((item) {
      if (item is Study) {
        return _studyToMap(item);
      } else if (item is Lot) {
        return _lotToMap(item);
      } else if (item is RealEstate) {
        return _realEstateToMap(item);
      } else if (item is LotAllotment) {
        return _lotAllotmentToMap(item);
      } else if (item is RealEstateAllotment) {
        return _realEstateAllotmentToMap(item);
      }
      throw UnsupportedError('Unsupported type: $T');
    }).toList();
  }

  // Conversion methods for each model type (same as previous implementation)
  Map<String, dynamic> _studyToMap(Study study) => {
        'id': study.id,
        'title': study.title,
        'dateCreated': study.dateCreated.toIso8601String(),
      };

  Map<String, dynamic> _lotToMap(Lot lot) => {
        'id': lot.id,
        'lotNumber': lot.lotNumber,
        'value': lot.value,
        'totalShare': lot.totalShare,
        'remainingShare': lot.remainingShare,
        'createdDate': lot.createdDate.toIso8601String(),
        'propertyId': lot.propertyId,
      };

  Map<String, dynamic> _realEstateToMap(RealEstate realEstate) => {
        'id': realEstate.id,
        'propertyNumber': realEstate.propertyNumber,
        'city': realEstate.city,
        'value': realEstate.value,
        'remainingValue': realEstate.remainingValue,
        'totalShare': realEstate.totalShare,
        'remainingShare': realEstate.remainingShare,
        'createdDate': realEstate.createdDate.toIso8601String(),
        'studyId': realEstate.studyId,
      };

  Map<String, dynamic> _lotAllotmentToMap(LotAllotment lotAllotment) => {
        'id': lotAllotment.id,
        'share': lotAllotment.share,
        'shareholderName': lotAllotment.shareholderName,
        'createdDate': lotAllotment.createdDate.toIso8601String(),
        'lotId': lotAllotment.lotId,
        'propertyAllotmentId': lotAllotment.propertyAllotmentId,
      };

  Map<String, dynamic> _realEstateAllotmentToMap(
          RealEstateAllotment realEstateAllotment) =>
      {
        'id': realEstateAllotment.id,
        'share': realEstateAllotment.share,
        'participationRate': realEstateAllotment.participationRate,
        'shareholderName': realEstateAllotment.shareholderName,
        'is_contractor': realEstateAllotment.isContractor,
        'createdDate': realEstateAllotment.createdDate.toIso8601String(),
        'propertyId': realEstateAllotment.propertyId,
      };
}
