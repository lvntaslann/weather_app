import 'package:flutter/material.dart';
import 'package:to_do_app/buttons.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple.shade300,
      content: Container(
        height: 180,
        child: Column(
          children: [
            TextField(
              controller: controller,
              //field
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //buttons
                Buttons(text: "Cancel", onPressed: onCancel),

                Buttons(text: "Save", onPressed: onSave),
              ],
            )
          ],
        ),
      ),
    );
  }
}
