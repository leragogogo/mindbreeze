import 'package:flutter/material.dart';
import 'package:mindbreeze/ui/screen/res/app_colors.dart';
import 'package:mindbreeze/ui/screen/res/app_strings.dart';

class MoodSelectionButron extends StatefulWidget {
  const MoodSelectionButron({super.key});

  @override
  State<MoodSelectionButron> createState() => _MoodSelectionButronState();
}

class _MoodSelectionButronState extends State<MoodSelectionButron>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

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
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

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
    _overlayEntry?.remove();
    super.dispose();
  }

  void toggleDropdown() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else if (_controller.isCompleted) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
          width: 21,
          height: 21,
          child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.white, width: 1)),
                shape: MaterialStateProperty.all(const CircleBorder()),
              ),
              focusNode: buttonFocusNode,
              onPressed: () {
                if (_controller.isDismissed) {
                  _controller.forward();
                } else if (_controller.isCompleted) {
                  _controller.reverse();
                }
                _showOverlay(context);
              },
              child: isMoodChosen
                  ? SizedBox(
                      width: 21,
                      height: 21,
                      child: Image.asset(
                        'res/icons/$moodImage.png',
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                    )
                  : null)),
    );
  }

  void _showOverlay(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx - 25,
        top: offset.dy + size.height,
        child: ScaleTransition(
          scale: _scaleAnimation,
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            height: 290,
            child: Column(
              children: moods.map((mood) {
                return ElevatedButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: SizedBox(
                    width: 47,
                    child: Column(
                      children: [
                        Image.asset(
                          'res/icons/${mood.toLowerCase()}.png',
                          width: 25,
                          height: 25,
                          color: AppColors.cardColor,
                        ),
                        Text(
                          mood,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.cardColor),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isMoodChosen = true;
                      moodImage = mood.toLowerCase();
                      _controller.reverse();
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }
}
