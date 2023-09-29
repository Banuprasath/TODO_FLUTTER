import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class Tododatabase {
  List toDoList = [];
  final _mybox = Hive.box('myBox');
  void createIntialData() {
    toDoList = [];
  }

  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  void updateDatabase() {
    _mybox.put("TODOLIST", toDoList);
  }
}
