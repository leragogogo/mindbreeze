import 'package:flutter/material.dart';
import 'package:mindbreeze/data/model/to_do_model.dart';
import 'package:mindbreeze/ui/widgets/to_do_card.dart';
import 'package:mobx/mobx.dart';

part 'today_tab_store.g.dart';

class TodayTabStore = TodayTabStoreBase with _$TodayTabStore;

abstract class TodayTabStoreBase with Store {
  @observable
  List<ToDoModel> toDos = [];

  @observable
  bool isEmpty = true;

  late AnimationController controller;

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @action
  void addToDo(ToDoModel toDo) {
    if (isEmpty) {
      controller.forward();
    }
    toDos.add(toDo);
    listKey.currentState?.insertItem(toDos.length - 1);
    isEmpty = false;
  }

  @action
  void removeToDo(int index) {
    if (toDos.length == 1) {
      controller.reverse();
    }
    
    var curToDo = toDos[index];
    listKey.currentState?.removeItem(
        index,
        (context, animation) => SizeTransition(
            sizeFactor: animation,/*CurvedAnimation(
              parent: animation,
              curve: const Interval(0.5, 1.0),
            ),*/
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: ToDoCard(
                toDo: curToDo,
                index: index,
                isTodayCard: true,
              ),
            )));
    toDos.removeAt(index);
    isEmpty = toDos.isEmpty;
  }
}
