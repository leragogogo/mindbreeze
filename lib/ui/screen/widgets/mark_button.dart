import 'package:flutter/material.dart';
import 'package:mindbreeze/ui/screen/res/app_colors.dart';

class MarkButton extends StatefulWidget {
  const MarkButton({super.key});

  @override
  State<MarkButton> createState() => _MarkButtonState();
}

class _MarkButtonState extends State<MarkButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  final List<String> options = ['plus', 'done'];
  String image = '';
  FocusNode buttonFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
              if (_controller.isDismissed) {
                _controller.forward();
              } else if (_controller.isCompleted) {
                _controller.reverse();
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
          ),
        ),
        ScaleTransition(
          scale: _scaleAnimation,
          child: Column(
            children: options.map((option) {
              return SizedBox(
                width: 34,
                height: 34,
                child: MenuItemButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.only(left: 3)),
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
                    width: 28,
                    height: 28,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      image = option;
                    });
                    _controller.reverse();
                  },
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
