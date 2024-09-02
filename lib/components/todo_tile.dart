import 'package:flutter/material.dart';

class ToDOList extends StatelessWidget {
  const ToDOList(
      {super.key,
      required this.value,
      required this.taskName,
      required this.onChanged});

  final bool value;
  final String taskName;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Checkbox(value: value, onChanged: onChanged),
              Text(
                taskName,
                style: TextStyle(decoration: value? TextDecoration.lineThrough : TextDecoration.none),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
