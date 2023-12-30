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
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: SizedBox(
        height: 160,
        width: double.infinity,
        child: Row(
          children: [
            const Center(
              child: MarkButton(),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.gradientStartColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextField(
                                focusNode: descriptionFocusNode,
                                onTapOutside: (event) {
                                  descriptionFocusNode.unfocus();
                                },
                                onSubmitted: (value) {
                                  FocusScope.of(context)
                                      .requestFocus(reasonFocusNode);
                                },
                                maxLines: 2,
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
                            const Expanded(
                                flex: 2,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 15, left: 25),
                                  child: MoodSelectionButton(),
                                )),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: AppColors.dividerColor,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: TextField(
                          focusNode: reasonFocusNode,
                          onTapOutside: (event) {
                            reasonFocusNode.unfocus();
                          },
                          onSubmitted: (value) {
                            reasonFocusNode.unfocus();
                          },
                          maxLines: 2,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
