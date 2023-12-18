import 'package:flutter/material.dart';
import 'package:mindbreeze/ui/screen/res/app_colors.dart';
import 'package:mindbreeze/ui/screen/res/app_strings.dart';
import 'package:mindbreeze/ui/screen/widgets/gradient_background.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});
  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: _ToDoTitle(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: _ToDoTabBar(tabController: _tabController)),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            Scaffold(
              backgroundColor: Colors.transparent,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
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
            Size.fromWidth(3 * (MediaQuery.of(context).size.width / 4)), //50),
        child: TabBar(
          isScrollable: true,
          splashBorderRadius: BorderRadius.circular(16),
          tabAlignment: TabAlignment.start,
          controller: tabController,
          unselectedLabelColor: AppColors.unselectedTabColor,
          labelColor: AppColors.textColor,
          indicatorColor: Colors.transparent,
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
    return const Padding(
      padding: EdgeInsets.only(left: 32, top: 90),
      child: Text(
        AppStrings.toDoTitleText,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
      ),
    );
  }
}