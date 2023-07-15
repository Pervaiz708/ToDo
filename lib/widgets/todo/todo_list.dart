import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_data.dart';
import 'package:todo_app/widgets/todo/todo_tile.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    required this.tasks,
    // ignore: non_constant_identifier_names
    required this.OnRemovetask, 
    super.key});

  final List<ToDoData> tasks;
  
  // ignore: non_constant_identifier_names
  final void Function(ToDoData task) OnRemovetask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: tasks.length,
        itemBuilder: (ctx, index) => Dismissible(
            background: Container(
              color: Colors.redAccent,
            ),
            key: ValueKey(tasks[index]),
            onDismissed: (direction) {
              OnRemovetask(tasks[index]);
            },
            child: ToDoItem(task: tasks[index])));
  }
}
