import 'package:flutter/material.dart';
import 'package:todo_app/models/class_todo_list.dart';

class ModalContainer extends StatefulWidget {
  const ModalContainer({super.key});

  @override
  State<ModalContainer> createState() => _ModalContainerState();
}

class _ModalContainerState extends State<ModalContainer> {
  var _selectedCategory = CategoryOptions.work;
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void _addTask() {
    final enteredText = textController.text.trim();

    if (enteredText.isEmpty) {
      return;
    }

    final newTask = ToDoObject(
      title: enteredText,
      isComplete: false,
      category: _selectedCategory,
    );
    Navigator.pop(context, newTask);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 48.0),
      child: Column(
        children: [
          Text(
            'Add a task',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Add the title',
            ),
            controller: textController,
          ),
          SizedBox(
            height: 16.0,
          ),
          DropdownButton(
            isExpanded: true,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            value: _selectedCategory,
            items: CategoryOptions.values
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.name),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value!;
              });
            },
          ),
          SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: _addTask,
            child: Text('Add Task'),
          ),
        ],
      ),
    );
  }
}
