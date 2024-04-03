import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'main_screen_store.g.dart';

// Store of MainScreen.
class MainScreenStore = MainScreenStoreBase with _$MainScreenStore;

abstract class MainScreenStoreBase with Store {
  @observable
  int currentTab = 0;

  // state of CalendarButton.
  @observable
  bool isCalendarPushed = false;

  @observable
  late TabController tabController;

  // change a current tab
  @action
  void handleTabSelection() {
    currentTab = tabController.index;
    if (currentTab == 1) {
      // if user change tab calendar button should be unpushed.
      isCalendarPushed = false;
    }
  }

  @action
  void clickCalendarButton() {
    isCalendarPushed = !isCalendarPushed;
  }
}
