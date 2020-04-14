import 'package:flutter/material.dart';

class ToDo {
  int id;
  String title;
  String body;
  int completed=0;
  ToDo({@required this.title, @required this.body, @required this.completed});
}