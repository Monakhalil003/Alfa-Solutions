import 'package:flutter/cupertino.dart';

class SubTask{
  String title;
  bool isCompleted;

  SubTask({required this.title, this.isCompleted=false});
}
class Task{
  String title;
  List<SubTask> subtasks;

  Task({required this.title, this.subtasks=const[]});
}