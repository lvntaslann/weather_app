import 'package:flutter/material.dart';
import 'package:portfolio/constans/colors.dart';
import 'package:portfolio/constans/nav_items.dart';
import 'package:portfolio/style/style.dart';
import 'package:portfolio/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({Key? key, required this.onNavMenutap}) : super(key: key);
  final Function(int) onNavMenutap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 60,
      width: double.maxFinite,
      decoration: headerDecoration,
      child: Row(
        children: [
          SiteLogo(),
          Spacer(),
          for (int index = 0; index < navTitles.length; index++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                  onPressed: () {
                    onNavMenutap(index);
                  },
                  child: Text(
                    navTitles[index],
                    style: TextStyle(
                        color: CustomColor.whitePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
            ),
        ],
      ),
    );
  }
}
