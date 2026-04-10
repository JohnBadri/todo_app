import 'package:flutter/material.dart';
import 'package:todo_app/models/class_todo_list.dart';

class ModalContainer extends StatefulWidget {
  const ModalContainer({super.key});

  @override
  State<ModalContainer> createState() => _ModalContainerState();
}

class _ModalContainerState extends State<ModalContainer> {
  var _selectedCategory = CategoryOptions.work;

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
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Add Task'),
          ),
        ],
      ),
    );
  }
}
