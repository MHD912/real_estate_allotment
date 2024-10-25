import 'package:isar/isar.dart';

part 'stakeholder.g.dart';

@collection
class Stakeholder {
  Id id;
  String name;

  Stakeholder({
    this.id = Isar.autoIncrement,
    required this.name,
  });
}
