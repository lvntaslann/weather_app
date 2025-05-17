import 'package:app_with_provider/providers/cart_providers.dart';
import 'package:app_with_provider/screens/cart_page.dart';
import 'package:app_with_provider/screens/product_pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1F1F1F),
      ),
      title: "Flutter provider",
      initialRoute: "/products",
      routes: {
        "/products": (context) => ProductPages(),
        "/cart": (context) => CartPage(),
      },
    );
  }
}
