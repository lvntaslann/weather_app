import 'package:flutter/material.dart';
import 'package:portfolio/constans/colors.dart';
import 'package:portfolio/constans/skill_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //platforms
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 450,
          ),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              for (int index = 0; index < platformItems.length; index++)
                Container(
                  width: 200,
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
                )
            ],
          ),
        ),
        SizedBox(
          width: 100,
        ),
        //skills
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
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
            ),
          ),
        )
      ],
    );
  }
}
