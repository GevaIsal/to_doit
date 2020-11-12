// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoListStore on _TodoListStore, Store {
  Computed<ObservableList<TodoStore>> _$pendingTodoListComputed;

  @override
  ObservableList<TodoStore> get pendingTodoList =>
      (_$pendingTodoListComputed ??= Computed<ObservableList<TodoStore>>(
              () => super.pendingTodoList,
              name: '_TodoListStore.pendingTodoList'))
          .value;
  Computed<ObservableList<TodoStore>> _$completedTodoListComputed;

  @override
  ObservableList<TodoStore> get completedTodoList =>
      (_$completedTodoListComputed ??= Computed<ObservableList<TodoStore>>(
              () => super.completedTodoList,
              name: '_TodoListStore.completedTodoList'))
          .value;
  Computed<bool> _$hasCompletedTodosComputed;

  @override
  bool get hasCompletedTodos => (_$hasCompletedTodosComputed ??= Computed<bool>(
          () => super.hasCompletedTodos,
          name: '_TodoListStore.hasCompletedTodos'))
      .value;
  Computed<bool> _$hasPendingTodosComputed;

  @override
  bool get hasPendingTodos =>
      (_$hasPendingTodosComputed ??= Computed<bool>(() => super.hasPendingTodos,
              name: '_TodoListStore.hasPendingTodos'))
          .value;
  Computed<ObservableList<TodoStore>> _$visibleTodosComputed;

  @override
  ObservableList<TodoStore> get visibleTodos => (_$visibleTodosComputed ??=
          Computed<ObservableList<TodoStore>>(() => super.visibleTodos,
              name: '_TodoListStore.visibleTodos'))
      .value;
  Computed<bool> _$canCheckAllCompletedComputed;

  @override
  bool get canCheckAllCompleted => (_$canCheckAllCompletedComputed ??=
          Computed<bool>(() => super.canCheckAllCompleted,
              name: '_TodoListStore.canCheckAllCompleted'))
      .value;

  final _$todosAtom = Atom(name: '_TodoListStore.todos');

  @override
  ObservableList<TodoStore> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<TodoStore> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  final _$stateAtom = Atom(name: '_TodoListStore.state');

  @override
  VisibilityState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(VisibilityState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_TodoListStoreActionController =
      ActionController(name: '_TodoListStore');

  @override
  void addTodo(String taskContent) {
    final _$actionInfo = _$_TodoListStoreActionController.startAction(
        name: '_TodoListStore.addTodo');
    try {
      return super.addTodo(taskContent);
    } finally {
      _$_TodoListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(TodoStore todo) {
    final _$actionInfo = _$_TodoListStoreActionController.startAction(
        name: '_TodoListStore.removeTodo');
    try {
      return super.removeTodo(todo);
    } finally {
      _$_TodoListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeState(VisibilityState state) {
    final _$actionInfo = _$_TodoListStoreActionController.startAction(
        name: '_TodoListStore.changeState');
    try {
      return super.changeState(state);
    } finally {
      _$_TodoListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkAllAsCompleted() {
    final _$actionInfo = _$_TodoListStoreActionController.startAction(
        name: '_TodoListStore.checkAllAsCompleted');
    try {
      return super.checkAllAsCompleted();
    } finally {
      _$_TodoListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
state: ${state},
pendingTodoList: ${pendingTodoList},
completedTodoList: ${completedTodoList},
hasCompletedTodos: ${hasCompletedTodos},
hasPendingTodos: ${hasPendingTodos},
visibleTodos: ${visibleTodos},
canCheckAllCompleted: ${canCheckAllCompleted}
    ''';
  }
}
