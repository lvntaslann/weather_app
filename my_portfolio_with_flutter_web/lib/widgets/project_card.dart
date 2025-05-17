import 'package:flutter/material.dart';
import 'package:portfolio/constans/colors.dart';
import 'package:portfolio/utils/project_utils.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    super.key,
    required this.sizeWidth,
    required this.project,
  });

  final double sizeWidth;
  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 460,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.backGroundLightTwo,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //image
          Image.asset(
            project.image,
            height: 290,
            width: 330,
            fit: BoxFit.cover,
          ),
          //title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: CustomColor.whitePrimary),
            ),
          ),
          //subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subTitle,
              style: TextStyle(fontSize: 14, color: CustomColor.whiteSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
