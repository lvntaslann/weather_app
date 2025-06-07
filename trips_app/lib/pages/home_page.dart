import 'package:flutter/material.dart';
import 'package:trips_app/widget/screentitle.dart';

import '../widget/triplist.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topLeft),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            SizedBox(
              height: 160,
              child: Screentitle(text: "Levents trips")
            ),
            Flexible(child: TripList(),)
          ],
        ),
      ),
    );
  }
}
