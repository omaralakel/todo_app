import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  DialogButton({super.key, required this.onPressed, required this.text});

  final String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(text),
      ),
      color: Colors.grey[300],
    );
  }
}
