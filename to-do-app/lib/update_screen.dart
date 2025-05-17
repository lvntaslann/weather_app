import 'package:flutter/material.dart';
import 'package:to_do_app/buttons.dart';

class UpdateScreen extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  UpdateScreen({
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update task'),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'new task'),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //buttons
            Buttons(text: "Cancel", onPressed: onCancel),

            Buttons(text: "Save", onPressed: onSave),
          ],
        )
      ],
    );
  }
}
