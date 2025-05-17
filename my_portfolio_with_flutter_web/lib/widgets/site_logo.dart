import 'package:flutter/material.dart';

class SiteLogo extends StatelessWidget {
  final VoidCallback? onTap;
  const SiteLogo({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          "LA",
          style: TextStyle(
              color: Colors.yellowAccent,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
