import 'package:flutter/material.dart';
import 'package:mindbreeze/data/model/to_do_model.dart';
import 'package:mindbreeze/data/store/incoming_tab_store.dart';
import 'package:mindbreeze/ui/res/app_assets.dart';
import 'package:mindbreeze/ui/res/app_colors.dart';
import 'package:mindbreeze/ui/res/app_strings.dart';
import 'package:mindbreeze/ui/widgets/mark_button.dart';
import 'package:mindbreeze/ui/widgets/mood_selection_button.dart';
import 'package:provider/provider.dart';

class ToDoCard extends StatelessWidget {
  final ToDoModel toDo;
  final int index;
  final bool isTodayCard;
  const ToDoCard(
      {super.key,
      required this.toDo,
      required this.index,
      required this.isTodayCard});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return !isTodayCard
        ? Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              Provider.of<IncomingTabStore>(context, listen: false)
                  .removeToDo(index);
            },
            background: Padding(
                padding: EdgeInsets.only(left: 3 * (width - 34) / 4),
                child: Image.asset(AppAssets.binAsset)),
            child: _Card(
              toDo: toDo,
              isTodayCard: isTodayCard,
              index: index,
            )
            /*child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: MarkButton(),
            ),
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 60),
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
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
      ),*/
            )
        : _Card(
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

  const _Card(
      {required this.toDo, required this.isTodayCard, required this.index});
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
            child: MarkButton(
              toDo: widget.toDo,
              isTodayCard: widget.isTodayCard,
              index: widget.index,
            ),
          ),
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
