import 'package:flutter/material.dart';
import 'package:mindbreeze/ui/screen/res/app_colors.dart';

class MarkButton extends StatefulWidget {
  const MarkButton({super.key});

  @override
  State<MarkButton> createState() => _MarkButtonState();
}

class _MarkButtonState extends State<MarkButton> {
  final List<String> options = ['plus', 'done'];
  String image = '';
  FocusNode buttonFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
        alignmentOffset: const Offset(0, -7),
        childFocusNode: buttonFocusNode,
        style: MenuStyle(
            elevation: MaterialStateProperty.all(0.0),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            backgroundColor: MaterialStateProperty.all(Colors.transparent)),
        builder: (context, controller, child) {
          return SizedBox(
              width: 34,
              height: 34,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  backgroundColor: image == 'done'
                      ? MaterialStateProperty.all(AppColors.doneButtonColor)
                      : MaterialStateProperty.all(Colors.transparent),
                  side: image == 'done'
                      ? null
                      : MaterialStateProperty.all(
                          const BorderSide(color: Colors.white, width: 3)),
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
                child: image == ''
                    ? null
                    : Image.asset(
                        'res/icons/$image.png',
                        width: 27,
                        height: 27,
                        color: Colors.white,
                      ),
              ));
        },
        menuChildren: options.map((option) {
          return SizedBox(
            width: 34,
            height: 34,
            child: MenuItemButton(
              style: ButtonStyle(
                padding:
                    MaterialStateProperty.all(const EdgeInsets.only(left: 3)),
                elevation: MaterialStateProperty.all(0.0),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: option == 'done'
                    ? MaterialStateProperty.all(AppColors.doneButtonColor)
                    : MaterialStateProperty.all(Colors.transparent),
                side: option == 'done'
                    ? null
                    : MaterialStateProperty.all(
                        const BorderSide(color: Colors.white, width: 3)),
                shape: MaterialStateProperty.all(const CircleBorder()),
              ),
              child: Image.asset(
                'res/icons/$option.png',
                width: 27,
                height: 27,
                color: Colors.white,
              ),
              onPressed: () {
                image = option;
              },
            ),
          );
        }).toList());
  }
}
