import 'package:flutter/material.dart';
import 'package:todo_app/styling/colors.dart';
import 'package:todo_app/widgets/bottomoverlay_sheet.dart';
import 'package:todo_app/widgets/search_bar.dart';
import 'package:todo_app/model/todo_data.dart';
import 'package:todo_app/widgets/todo/todo_list.dart';

class ToDoHomePage extends StatefulWidget {
  const ToDoHomePage({super.key});

  @override
  State<ToDoHomePage> createState() {
    return _ToDoHomePageState();
  }
}

class _ToDoHomePageState extends State<ToDoHomePage> {
  // ignore: non_constant_identifier_names
  final List<ToDoData> _ToDoTask = [
    ToDoData(
        title: 'Anniversiry',
        description: 'Buy Gift for Lovely Wife',
        time: TimeOfDay.now(),
        date: DateTime.now()),
  ];
  void addBottomSheet() {
    showModalBottomSheet(
        useSafeArea: true,
        backgroundColor: lightbackgroundColor,
        context: context,
        builder: (ctx) => BottomOverlaySheet(onAddNewTask: addNewTask));
  }

  void addNewTask(ToDoData task) {
    setState(() => _ToDoTask.add(task));
  }

  void onRemoveTask(ToDoData task){
    setState(() {
      _ToDoTask.remove(task);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightbackgroundColor,
        body: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 25, right: 15, left: 15),
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 10,
                      spreadRadius: 3,
                      offset: const Offset(5, 5))
                ]),
            child: const SearchBarBox(),
          ),
          const SizedBox(height: 25),
          const Text(
            "To Do List",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: ToDoList(task: _ToDoTask,)),
          )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: addBottomSheet,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
