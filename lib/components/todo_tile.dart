import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDOList extends StatelessWidget {
  const ToDOList(
      {super.key,
      required this.value,
      required this.taskName,
      required this.onChanged,
      required this.deleteFunction});

  final bool value;
  final String taskName;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(6),
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Checkbox(value: value, onChanged: onChanged),
                Text(
                  taskName,
                  style: TextStyle(
                      decoration: value
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
