import 'package:uuid/uuid.dart';

enum CategoryOptions { work, leisure, food, travel }

var uuid = Uuid();

class ToDoObject {
  ToDoObject({
    String? id,
    DateTime? createdAt,
    required this.title,
    required this.isComplete,
    required this.category,
  }) : id = id ?? uuid.v4(),
       createdAt = createdAt ?? DateTime.now();

  final String id;
  final String title;
  final DateTime createdAt;
  bool isComplete;
  CategoryOptions category;
}
