import 'package:flutter/material.dart';
import 'package:todo_app/components/button.dart';

class DialogBox extends StatelessWidget {
  DialogBox({super.key, required this.onCancel, required this.onSave, required this.controller});


  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 300,
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Your task here",
                ),
            ),
            const SizedBox(height: 30,),

            Row(children: [
            // cancel button
            DialogButton(text: "cancel",onPressed: onCancel,),
            
            // save button
            DialogButton(text: "save", onPressed: onSave,),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,)

          ],
        ),
      ),
      backgroundColor: Colors.grey[250],
    );
  }
}
