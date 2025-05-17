import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/database.dart';
import 'package:to_do_app/dialog_box.dart';
import 'package:to_do_app/to_do_list.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/update_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final _taskBox = Hive.box('taskBox');
  ToDoDatabase dataBase = ToDoDatabase();

  void initState() {
    super.initState();
    //app when first runing it
    if (_taskBox.get("TODOLIST") == null) {
      dataBase.createFirsData();
    } else {
      //already exists data
      dataBase.loadData();
    }
  }

  void onChangedCheckBox(bool? value, int index) {
    setState(() {
      dataBase.listToDo[index][1] = value;
    });
    dataBase.updateDataBase();
  }

  void addNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveTask,
          );
        });
    dataBase.updateDataBase();
  }

  void saveTask() {
    setState(() {
      dataBase.listToDo.add([_controller.text, false]);
      _controller.clear();
    });
    dataBase.updateDataBase();
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      dataBase.listToDo.removeAt(index);
    });
    dataBase.updateDataBase();
  }

  void onUpdateTask(int index) {
    _controller.text = dataBase.listToDo[index][0];

    showDialog(
      context: context,
      builder: (context) {
        return UpdateScreen(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: () => saveUpdatedTask(index),
        );
      },
    );
  }

  void saveUpdatedTask(int index) {
    setState(() {
      dataBase.listToDo[index][0] = _controller.text;
      _controller.clear();
    });
    dataBase.updateDataBase();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Text(
              'T O  D O ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: dataBase.listToDo.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: dataBase.listToDo[index][0],
            taskCompleted: dataBase.listToDo[index][1],
            onChanged: (value) => onChangedCheckBox(value, index),
            deleteTask: (BuildContext) => deleteTask(index),
            onUpdateTask: () => onUpdateTask(index),
          );
        },
      ),
    );
  }
}
