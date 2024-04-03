// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_tab_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodayTabStore on TodayTabStoreBase, Store {
  late final _$toDosAtom =
      Atom(name: 'TodayTabStoreBase.toDos', context: context);

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
      Atom(name: 'TodayTabStoreBase.isEmpty', context: context);

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
      AsyncAction('TodayTabStoreBase.addToDo', context: context);

  @override
  Future<void> addToDo(ToDoModel toDo) {
    return _$addToDoAsyncAction.run(() => super.addToDo(toDo));
  }

  late final _$removeToDoAsyncAction =
      AsyncAction('TodayTabStoreBase.removeToDo', context: context);

  @override
  Future<void> markDone(Key key) {
    return _$removeToDoAsyncAction.run(() => super.markDone(key));
  }

  late final _$TodayTabStoreBaseActionController =
      ActionController(name: 'TodayTabStoreBase', context: context);

  @override
  void readToDos(SharedPreferences pref) {
    final _$actionInfo = _$TodayTabStoreBaseActionController.startAction(
        name: 'TodayTabStoreBase.readToDos');
    try {
      return super.readToDos(pref);
    } finally {
      _$TodayTabStoreBaseActionController.endAction(_$actionInfo);
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
