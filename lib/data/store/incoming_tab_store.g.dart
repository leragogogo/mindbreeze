// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incoming_tab_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IncomingTabStore on IncomingTabStoreBase, Store {
  late final _$toDosAtom =
      Atom(name: 'IncomingTabStoreBase.toDos', context: context);

  @override
  List<ToDoModel> get toDos {
    _$toDosAtom.reportRead();
    return super.toDos;
  }

  @override
  set toDos(List<ToDoModel> value) {
    _$toDosAtom.reportWrite(value, super.toDos, () {
      super.toDos = value;
    });
  }

  late final _$isEmptyAtom =
      Atom(name: 'IncomingTabStoreBase.isEmpty', context: context);

  @override
  bool get isEmpty {
    _$isEmptyAtom.reportRead();
    return super.isEmpty;
  }

  @override
  set isEmpty(bool value) {
    _$isEmptyAtom.reportWrite(value, super.isEmpty, () {
      super.isEmpty = value;
    });
  }

  late final _$addToDoAsyncAction =
      AsyncAction('IncomingTabStoreBase.addToDo', context: context);

  @override
  Future<void> addToDo() {
    return _$addToDoAsyncAction.run(() => super.addToDo());
  }

  late final _$removeToDoAsyncAction =
      AsyncAction('IncomingTabStoreBase.removeToDo', context: context);

  @override
  Future<void> removeToDo(Key key, BuildContext context) {
    return _$removeToDoAsyncAction.run(() => super.removeToDo(key, context));
  }

  late final _$markTodayAsyncAction =
      AsyncAction('IncomingTabStoreBase.markToday', context: context);

  @override
  Future<void> markToday(Key key, BuildContext context) {
    return _$markTodayAsyncAction.run(() => super.markToday(key, context));
  }

  late final _$markDoneAsyncAction =
      AsyncAction('IncomingTabStoreBase.markDone', context: context);

  @override
  Future<void> markDone(Key key) {
    return _$markDoneAsyncAction.run(() => super.markDone(key));
  }

  late final _$changeDescriptionAsyncAction =
      AsyncAction('IncomingTabStoreBase.changeDescription', context: context);

  @override
  Future<void> changeDescription(Key key, String description) {
    return _$changeDescriptionAsyncAction
        .run(() => super.changeDescription(key, description));
  }

  late final _$changeExcuseAsyncAction =
      AsyncAction('IncomingTabStoreBase.changeExcuse', context: context);

  @override
  Future<void> changeExcuse(Key key, String excuse) {
    return _$changeExcuseAsyncAction.run(() => super.changeExcuse(key, excuse));
  }

  late final _$changeMoodAsyncAction =
      AsyncAction('IncomingTabStoreBase.changeMood', context: context);

  @override
  Future<void> changeMood(Key key, String mood) {
    return _$changeMoodAsyncAction.run(() => super.changeMood(key, mood));
  }

  late final _$IncomingTabStoreBaseActionController =
      ActionController(name: 'IncomingTabStoreBase', context: context);

  @override
  void readToDos(SharedPreferences pref) {
    final _$actionInfo = _$IncomingTabStoreBaseActionController.startAction(
        name: 'IncomingTabStoreBase.readToDos');
    try {
      return super.readToDos(pref);
    } finally {
      _$IncomingTabStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
toDos: ${toDos},
isEmpty: ${isEmpty}
    ''';
  }
}
