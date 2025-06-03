import 'package:flutter/material.dart';
import 'package:flutter_example/pages/device/device_page.dart';
import 'package:flutter_example/services/book_services.dart';
import 'package:flutter_example/services/device_service.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookServices()),
        ChangeNotifierProvider(create: (context)=>DeviceService()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DevicePage(),
    );
  }
}
