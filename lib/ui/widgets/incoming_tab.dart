import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mindbreeze/data/store/incoming_tab_store.dart';
import 'package:mindbreeze/ui/res/app_strings.dart';
import 'package:mindbreeze/ui/widgets/add_to_do_button.dart';
import 'package:mindbreeze/ui/widgets/to_do_list.dart';
import 'package:provider/provider.dart';

class IncomingTab extends StatefulWidget {
  const IncomingTab({super.key});

  @override
  State<IncomingTab> createState() => _IncomingTabState();
}

class _IncomingTabState extends State<IncomingTab>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<IncomingTabStore>(context, listen: false).controller =
        AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    Provider.of<IncomingTabStore>(context, listen: false).controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return AnimatedBuilder(
          animation:
              Provider.of<IncomingTabStore>(context, listen: false).controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Opacity(
                  opacity: 1.0 -
                      Provider.of<IncomingTabStore>(context, listen: false)
                          .controller
                          .value,
                  child: Provider.of<IncomingTabStore>(context, listen: false)
                          .isEmpty
                      ? _EmptyToDoList(addToDo: () {
                          Provider.of<IncomingTabStore>(context, listen: false)
                              .addToDo();
                        })
                      : Container(),
                ),
                Opacity(
                  opacity: Provider.of<IncomingTabStore>(context, listen: false)
                      .controller
                      .value,
                  child: Provider.of<IncomingTabStore>(context, listen: false)
                          .isEmpty
                      ? Container()
                      : ToDoList(
                          listKey: Provider.of<IncomingTabStore>(context,
                                  listen: false)
                              .listKey),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _EmptyToDoList extends StatelessWidget {
  final VoidCallback addToDo;

  const _EmptyToDoList({required this.addToDo});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AddToDoButton(
              addToDo: addToDo,
              buttonSize: 76,
              iconSize: 76,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              AppStrings.noOneToDoText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
