// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:to_do_app/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //init the hive and open a box
  await Hive.initFlutter();

  var box = await Hive.openBox('taskBox');

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
      ),
    );
  }
}
