import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List listToDo = [];
  final _taskBox = Hive.box('taskBox');

  void createFirsData() {
    listToDo = [
      ["Make app", false],
      ["Make web app", false],
    ];
  }

  void loadData() {
    listToDo = _taskBox.get("TODOLIST");
  }

  void updateDataBase() {
    _taskBox.put("TODOLİST", listToDo);
  }
}
