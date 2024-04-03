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

class ToDoCard extends StatefulWidget {
  final ToDoModel toDo;
  final bool isTodayCard;
  final Animation<double> animation;
  final Key uKey;
  const ToDoCard(
      {super.key,
      required this.toDo,
      required this.isTodayCard,
      required this.animation,
      required this.uKey});

  @override
  State<ToDoCard> createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  TextEditingController descriptionController = TextEditingController();
  FocusNode descriptionFocusNode = FocusNode();
  TextEditingController excuseController = TextEditingController();
  FocusNode excuseFocusNode = FocusNode();
  double position = 0;

  @override
  void initState() {
    descriptionController.text = widget.toDo.description;
    excuseController.text = widget.toDo.excuse;
    super.initState();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    excuseController.dispose();
    descriptionFocusNode.dispose();
    excuseFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    descriptionController.text = widget.toDo.description;
    excuseController.text = widget.toDo.excuse;
    return !widget.isTodayCard
        ? Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              Provider.of<IncomingTabStore>(context, listen: false)
                  .removeToDo(widget.toDo.uKey, context);
            },
            background: Padding(
                padding: EdgeInsets.only(left: 3 * (width - 34) / 4),
                child: Image.asset(AppAssets.binAsset)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Observer(
                        builder: (context) {
                          return Provider.of<MainScreenStore>(context,
                                      listen: false)
                                  .isCalendarPushed
                              ? MarkTodayButton(
                                  onPressed: () {
                                    Provider.of<IncomingTabStore>(context,
                                            listen: false)
                                        .markToday(widget.toDo.uKey, context);
                                    Provider.of<TodayTabStore>(context,
                                            listen: false)
                                        .addToDo(widget.toDo);
                                  },
                                )
                              : MarkDoneButton(
                                  animation: widget.animation,
                                  isToday: widget.isTodayCard,
                                  onPressed: () {
                                    Provider.of<IncomingTabStore>(context,
                                            listen: false)
                                        .markDone(widget.toDo.uKey);
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
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 60),
                                    child: TextField(
                                      controller: descriptionController,
                                      cursorColor: Colors.white,
                                      focusNode: descriptionFocusNode,
                                      onTapOutside: (event) {
                                        Provider.of<IncomingTabStore>(context,
                                                listen: false)
                                            .changeDescription(widget.toDo.uKey,
                                                descriptionController.text);

                                        descriptionFocusNode.unfocus();
                                      },
                                      maxLines: null,
                                      style: const TextStyle(
                                        fontSize: 23,
                                        color: AppColors.textColor,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            AppStrings.hintDescriptionText,
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
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: TextField(
                                      controller: excuseController,
                                      cursorColor: Colors.white,
                                      focusNode: excuseFocusNode,
                                      onTapOutside: (event) {
                                        Provider.of<IncomingTabStore>(context,
                                                listen: false)
                                            .changeExcuse(widget.toDo.uKey,
                                                excuseController.text);

                                        excuseFocusNode.unfocus();
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
                              left: width - 121,
                              child: MoodSelectionButton(
                                enabled: true,
                                toDo: widget.toDo,
                                isToday: widget.isTodayCard,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: MarkDoneButton(
                      animation: widget.animation,
                      isToday: widget.isTodayCard,
                      onPressed: () {
                        if (widget.isTodayCard) {
                          Provider.of<TodayTabStore>(context, listen: false)
                              .markDone(widget.toDo.uKey);
                        } else {
                          Provider.of<IncomingTabStore>(context, listen: false)
                              .markDone(widget.toDo.uKey);
                        }
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
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 60),
                                  child: TextField(
                                    enabled: false,
                                    controller: descriptionController,
                                    cursorColor: Colors.white,
                                    focusNode: descriptionFocusNode,
                                    onTapOutside: (event) {
                                      descriptionFocusNode.unfocus();
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
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: TextField(
                                    enabled: false,
                                    controller: excuseController,
                                    cursorColor: Colors.white,
                                    focusNode: excuseFocusNode,
                                    onTapOutside: (event) {
                                      excuseFocusNode.unfocus();
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
                            child: MoodSelectionButton(
                              enabled: false,
                              toDo: widget.toDo,
                              isToday: widget.isTodayCard,
                            ),
                          ),
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
