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

  late final _$IncomingTabStoreBaseActionController =
      ActionController(name: 'IncomingTabStoreBase', context: context);

  @override
  void addToDo() {
    final _$actionInfo = _$IncomingTabStoreBaseActionController.startAction(
        name: 'IncomingTabStoreBase.addToDo');
    try {
      return super.addToDo();
    } finally {
      _$IncomingTabStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeToDo(int index, BuildContext context) {
    final _$actionInfo = _$IncomingTabStoreBaseActionController.startAction(
        name: 'IncomingTabStoreBase.removeToDo');
    try {
      return super.removeToDo(index, context);
    } finally {
      _$IncomingTabStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markToday(int index, BuildContext context) {
    final _$actionInfo = _$IncomingTabStoreBaseActionController.startAction(
        name: 'IncomingTabStoreBase.markToday');
    try {
      return super.markToday(index, context);
    } finally {
      _$IncomingTabStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markDone(int index) {
    final _$actionInfo = _$IncomingTabStoreBaseActionController.startAction(
        name: 'IncomingTabStoreBase.markDone');
    try {
      return super.markDone(index);
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
