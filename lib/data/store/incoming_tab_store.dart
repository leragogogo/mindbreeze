import 'package:flutter/material.dart';
import 'package:mindbreeze/data/model/to_do_model.dart';
import 'package:mindbreeze/data/store/main_screen_store.dart';
import 'package:mindbreeze/ui/widgets/to_do_card.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

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
    toDos.add(ToDoModel(
        description: '', excuse: '', mood: '', markDoneButtonOpacity: 0.0));
    listKey.currentState?.insertItem(toDos.length - 1);
    isEmpty = false;
  }

  @action
  void removeToDo(int index, BuildContext context) {
    if (toDos.length == 1) {
      controller.reverse();
    }
    toDos.removeAt(index);
    listKey.currentState
        ?.removeItem(index, (context, animation) => Container());
    isEmpty = toDos.isEmpty;
    if (isEmpty) {
      Provider.of<MainScreenStore>(context, listen: false).isCalendarPushed =
          false;
    }
  }

  @action
  void markToday(int index, BuildContext context) {
    if (toDos.length == 1) {
      controller.reverse();
    }

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
            animation: animation,
            toDo: curToDo,
            index: index,
            isTodayCard: false,
          ),
        ),
      ),
    );
    toDos.removeAt(index);
    isEmpty = toDos.isEmpty;
    if (isEmpty) {
      Provider.of<MainScreenStore>(context, listen: false).isCalendarPushed =
          false;
    }
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
        sizeFactor: animation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: ToDoCard(
            animation: animation,
            toDo: curToDo,
            index: index,
            isTodayCard: false,
          ),
        ),
      ),
    );
    toDos.removeAt(index);
    isEmpty = toDos.isEmpty;
  }
}
