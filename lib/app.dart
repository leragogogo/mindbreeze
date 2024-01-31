import 'package:flutter/material.dart';
import 'package:mindbreeze/data/store/incoming_tab_store.dart';
import 'package:mindbreeze/data/store/today_tab_store.dart';
import 'package:mindbreeze/ui/screen/splash_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  App({super.key});

  final TodayTabStore _todayTabStore = TodayTabStore();
  final IncomingTabStore _incomingTabStore = IncomingTabStore();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TodayTabStore>(create: (_) => _todayTabStore),
        Provider<IncomingTabStore>(create: (_) => _incomingTabStore),
      ],
      child: const MaterialApp(
        title: 'MINDBREEZE',
        home: SplashScreen(),
      ),
    );
  }
}
