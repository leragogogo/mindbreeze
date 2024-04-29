import 'package:flutter/material.dart';
import 'package:mindbreeze/data/model/to_do_model.dart';
import 'package:mindbreeze/ui/widgets/to_do_card.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'today_tab_store.g.dart';

// Store of TodayTab.
class TodayTabStore = TodayTabStoreBase with _$TodayTabStore;

abstract class TodayTabStoreBase with Store {
  // list of toDos in the today tab.
  @observable
  List<ToDoModel> toDos = [];

  @observable
  bool isEmpty = true;

  // controller for animation between empty state and state with at least 1 toDo.
  late AnimationController controller;

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  // add a toDo card from incoming tab.
  @action
  Future<void> addToDo(ToDoModel toDo) async {
    if (isEmpty) {
      controller.forward();
    }
    toDos.add(toDo);
    listKey.currentState?.insertItem(toDos.length - 1);
    isEmpty = false;
    saveToDos();
  }

  // mark toDo card as done.
  @action
  Future<void> markDone(Key key) async {
    if (toDos.length == 1) {
      controller.reverse();
    }
    var index = findElementByKey(key);
    var curToDo = toDos[index];
    listKey.currentState?.removeItem(
      index,
      (context, animation) => SlideTransition(
        position: animation.drive(Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        )),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: ToDoCard(
            uKey: key,
            animation: animation,
            toDo: curToDo,
            isTodayCard: false,
          ),
        ),
      ),
    );
    toDos.removeAt(index);
    isEmpty = toDos.isEmpty;
    saveToDos();
  }

  // save toDos in a cache using SharedPreferences.
  Future<void> saveToDos() async {
    List<String> strToDos = [];
    for (var todo in toDos) {
      strToDos.add(todo.toString());
    }
    final pref = await SharedPreferences.getInstance();
    pref.setStringList('todayToDos', strToDos);
  }

  Future<SharedPreferences> getPref() async {
    return await SharedPreferences.getInstance();
  }

  // read toDos from a cache using SharedPreferences.
  @action
  void readToDos(SharedPreferences pref) {
    var strToDos = pref.getStringList('todayToDos') ?? [];
    for (var strToDo in strToDos) {
      toDos.add(ToDoModel.fromString(strToDo));
    }
    isEmpty = toDos.isEmpty;
    if (!isEmpty) {
      controller.value = 1.0;
    }
  }

  // find toDo in a list using its unique key.
  int findElementByKey(Key key) {
    int index = -1;
    for (int i = 0; i < toDos.length; i++) {
      if (toDos[i].uKey == key) {
        index = i;
        break;
      }
    }
    return index;
  }
}
