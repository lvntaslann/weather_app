import 'package:crypto_app/pages/home_page.dart';
import 'package:crypto_app/viewmodels/crypto_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => CryptoViewmodel(), child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto app',
      home: HomePage()
    );
  }
}
