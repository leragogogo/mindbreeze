
import 'package:flutter/material.dart';
import 'package:mindbreeze/ui/screen/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MINDBREEZE',
      home: SplashScreen(),
    );
  }
}