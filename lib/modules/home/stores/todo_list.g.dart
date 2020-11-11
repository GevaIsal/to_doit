// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoListStore on _TodoListStore, Store {
  final _$comletedTasksAtom = Atom(name: '_TodoListStore.comletedTasks');

  @override
  List<TodoStore> get comletedTasks {
    _$comletedTasksAtom.reportRead();
    return super.comletedTasks;
  }

  @override
  set comletedTasks(List<TodoStore> value) {
    _$comletedTasksAtom.reportWrite(value, super.comletedTasks, () {
      super.comletedTasks = value;
    });
  }

  final _$uncompletedTasksAtom = Atom(name: '_TodoListStore.uncompletedTasks');

  @override
  List<TodoStore> get uncompletedTasks {
    _$uncompletedTasksAtom.reportRead();
    return super.uncompletedTasks;
  }

  @override
  set uncompletedTasks(List<TodoStore> value) {
    _$uncompletedTasksAtom.reportWrite(value, super.uncompletedTasks, () {
      super.uncompletedTasks = value;
    });
  }

  final _$_TodoListStoreActionController =
      ActionController(name: '_TodoListStore');

  @override
  void addToCompletedTasks() {
    final _$actionInfo = _$_TodoListStoreActionController.startAction(
        name: '_TodoListStore.addToCompletedTasks');
    try {
      return super.addToCompletedTasks();
    } finally {
      _$_TodoListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToUnCompletedTasks() {
    final _$actionInfo = _$_TodoListStoreActionController.startAction(
        name: '_TodoListStore.addToUnCompletedTasks');
    try {
      return super.addToUnCompletedTasks();
    } finally {
      _$_TodoListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
comletedTasks: ${comletedTasks},
uncompletedTasks: ${uncompletedTasks}
    ''';
  }
}
