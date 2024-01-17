import 'package:flutter/material.dart';
import 'package:mindbreeze/ui/screen/res/app_colors.dart';
import 'package:mindbreeze/ui/screen/res/app_strings.dart';
import 'package:mindbreeze/ui/screen/widgets/mark_button.dart';
import 'package:mindbreeze/ui/screen/widgets/mood_selection_button.dart';

class ToDoCard extends StatefulWidget {
  const ToDoCard({super.key});

  @override
  State<ToDoCard> createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  FocusNode descriptionFocusNode = FocusNode();
  FocusNode reasonFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50),
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
                            padding: const EdgeInsets.only(left: 10,right: 10),
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
