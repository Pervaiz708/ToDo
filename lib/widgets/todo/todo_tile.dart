/// The `ToDoItem` class is a stateful widget that represents a single item in a to-do list with a
/// checkbox, title, date, and menu icon.
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_data.dart';

class ToDoItem extends StatefulWidget {
  const ToDoItem({required this.task, super.key});

  final ToDoData task;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  var _done = false;

  void _setDone(bool? isChecked) {
    setState(() {
      _done = isChecked ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Checkbox(value: _done, onChanged: _setDone),
        title: Text(
          widget.task.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        // subtitle: Text(widget.task.date.toString()),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.task.formattedDateTime),
            Icon(
              widget.task.time == null ? 
              Icons.alarm_off : Icons.alarm,
              size: 12,
            )
          ],
        ),
        // dense: true,
        trailing: const Icon(Icons.menu),
      ),
    );
  }
}
