import 'package:isar/isar.dart';

part 'stakeholder.g.dart';

@collection
class Stakeholder {
  Id id = Isar.autoIncrement;

  String name;

  Stakeholder({
    required this.name,
  });
}
