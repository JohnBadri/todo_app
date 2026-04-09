import 'package:flutter/material.dart';
import 'package:todo_app/models/class_todo_list.dart';

class ToDoCards extends StatelessWidget {
  const ToDoCards({super.key, required this.toDoList});

  final List<ToDoObject> toDoList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final task in toDoList)
          Card(
            child: Column(
              children: [
                Text(task.id),
              ],
            ),
          ),
      ],
    );
  }
}
