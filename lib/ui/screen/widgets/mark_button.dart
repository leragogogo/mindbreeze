import 'package:flutter/material.dart';

class MarkButton extends StatefulWidget {
  //final List<String> options;

  const MarkButton({super.key});

  @override
  State<MarkButton> createState() => _MarkButtonState();
}

class _MarkButtonState extends State<MarkButton> {
  final List<String> options = ['Today', 'Done'];
  FocusNode buttonFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
        childFocusNode: buttonFocusNode,
        builder: (context, controller, child) {
          return SizedBox(
              width: 40,
              height: 40,
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
                  child: null));
        },
        menuChildren: options.map((option) {
          return MenuItemButton(
            child: Text(
              option,
              style: const TextStyle(fontSize: 16),
            ),
            onPressed: () {},
          );
        }).toList());
  }
}