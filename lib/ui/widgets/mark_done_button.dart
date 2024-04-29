import 'package:flutter/material.dart';
import 'package:mindbreeze/ui/res/app_assets.dart';

class MarkDoneButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isToday;
  final Animation<double> animation;

  const MarkDoneButton(
      {super.key,
      required this.onPressed,
      required this.isToday,
      required this.animation});

  @override
  State<MarkDoneButton> createState() => _MarkDoneButtonState();
}

class _MarkDoneButtonState extends State<MarkDoneButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void startRemoveAnimation() {
    _animationController.forward().then((value) {
      widget.onPressed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 34,
      height: 34,
      child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            side: MaterialStateProperty.all(
                const BorderSide(color: Colors.white, width: 3)),
            shape: MaterialStateProperty.all(const CircleBorder()),
          ),
          onPressed: startRemoveAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Stack(
              children: [
                Image.asset(
                  AppAssets.doneBackgroundAsset,
                ),
                Center(
                  child: Image.asset(
                    AppAssets.doneAsset,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
