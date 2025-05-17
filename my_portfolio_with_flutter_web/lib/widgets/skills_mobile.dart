import 'package:flutter/material.dart';
import 'package:portfolio/constans/colors.dart';
import 'package:portfolio/constans/skill_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: Column(
        children: [
          for (int index = 0; index < platformItems.length; index++)
            Container(
              margin: EdgeInsets.only(bottom: 5),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: CustomColor.backGroundLightTwo,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: Icon(platformItems[index]["icon"]),
                title: Text(platformItems[index]["title"]),
              ),
            ),
          SizedBox(
            height: 50,
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              for (int index = 0; index < skillsItems.length; index++)
                Chip(
                  backgroundColor: CustomColor.backGroundLightTwo,
                  labelPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  label: Text(skillsItems[index]["title"]),
                  avatar: Image.asset(skillsItems[index]["img"]),
                ),
            ],
          )
        ],
      ),
    );
  }
}
