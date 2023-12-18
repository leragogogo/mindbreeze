import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mindbreeze/ui/screen/res/app_assets.dart';
import 'package:mindbreeze/ui/screen/to_do_list.dart';
import 'package:mindbreeze/ui/screen/widgets/gradient_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final intialized = Future.delayed(const Duration(seconds: 4), () => true);
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animationController.repeat();
    _navigate();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.rotate(
              angle: _animationController.value * 2 * pi,
              child: Image.asset(
                AppAssets.splashAsset,
                color: null,
                width: 200,
                height: 200,
              ),
            );
          },
        ),
      )),
    );
  }

  void _navigate() async {
    if (await intialized) {
      if (context.mounted) {
        await Navigator.of(context).push(MaterialPageRoute<ToDoListScreen>(
          builder: (context) => const ToDoListScreen(),
        ));
      }
    }
  }
}
