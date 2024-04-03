import 'package:flutter/material.dart';
import 'package:mindbreeze/data/model/to_do_model.dart';
import 'package:mindbreeze/data/store/incoming_tab_store.dart';
import 'package:mindbreeze/ui/res/app_colors.dart';
import 'package:mindbreeze/ui/res/app_strings.dart';
import 'package:provider/provider.dart';

class MoodSelectionButton extends StatefulWidget {
  final bool enabled;
  final ToDoModel toDo;
  final bool isToday;
  const MoodSelectionButton(
      {super.key,
      required this.toDo,
      required this.isToday,
      required this.enabled});

  @override
  State<MoodSelectionButton> createState() => _MoodSelectionButtonState();
}

class _MoodSelectionButtonState extends State<MoodSelectionButton> {
  String mood = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: widget.toDo.mood == ''
              ? Border.all(color: Colors.white, width: 2)
              : null),
      child: PopupMenuButton<String>(
        enabled: widget.enabled,
        initialValue: widget.toDo.mood,
        position: PopupMenuPosition.under,
        offset: const Offset(40, 0),
        iconSize: 0,
        constraints: BoxConstraints.tight(const Size(80, 310)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(0.0),
        onSelected: (String value) {
          setState(() {
            mood = value;
          });
          if (!widget.isToday) {
            Provider.of<IncomingTabStore>(context, listen: false)
                .changeMood(widget.toDo.uKey, value.toLowerCase());
          }
        },
        itemBuilder: (BuildContext context) {
          return <String>[
            AppStrings.sadMoodText,
            AppStrings.angryMoodText,
            AppStrings.anxiousMoodText,
            AppStrings.calmMoodText,
            AppStrings.amazedMoodText,
            AppStrings.brokenMoodText
          ].map((String value) {
            return PopupMenuItem<String>(
              value: value,
              child: SizedBox(
                width: 47,
                child: Column(
                  children: [
                    Image.asset(
                      'res/icons/${value.toLowerCase()}.png',
                      width: 25,
                      height: 25,
                      color: AppColors.cardColor,
                    ),
                    Text(
                      value,
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.cardColor),
                    ),
                  ],
                ),
              ),
            );
          }).toList();
        },
        child: widget.toDo.mood == ''
            ? null
            : Image.asset(
                'res/icons/${widget.toDo.mood.toLowerCase()}.png',
                width: 32,
                height: 32,
                color: Colors.white,
              ),
      ),
    );
  }
}
