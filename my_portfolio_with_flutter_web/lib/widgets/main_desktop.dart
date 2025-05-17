import 'package:flutter/material.dart';
import 'package:portfolio/constans/colors.dart';
import 'dart:js' as js;
import 'package:portfolio/constans/sns_links.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeWidth = size.width;
    final sizeHeight = size.height;
    return Container(
      constraints: BoxConstraints(minHeight: 350.0),
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: sizeHeight / 1.2,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hi, \nI'm Levent ASLAN \nA Software Developer",
              style: TextStyle(
                  height: 1.5,
                  fontSize: 65,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whitePrimary),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 420,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepOrange),
                ),
                onPressed: () {
                  js.context.callMethod("open", [SnsLinks.instagram]);
                },
                child: Text(
                  "Get in touch",
                  style:
                      TextStyle(color: CustomColor.whitePrimary, fontSize: 20),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Image.asset(
          "image.png",
          width: sizeWidth / 2.5,
        ),
      ]),
    );
  }
}
