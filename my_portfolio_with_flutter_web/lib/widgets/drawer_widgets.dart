import 'package:flutter/material.dart';
import 'package:portfolio/constans/colors.dart';
import 'package:portfolio/constans/nav_items.dart';

class DrawerWidgets extends StatelessWidget {
  final Function(int) onNavItemTap;
  const DrawerWidgets({Key? key, required this.onNavItemTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBackground,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
            ),
          ),
          for (int index = 0; index < navIcons.length; index++)
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              leading: Icon(navIcons[index]),
              title: Text(navTitles[index]),
              titleTextStyle: TextStyle(
                  color: CustomColor.whitePrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
              onTap: () {
                onNavItemTap(index);
              },
            )
        ],
      ),
    );
  }
}
