import 'package:flutter/material.dart';
import 'package:mindbreeze/ui/screen/res/app_colors.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            AppColors.gradientStartColor,
            AppColors.gradientEndColor,
          ],
        ),
      ),
      child: child,
    );
  }
}
