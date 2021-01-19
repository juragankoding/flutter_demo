import 'package:flutter/material.dart';

class Todo {
  String id;
  String text;
  bool done;

  Todo({this.id, this.done = false, @required this.text});

  factory Todo.generateTodo(Map<String, dynamic> json) {
    return Todo(
      id: json["id"],
      text: json["text"],
      done: json["done"],
    );
  }
}
