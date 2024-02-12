import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mindbreeze/data/store/today_tab_store.dart';
import 'package:mindbreeze/ui/res/app_strings.dart';
import 'package:mindbreeze/ui/widgets/to_do_card.dart';
import 'package:provider/provider.dart';

class TodayTab extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const TodayTab({super.key, required this.scaffoldKey});

  @override
  State<TodayTab> createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    /*Provider.of<TodayTabStore>(context, listen: false).controller =
        AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );*/
     
  }

  @override
  void dispose() {
    //Provider.of<TodayTabStore>(widget.scaffoldKey.currentContext ?? context, listen: false).controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return AnimatedBuilder(
          animation:
              Provider.of<TodayTabStore>(context, listen: false).controller,
          builder: (context, child) {
            return Stack(
              children: [
                Opacity(
                  opacity: 1 -
                      Provider.of<TodayTabStore>(context, listen: false)
                          .controller
                          .value,
                  child:
                      Provider.of<TodayTabStore>(context, listen: false).isEmpty
                          ? _EmptyTodayTab()
                          : Container(),
                ),
                Opacity(
                  opacity: Provider.of<TodayTabStore>(context, listen: false)
                      .controller
                      .value,
                  child:
                      Provider.of<TodayTabStore>(context, listen: false).isEmpty
                          ? Container()
                          : _TodayList(),
                )
              ],
            );
          },
        );
      },
    );
  }
}

class _EmptyTodayTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 80,left: 100),
      child: Text(
          AppStrings.emptyTodayTapText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.white
          ),
       
      ),
    );
  }
}

class _TodayList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: AnimatedList(
        key: Provider.of<TodayTabStore>(context, listen: false).listKey,
        initialItemCount:
            Provider.of<TodayTabStore>(context, listen: false).toDos.length,
        itemBuilder: (context, index, animation) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: ToDoCard(
              isTodayCard: true,
              toDo:
                  Provider.of<TodayTabStore>(context, listen: false).toDos[index],
              index: index,
            ),
          );
        },
      ),
    );
  }
}
