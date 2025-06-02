import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/task.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateControlller = TextEditingController();
  List<Task> tasks = [
    Task(
        title: "Flutter çalış",
        description: "Flutterda animasyon çalış",
        dueDate: DateTime.parse("2025-06-01"),
        isCompleted: false),
    Task(
        title: "NodeJS çalış",
        description: "Backend öğrenme amacıyla",
        dueDate: DateTime.parse("2023-06-01"),
        isCompleted: false),
    Task(
        title: "Uyku",
        description: "Uykunu düzene sok erken kalk",
        dueDate: DateTime.parse("2023-06-01"),
        isCompleted: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext, index) => Card(
                elevation: 5,
                margin: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Görev: ${tasks[index].title}",
                        style: TextStyle(
                          color: tasks[index].isCompleted
                              ? Colors.green
                              : Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Açıklama: ${tasks[index].description}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                          "Son Tarih: ${DateFormat('dd.MM.yyyy').format(tasks[index].dueDate)}"),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              tasks[index].isCompleted =
                                  !tasks[index].isCompleted;
                              print(tasks[index].isCompleted);
                            });
                          },
                          icon: Icon(Icons.check))
                    ],
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text("Yeni Görev Ekle"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: titleController,
                          decoration:
                              InputDecoration(labelText: "Görev Başlığı"),
                        ),
                        TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(labelText: "Açıklama"),
                        ),
                        TextField(
                          controller: dateControlller,
                          decoration: InputDecoration(
                              labelText: "Son Tarih (YYYY-MM-DD)"),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            String title = titleController.text;
                            String description = descriptionController.text;
                            setState(() {
                              tasks.add(Task(
                                title: title,
                                description: description,
                                dueDate: DateTime.parse(dateControlller.text),
                              ));
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text("Ekle")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("İptal")),
                    ],
                  ),
                );
              },
              child: Icon(Icons.add)),
        ],
      ),
    );
  }
}
