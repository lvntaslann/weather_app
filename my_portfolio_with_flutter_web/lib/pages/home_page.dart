// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:portfolio/constans/colors.dart';
import 'package:portfolio/constans/size.dart';
import 'package:portfolio/widgets/contacts_widget.dart';
import 'package:portfolio/widgets/drawer_widgets.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/main_desktop.dart';
import 'package:portfolio/widgets/main_mobile.dart';
import 'package:portfolio/widgets/projects_sections.dart';
import 'package:portfolio/widgets/skills_desktop.dart';
import 'package:portfolio/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeWidth = size.width;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        endDrawer: constraints.maxWidth >= minDesktopWidth
            ? null
            : DrawerWidgets(
                onNavItemTap: (int navIndex) {
                  scaffoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                },
              ),
        backgroundColor: CustomColor.scaffoldBackground,
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(key: navBarKeys[0]),
              //main
              if (constraints.maxWidth >= minDesktopWidth)
                HeaderDesktop(
                  onNavMenutap: (int navIndex) {
                    scrollToSection(navIndex);
                  },
                )
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),

              //MainDesktop(),
              if (constraints.maxWidth >= minDesktopWidth)
                MainDesktop()
              else
                MainMobile(),

              //skills
              Container(
                key: navBarKeys[1],
                padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                width: sizeWidth,
                color: CustomColor.backGroundLightOne,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //title
                    Text(
                      "What I can do",
                      style: TextStyle(
                          color: CustomColor.whitePrimary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    //platforms and skills
                    if (constraints.maxWidth >= mediumDesktopWidth)
                      SkillsDesktop()
                    else
                      SkillsMobile()
                  ],
                ),
              ),
              //projects
              Container(
                key: navBarKeys[2],
                child: ProjectsSections(),
              ),
              SizedBox(
                height: 30,
              ),
              //contact
              Container(
                key: navBarKeys[3],
                child: ContactsWidget(),
              ),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex >= navBarKeys.length) return;

    final key = navBarKeys[navIndex];

    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
