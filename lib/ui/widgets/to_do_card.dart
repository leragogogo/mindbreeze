import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mindbreeze/data/model/to_do_model.dart';
import 'package:mindbreeze/data/store/incoming_tab_store.dart';
import 'package:mindbreeze/data/store/main_screen_store.dart';
import 'package:mindbreeze/data/store/today_tab_store.dart';
import 'package:mindbreeze/ui/res/app_assets.dart';
import 'package:mindbreeze/ui/res/app_colors.dart';
import 'package:mindbreeze/ui/res/app_strings.dart';
import 'package:mindbreeze/ui/widgets/mark_done_button.dart';
import 'package:mindbreeze/ui/widgets/mark_today_button.dart';
import 'package:mindbreeze/ui/widgets/mood_selection_button.dart';
import 'package:provider/provider.dart';

class ToDoCard extends StatelessWidget {
  final ToDoModel toDo;
  final int index;
  final bool isTodayCard;
  final Animation<double> animation;
  const ToDoCard(
      {super.key,
      required this.toDo,
      required this.index,
      required this.isTodayCard,
      required this.animation});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return !isTodayCard
        ? Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              Provider.of<IncomingTabStore>(context, listen: false)
                  .removeToDo(index, context);
            },
            background: Padding(
                padding: EdgeInsets.only(left: 3 * (width - 34) / 4),
                child: Image.asset(AppAssets.binAsset)),
            child: _Card(
              animation: animation,
              toDo: toDo,
              isTodayCard: isTodayCard,
              index: index,
            ))
        : _Card(
            animation: animation,
            toDo: toDo,
            isTodayCard: isTodayCard,
            index: index,
          );
  }
}

class _Card extends StatefulWidget {
  final ToDoModel toDo;
  final bool isTodayCard;
  final int index;
  final Animation<double> animation;

  const _Card({
    required this.toDo,
    required this.isTodayCard,
    required this.index,
    required this.animation,
  });
  @override
  State<_Card> createState() => _CardState();
}

class _CardState extends State<_Card> {
  FocusNode descriptionFocusNode = FocusNode();

  FocusNode reasonFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: widget.isTodayCard
                  ? MarkDoneButton(
                      animation: widget.animation,
                      index: widget.index,
                      isToday: widget.isTodayCard,
                      onPressed: () {
                        if (widget.isTodayCard) {
                          Provider.of<TodayTabStore>(context, listen: false)
                              .removeToDo(widget.index);
                        } else {
                          Provider.of<IncomingTabStore>(context, listen: false)
                              .markDone(widget.index);
                        }
                      },
                    )
                  : Observer(
                      builder: (context) {
                        return Provider.of<MainScreenStore>(context,
                                    listen: false)
                                .isCalendarPushed
                            ? MarkTodayButton(
                                onPressed: () {
                                  Provider.of<IncomingTabStore>(context,
                                          listen: false)
                                      .markToday(widget.index, context);
                                  Provider.of<TodayTabStore>(context,
                                          listen: false)
                                      .addToDo(widget.toDo);
                                },
                              )
                            : MarkDoneButton(
                                animation: widget.animation,
                                index: widget.index,
                                isToday: widget.isTodayCard,
                                onPressed: () {
                                  if (widget.isTodayCard) {
                                    Provider.of<TodayTabStore>(context,
                                            listen: false)
                                        .removeToDo(widget.index);
                                  } else {
                                    Provider.of<IncomingTabStore>(context,
                                            listen: false)
                                        .markDone(widget.index);
                                  }
                                },
                              );
                      },
                    )),
          Expanded(
            child: SingleChildScrollView(
              child: Card(
                color: AppColors.cardColor,
                margin: const EdgeInsets.only(left: 8),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 60),
                            child: TextField(
                              cursorColor: Colors.white,
                              focusNode: descriptionFocusNode,
                              onTapOutside: (event) {
                                descriptionFocusNode.unfocus();
                              },
                              onSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(reasonFocusNode);
                              },
                              maxLines: null,
                              style: const TextStyle(
                                fontSize: 23,
                                color: AppColors.textColor,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: AppStrings.hintDescriptionText,
                                hintStyle: TextStyle(
                                  fontSize: 23,
                                  color: AppColors.unselectedTabColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          height: 5,
                          color: AppColors.dividerColor,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextField(
                              cursorColor: Colors.white,
                              focusNode: reasonFocusNode,
                              onTapOutside: (event) {
                                reasonFocusNode.unfocus();
                              },
                              onSubmitted: (value) {
                                reasonFocusNode.unfocus();
                              },
                              maxLines: null,
                              style: const TextStyle(
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: AppStrings.hintReasonText,
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.unselectedTabColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        top: 16,
                        left: width - 117,
                        child: const MoodSelectionButron())
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
