import 'package:flutter/material.dart';
import 'package:portfolio/constans/colors.dart';
import 'dart:js' as js;
import 'package:portfolio/constans/sns_links.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeWidth = size.width;
    final sizeHeight = size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: sizeHeight,
      constraints: BoxConstraints(minHeight: 350),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.scaffoldBackground.withOpacity(0.4),
                CustomColor.scaffoldBackground.withOpacity(0.4),
              ]).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              "image.png",
              width: sizeWidth,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //intro message
          Text(
            "Hi, \nI'm Levent ASLAN \nA Software Developer",
            style: TextStyle(
                height: 1.5,
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary),
          ),
          SizedBox(
            height: 15,
          ),
          //contact button
          SizedBox(
            width: 200,
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
                style: TextStyle(color: CustomColor.whitePrimary, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
