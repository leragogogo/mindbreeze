import 'package:flutter/material.dart';
import 'package:mindbreeze/data/model/to_do_model.dart';
import 'package:mobx/mobx.dart';

part 'incoming_tab_store.g.dart';

class IncomingTabStore = IncomingTabStoreBase with _$IncomingTabStore;

abstract class IncomingTabStoreBase with Store {
  @observable
  List<ToDoModel> toDos = [];

  @observable
  bool isEmpty = true;

  late AnimationController controller;

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @action
  void addToDo() {
    if(isEmpty){
      controller.forward();
    }
    toDos.add(ToDoModel(description: '', excuse: '', mood: '', state: ''));
    listKey.currentState?.insertItem(toDos.length - 1);
    isEmpty = false;
  }

  @action
  void removeToDo(int index) {
    if(toDos.length == 1){
      controller.reverse();
    }
    toDos.removeAt(index);
    listKey.currentState?.removeItem(
      index,
      (context, animation) => Container());
    isEmpty = toDos.isEmpty;
  }
}
