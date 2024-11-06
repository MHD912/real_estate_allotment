import 'package:isar/isar.dart';

part 'study.g.dart';

@collection
class Study {
  Id id;

  String title;

  DateTime dateTime;

  Study({
    this.id = Isar.autoIncrement,
    required this.title,
    required this.dateTime,
  });
}