import 'package:flutter/material.dart';
import 'package:mindbreeze/ui/res/app_assets.dart';
import 'package:mindbreeze/ui/res/app_colors.dart';

class AddToDoButton extends StatelessWidget {
  final VoidCallback addToDo;
  final double buttonSize;
  final double iconSize;

  const AddToDoButton(
      {super.key, required this.addToDo,
      required this.buttonSize,
      required this.iconSize});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      color: Colors.transparent,
      child: ElevatedButton(
        
        onPressed: addToDo,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(const CircleBorder()),
        ),
        child: Image.asset(
          AppAssets.plusAsset,
          height: iconSize,
          width: iconSize,
          color: AppColors.gradientStartColor,
        ),
      ),
    );
  }
}
