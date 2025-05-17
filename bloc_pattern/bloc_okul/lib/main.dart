import 'package:block_app/model/sayac_cubit.dart';
import 'package:block_app/screens/home_page.dart';
import 'package:block_app/screens/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SayacCubit(),
          ),
        ],
        child: MaterialApp(
          routes: {
            "/homepage": (BuildContext context) => HomePage(),
            "/secondpage": (BuildContext context) => SecondPage(),
          },
          title: "Bloc state management",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(),
        ));
  }
}
