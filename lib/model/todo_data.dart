// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateformatter = DateFormat.yMd();
final timeformatter = TimeOfDay.fromDateTime(DateTime.timestamp());


const uuid = Uuid();

class ToDoData{
   ToDoData({
    
    required this.title,
    required this.description,
    required this.time,
    required this.date
   }): id = uuid.v4();

   final String id;
   final String title;
   final String description;
   final TimeOfDay? time;
   final DateTime date;

   String get formattedDateTime {
    return dateformatter.format(date);
   }
}



