import 'dart:core';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToDoTile extends StatelessWidget {
  final String Taskname;
  final TaskCompleted;
  //Function bool(bool?)?onchanged;
  final ValueChanged<bool?>? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.Taskname,
      required this.TaskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(11),
            ),
          ],
        ),
        child: Container(
          child: Row(
            children: [
              //CHECKBOX
              Checkbox(
                value: TaskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              //TASK NAME
              Text(
                Taskname,
                style: TextStyle(
                  decoration: TaskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(12),
            //color: Colors.white38,
            // borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
