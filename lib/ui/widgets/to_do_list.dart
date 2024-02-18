import 'package:flutter/material.dart';
import 'package:mindbreeze/data/store/incoming_tab_store.dart';
import 'package:mindbreeze/ui/widgets/add_to_do_button.dart';
import 'package:mindbreeze/ui/widgets/to_do_card.dart';
import 'package:provider/provider.dart';

class ToDoList extends StatefulWidget {
  final GlobalKey<AnimatedListState> listKey;
  const ToDoList({super.key, required this.listKey});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Stack(
        children: [
          AnimatedList(
            key: widget.listKey,
            initialItemCount:
                Provider.of<IncomingTabStore>(context, listen: false)
                    .toDos
                    .length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                  position: animation.drive(Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  )),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: ToDoCard(
                      animation: animation,
                      isTodayCard: false,
                      toDo:
                          Provider.of<IncomingTabStore>(context, listen: false)
                              .toDos[index],
                      index: index,
                    ),
                  ));
            },
          ),
          Positioned(
              bottom: 40,
              left: width / 2 - 25,
              child: AddToDoButton(
                  addToDo: () {
                    Provider.of<IncomingTabStore>(context, listen: false)
                        .addToDo();
                  },
                  buttonSize: 50,
                  iconSize: 50)),
        ],
      ),
    );
  }
}
