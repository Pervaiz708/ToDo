import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_data.dart';

class BottomOverlaySheet extends StatefulWidget {
  const BottomOverlaySheet({super.key, required this.onAddNewTask});

  final void Function(ToDoData newTask) onAddNewTask;

  @override
  State<BottomOverlaySheet> createState() {
    return _BottomOverlaySheetState();
  }
}

class _BottomOverlaySheetState extends State<BottomOverlaySheet> {
  final _titlecontroller = TextEditingController();
  final _descriptioncontroller = TextEditingController();
  DateTime? _pickeddate;
  TimeOfDay? _pickedtime;

  @override
  void dispose() {
    _titlecontroller.dispose();
    _descriptioncontroller.dispose();
    super.dispose();
  }

  void _onSubmitTask() {
    if (_titlecontroller.text.trim().isEmpty || _pickeddate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text(
                    'Please make Sure that You have entered a valid Title and picked Date'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Okay'),
                  )
                ],
              ));
      return;
    }
    widget.onAddNewTask(ToDoData(
        title: _titlecontroller.text,
        description: _descriptioncontroller.text,
        date: _pickeddate!,
        time: _pickedtime));
        Navigator.pop(context);
  }
  void getDatePicker() async {
    final present = DateTime.now();
    final firstDate = DateTime(present.year - 1);
    final lastDate = DateTime(present.year + 10);
    final picked = await showDatePicker(
      context: context, 
      initialDate: present, 
      firstDate: firstDate, 
      lastDate: lastDate);
    setState(() {
      _pickeddate = picked;
    });  
  }

  void getTimePicker() async {
    final  picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      _pickedtime = picked!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              TextField(
                controller: _titlecontroller,
                maxLength: 20,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _descriptioncontroller,
                maxLength: 150,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      IconButton(
                          onPressed: getTimePicker, icon: const Icon(Icons.alarm)),
                      const SizedBox(width: 5),
                      // ignore: unnecessary_null_comparison
                      Text(_pickedtime == null
                          ? 'No Time Picked'
                          :  _pickedtime!.format(context)
                          //  _pickedtime.format(context).toString()
                          ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(width: 5),
                          Text(_pickeddate == null
                              ? 'No Date Selected'
                              : dateformatter.format(_pickeddate!)),
                          IconButton(
                              onPressed: getDatePicker,
                              icon: const Icon(Icons.calendar_month_outlined)),
                        ],
                      ))
                    ],
                  )),
                ],
              )),
               Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed:(){
                           Navigator.pop(context);
                        }, 
                        child: const Text('Cancel')),
                      TextButton(
                        onPressed: _onSubmitTask, 
                        child: const Text('Submit'))
                    ],
                  ))
            ])));
  }
}
