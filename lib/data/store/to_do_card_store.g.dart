// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_card_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ToDoCardStore on ToDoCardStoreBase, Store {
  late final _$markTodayButtonOpacityAtom =
      Atom(name: 'ToDoCardStoreBase.markTodayButtonOpacity', context: context);

  @override
  double get markTodayButtonOpacity {
    _$markTodayButtonOpacityAtom.reportRead();
    return super.markTodayButtonOpacity;
  }

  @override
  set markTodayButtonOpacity(double value) {
    _$markTodayButtonOpacityAtom
        .reportWrite(value, super.markTodayButtonOpacity, () {
      super.markTodayButtonOpacity = value;
    });
  }

  late final _$ToDoCardStoreBaseActionController =
      ActionController(name: 'ToDoCardStoreBase', context: context);

  @override
  void changeMarkTodayButtonOpacity() {
    final _$actionInfo = _$ToDoCardStoreBaseActionController.startAction(
        name: 'ToDoCardStoreBase.changeMarkTodayButtonOpacity');
    try {
      return super.changeMarkTodayButtonOpacity();
    } finally {
      _$ToDoCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeMarkDoneButtonOpacity(int index, List<ToDoModel> toToModels) {
    final _$actionInfo = _$ToDoCardStoreBaseActionController.startAction(
        name: 'ToDoCardStoreBase.changeMarkDoneButtonOpacity');
    try {
      return super.changeMarkDoneButtonOpacity(index, toToModels);
    } finally {
      _$ToDoCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
markTodayButtonOpacity: ${markTodayButtonOpacity}
    ''';
  }
}
