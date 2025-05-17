import 'package:bloc_pattern/screens/cart_screen.dart';
import 'package:bloc_pattern/screens/product_screen_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (BuildContext context) => ProductScreenList(),
        "/cart": (BuildContext context) => CartScreen(),
      },
      initialRoute: "/",
    );
  }
}
