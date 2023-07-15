import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_data.dart';
import 'package:todo_app/widgets/todo/todo_tile.dart';
import 'package:todo_app/todo_homepage.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({required this.task, super.key});

  final List<ToDoData> task;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: task.length,
      itemBuilder: (ctx, index)=>
        Dismissible(
          background: Container(
            color: Colors.redAccent,
          ),
          key: ValueKey(task[index]),
          onDismissed: (direction) {
            onRemoveTask(task[index]);
          },

          child: ToDoItem(task:task[index]))
      );
  }
}