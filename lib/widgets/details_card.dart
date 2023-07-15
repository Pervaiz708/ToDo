import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_data.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final ToDoData task;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 70,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes the position of the shadow
            ),
          ],
        ),
      
      ),
    );
  }
}