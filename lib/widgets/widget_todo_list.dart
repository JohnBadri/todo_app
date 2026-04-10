import 'package:flutter/material.dart';
import 'package:todo_app/models/class_todo_list.dart';

class ToDoCards extends StatelessWidget {
  const ToDoCards({
    super.key,
    required this.toDoList,
    required this.onToggleTask,
  });

  final List<ToDoObject> toDoList;
  final void Function(ToDoObject task) onToggleTask;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final task in toDoList)
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(task.title),
                subtitle: Text(
                  '${task.category.name} • ${task.createdAt.day}/${task.createdAt.month}',
                ),
                trailing: Checkbox(
                  value: task.isComplete,
                  onChanged: (bool? value) {
                    onToggleTask(task);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
