import 'package:flutter/material.dart';
import 'package:mindbreeze/ui/screen/res/app_strings.dart';

class MoodSelectionButton extends StatefulWidget {
  const MoodSelectionButton({
    super.key,
  });

  @override
  State<MoodSelectionButton> createState() => _MoodSelectionButtonState();
}

class _MoodSelectionButtonState extends State<MoodSelectionButton> {
  final List<String> moods = [
    AppStrings.sadMoodText,
    AppStrings.angryMoodText,
    AppStrings.anxiousMoodText,
    AppStrings.calmMoodText,
    AppStrings.amazedMoodText,
    AppStrings.brokenMoodText
  ];
  FocusNode buttonFocusNode = FocusNode();
  bool isMoodChosen = false;
  String moodImage = '';
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      childFocusNode: buttonFocusNode,
      builder: (context, controller, child) {
        return SizedBox(
            width: 30,
            height: 30,
            child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.white, width: 2)),
                  shape: MaterialStateProperty.all(const CircleBorder()),
                ),
                focusNode: buttonFocusNode,
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                child: isMoodChosen
                    ? SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          'res/icons/$moodImage.png',
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      )
                    : null));
      },
      menuChildren: moods.map((mood) {
        return MenuItemButton(
          child: SizedBox(
            width: 50,
            child: Column(
              children: [
                Image.asset(
                  'res/icons/${mood.toLowerCase()}.png',
                  width: 25,
                  height: 25,
                ),
                Text(
                  mood,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          onPressed: () {
            setState(() {
              isMoodChosen = true;
              moodImage = mood.toLowerCase();
            });
          },
        );
      }).toList(),
    );
  }
}
