import 'package:isar/isar.dart';

abstract class Allotment {
  abstract Id id;
  abstract double share;
  abstract String shareholderName;
  abstract DateTime createdDate;
}
