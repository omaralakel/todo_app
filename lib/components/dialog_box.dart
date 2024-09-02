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
               maxLength: 40,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 145, 145, 145))),
                hintText: "Your task here",
                focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 145, 145, 145), width: 2.0),
    ),
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
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
