import 'package:flutter/material.dart';
import 'package:todo_app/models/class_todo_list.dart';
import 'package:todo_app/widgets/widget_modal_popup.dart';
import 'package:todo_app/widgets/widget_todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ToDoObject> _activeList = completeToDoList;

  void _toggleTaskStatus(ToDoObject task) {
    setState(() {
      task.isComplete = !task.isComplete;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: ToDoCards(
        toDoList: _activeList,
        onToggleTask: _toggleTaskStatus,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return ModalContainer();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
