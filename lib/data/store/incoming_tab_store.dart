import 'package:flutter/material.dart';
import 'package:mindbreeze/data/model/to_do_model.dart';
import 'package:mindbreeze/ui/widgets/to_do_card.dart';
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
    if (isEmpty) {
      controller.forward();
    }
    toDos.add(ToDoModel(description: '', excuse: '', mood: '', state: ''));
    listKey.currentState?.insertItem(toDos.length - 1);
    isEmpty = false;
  }

  @action
  void removeToDo(int index) {
    if (toDos.length == 1) {
      controller.reverse();
    }
    toDos.removeAt(index);
    listKey.currentState
        ?.removeItem(index, (context, animation) => Container());
    isEmpty = toDos.isEmpty;
  }

  @action
  void markDone(int index) {
    if (toDos.length == 1) {
      controller.reverse();
    }
    
    var curToDo = toDos[index];
    listKey.currentState?.removeItem(
      index,
      (context, animation) => SizeTransition(
        sizeFactor: animation, /*CurvedAnimation(
          parent: animation,
          curve: const Interval(0.5, 1.0),
        ),*/
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: ToDoCard(
            toDo: curToDo, 
            index: index,
            isTodayCard: false,
          ),
        ),
      ),
      //duration: Duration(seconds: 1),
    );
    toDos.removeAt(index);
    isEmpty = toDos.isEmpty;
  }
}
