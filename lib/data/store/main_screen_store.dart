import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'main_screen_store.g.dart';

class MainScreenStore = MainScreenStoreBase with _$MainScreenStore;

abstract class MainScreenStoreBase with Store {
  @observable
  int currentTab = 0;

  @observable
  bool isCalendarPushed = false;

  @observable
  late TabController tabController;

  @action
  void handleTabSelection() {
    currentTab = tabController.index;
    if (currentTab == 1) {
      isCalendarPushed = false;
    }
  }

  @action
  void clickCalendarButton() {
    isCalendarPushed = !isCalendarPushed;
  }
}
