// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainScreenStore on MainScreenStoreBase, Store {
  late final _$currentTabAtom =
      Atom(name: 'MainScreenStoreBase.currentTab', context: context);

  @override
  int get currentTab {
    _$currentTabAtom.reportRead();
    return super.currentTab;
  }

  @override
  set currentTab(int value) {
    _$currentTabAtom.reportWrite(value, super.currentTab, () {
      super.currentTab = value;
    });
  }

  late final _$isCalendarPushedAtom =
      Atom(name: 'MainScreenStoreBase.isCalendarPushed', context: context);

  @override
  bool get isCalendarPushed {
    _$isCalendarPushedAtom.reportRead();
    return super.isCalendarPushed;
  }

  @override
  set isCalendarPushed(bool value) {
    _$isCalendarPushedAtom.reportWrite(value, super.isCalendarPushed, () {
      super.isCalendarPushed = value;
    });
  }

  late final _$tabControllerAtom =
      Atom(name: 'MainScreenStoreBase.tabController', context: context);

  @override
  TabController get tabController {
    _$tabControllerAtom.reportRead();
    return super.tabController;
  }

  bool _tabControllerIsInitialized = false;

  @override
  set tabController(TabController value) {
    _$tabControllerAtom.reportWrite(
        value, _tabControllerIsInitialized ? super.tabController : null, () {
      super.tabController = value;
      _tabControllerIsInitialized = true;
    });
  }

  late final _$MainScreenStoreBaseActionController =
      ActionController(name: 'MainScreenStoreBase', context: context);

  @override
  void handleTabSelection() {
    final _$actionInfo = _$MainScreenStoreBaseActionController.startAction(
        name: 'MainScreenStoreBase.handleTabSelection');
    try {
      return super.handleTabSelection();
    } finally {
      _$MainScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clickCalendarButton() {
    final _$actionInfo = _$MainScreenStoreBaseActionController.startAction(
        name: 'MainScreenStoreBase.clickCalendarButton');
    try {
      return super.clickCalendarButton();
    } finally {
      _$MainScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTab: ${currentTab},
isCalendarPushed: ${isCalendarPushed},
tabController: ${tabController}
    ''';
  }
}
