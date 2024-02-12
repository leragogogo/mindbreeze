import 'package:flutter/material.dart';
import 'package:mindbreeze/data/store/incoming_tab_store.dart';
import 'package:mindbreeze/data/store/today_tab_store.dart';
import 'package:mindbreeze/ui/res/app_colors.dart';
import 'package:mindbreeze/ui/res/app_strings.dart';
import 'package:mindbreeze/ui/widgets/gradient_background.dart';
import 'package:mindbreeze/ui/widgets/incoming_tab.dart';
import 'package:mindbreeze/ui/widgets/today_tab.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Provider.of<TodayTabStore>(context, listen: false).controller =
        AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    Provider.of<IncomingTabStore>(context, listen: false).controller =
        AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    Provider.of<TodayTabStore>(_scaffoldKey.currentContext ?? context,
            listen: false)
        .controller
        .dispose();
    Provider.of<IncomingTabStore>(_scaffoldKey.currentContext ?? context,
            listen: false)
        .controller
        .dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 50,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: _ToDoTitle(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: _ToDoTabBar(tabController: _tabController),
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            IncomingTab(
              scaffoldKey: _scaffoldKey,
            ),
            TodayTab(
              scaffoldKey: _scaffoldKey,
            ),
          ],
        ),
      ),
    );
  }
}

class _ToDoTab extends StatelessWidget {
  final String text;

  const _ToDoTab({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: 32,
      ),
    );
  }
}

class _ToDoTabBar extends StatelessWidget {
  final TabController tabController;

  const _ToDoTabBar({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: PreferredSize(
        preferredSize:
            Size.fromWidth(3 * (MediaQuery.of(context).size.width / 4)),
        child: TabBar(
          labelPadding: const EdgeInsets.only(left: 16),
          isScrollable: true,
          splashBorderRadius: BorderRadius.circular(16),
          tabAlignment: TabAlignment.start,
          controller: tabController,
          unselectedLabelColor: AppColors.unselectedTabColor,
          labelColor: AppColors.textColor,
          indicatorColor: Colors.transparent,
          indicator: null,
          automaticIndicatorColorAdjustment: false,
          tabs: const [
            _ToDoTab(text: AppStrings.incomingTabText),
            _ToDoTab(text: AppStrings.todayTabText),
          ],
        ),
      ),
    );
  }
}

class _ToDoTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        alignment: Alignment.bottomLeft,
        child: const Text(
          AppStrings.toDoTitleText,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }
}
