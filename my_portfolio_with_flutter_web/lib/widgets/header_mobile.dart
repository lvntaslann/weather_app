import 'package:flutter/material.dart';
import 'package:portfolio/style/style.dart';
import 'package:portfolio/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  const HeaderMobile({Key? key, this.onLogoTap, this.onMenuTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
      decoration: headerDecoration,
      child: Row(
        children: [
          SiteLogo(
            onTap: onLogoTap,
          ),
          Spacer(),
          IconButton(onPressed: onMenuTap, icon: Icon(Icons.menu)),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
