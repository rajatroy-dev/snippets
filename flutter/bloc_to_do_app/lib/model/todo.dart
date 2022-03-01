import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  Todo({
    String? id,
    required this.title,
    String? description,
    bool? completed,
  })  : id = id ?? const Uuid().v4(),
        description = description ?? "",
        completed = completed ?? false;

  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final bool? completed;

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, description: $description, '
        'completed: $completed,)';
  }
}
