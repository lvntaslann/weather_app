import 'package:flutter/material.dart';
import 'package:portfolio/constans/colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLines;
  final String? hintText;
  const CustomTextfield(
      {Key? key, this.controller, this.hintText, this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: CustomColor.backGroundLightOne),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          filled: true,
          fillColor: CustomColor.whitePrimary,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          hintText: hintText,
          hintStyle: TextStyle(color: CustomColor.scaffoldBackground)),
    );
  }
}
