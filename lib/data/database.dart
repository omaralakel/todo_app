import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];



  // reference my box
  final _mybox = Hive.box("mybox");

  void createInitialData() {
    toDoList = [
    ["Make Tutorial", false],
    ["Study", false]
  ];
  }

  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  void updateDataBase() {
    _mybox.put("TODOLIST", toDoList);
  }
}