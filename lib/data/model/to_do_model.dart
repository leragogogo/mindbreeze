import 'package:flutter/material.dart';

// Model of ToDoCard.
class ToDoModel {
  // unique key to find a toDo in a list.
  late Key uKey;

  // description of user's task.
  String description = '';

  // reason why user don't want to do task.
  String excuse = '';

  // user's mood.
  String mood = '';

  // used for animation of markDoneButton
  late double markDoneButtonOpacity;

  ToDoModel({
    required this.uKey,
    required this.description,
    required this.excuse,
    required this.mood,
    required this.markDoneButtonOpacity,
  });

  // parsing of data from cache.
  ToDoModel.fromString(String toDo) {
    var args = toDo.split('*');

    uKey = Key(args[0]);
    description = args[1];
    excuse = args[2];
    mood = args[3];
    markDoneButtonOpacity = 0.0;
  }

  @override
  String toString() {
    return '$uKey*$description*$excuse*$mood';
  }
}
