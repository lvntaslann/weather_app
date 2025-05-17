import 'package:flutter/material.dart';
import 'package:portfolio/constans/colors.dart';
import 'package:portfolio/constans/sns_links.dart';
import 'package:portfolio/widgets/custom_textfield.dart';
import 'dart:js' as js;

class ContactsWidget extends StatelessWidget {
  const ContactsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.backGroundLightOne,
      child: Column(
        children: [
          Text(
            "Get in touch",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 35,
                color: CustomColor.whitePrimary),
          ),
          SizedBox(height: 50),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: CustomTextfield(
                    hintText: "Your Name",
                  ),
                ),
                SizedBox(width: 30),
                Flexible(
                  child: CustomTextfield(
                    hintText: "Your Email",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: CustomTextfield(
              hintText: "Your Message",
              maxLines: 20,
            ),
          ),
          SizedBox(height: 30),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepOrange),
                ),
                onPressed: () {},
                child: Text(
                  "Get in touch",
                  style:
                      TextStyle(color: CustomColor.whitePrimary, fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 300),
            child: Divider(),
          ),
          SizedBox(height: 15),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.github]);
                },
                child: Image.asset(
                  "github.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.instagram]);
                },
                child: Image.asset(
                  "instagram.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.linkedin]);
                },
                child: Image.asset(
                  "linkedin.png",
                  width: 28,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
