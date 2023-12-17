import 'package:flutter/material.dart';
import 'package:mindbreeze/ui/screen/res/app_assets.dart';
import 'package:mindbreeze/ui/screen/res/app_colors.dart';
import 'package:mindbreeze/ui/screen/res/app_strings.dart';

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: _ToDoTitle(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ToDoTabBar(tabController: _tabController),
                _CalendarButton(),
              ],
            ),
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
        preferredSize: Size(3 * (MediaQuery.of(context).size.width / 4), 50),
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

class _CalendarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        width: 50,
        height: 50,
        child: Stack(children: [
          const Positioned(
            top: 5,
            left: 5,
            child: ImageIcon(
              AssetImage(
                AppAssets.calendarAsset,
              ),
              color: AppColors.textColor,
              size: 40,
            ),
          ),
          const Positioned(
            top: 17,
            left: 12,
            child: Text(
              AppStrings.calendarIconText,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.gradientStartColor),
            ),
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
