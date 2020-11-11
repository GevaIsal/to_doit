// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on _TodoStore, Store {
  final _$taskContentAtom = Atom(name: '_TodoStore.taskContent');

  @override
  String get taskContent {
    _$taskContentAtom.reportRead();
    return super.taskContent;
  }

  @override
  set taskContent(String value) {
    _$taskContentAtom.reportWrite(value, super.taskContent, () {
      super.taskContent = value;
    });
  }

  final _$isDoneAtom = Atom(name: '_TodoStore.isDone');

  @override
  bool get isDone {
    _$isDoneAtom.reportRead();
    return super.isDone;
  }

  @override
  set isDone(bool value) {
    _$isDoneAtom.reportWrite(value, super.isDone, () {
      super.isDone = value;
    });
  }

  final _$_TodoStoreActionController = ActionController(name: '_TodoStore');

  @override
  void setTaskContent(String taskContent) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.setTaskContent');
    try {
      return super.setTaskContent(taskContent);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTaskState(bool taskState) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.setTaskState');
    try {
      return super.setTaskState(taskState);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskContent: ${taskContent},
isDone: ${isDone}
    ''';
  }
}
