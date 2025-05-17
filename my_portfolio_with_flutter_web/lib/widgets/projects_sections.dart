import 'dart:js_interop_unsafe';
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:portfolio/constans/colors.dart';
import 'package:portfolio/constans/sns_links.dart';
import 'package:portfolio/utils/project_utils.dart';
import 'package:portfolio/widgets/project_card.dart';

class ProjectsSections extends StatelessWidget {
  const ProjectsSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      width: sizeWidth,
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          Text(
            "Work Projects",
            style: TextStyle(
                color: CustomColor.whitePrimary,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Wrap(
            runSpacing: 60,
            spacing: 60,
            children: [
              for (int index = 0; index < myProjectUtils.length; index++)
                ProjectWidget(
                    sizeWidth: sizeWidth, project: myProjectUtils[index]),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            "Work Hoby Projects",
            style: TextStyle(
                color: CustomColor.whitePrimary,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Wrap(
            runSpacing: 60,
            spacing: 60,
            children: [
              for (int index = 0; index < myHobyProjectUtils.length; index++)
                ProjectWidget(
                    sizeWidth: sizeWidth, project: myHobyProjectUtils[index]),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "For more:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: CustomColor.whitePrimary),
              ),
              SizedBox(
                width: 30,
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.github]);
                },
                child: Image.asset(
                  "github.png",
                  width: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
