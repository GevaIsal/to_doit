import 'package:mobx/mobx.dart';
import 'package:to_doit/modules/home/stores/todo.dart';

part 'todo_list.g.dart';

enum VisibilityState { all, pending, completed }

class TodoListStore = _TodoListStore with _$TodoListStore;

abstract class _TodoListStore with Store {
  @observable
  ObservableList<TodoStore> todos = ObservableList<TodoStore>();

  @observable
  VisibilityState state = VisibilityState.all;

  @computed
  ObservableList<TodoStore> get pendingTodoList => ObservableList.of(
        todos.where(
          (todo) => todo.isDone == false,
        ),
      );

  @computed
  ObservableList<TodoStore> get completedTodoList => ObservableList.of(
        todos.where(
          (todo) => todo.isDone == true,
        ),
      );

  @computed
  bool get hasCompletedTodos => completedTodoList.isNotEmpty;

  @computed
  bool get hasPendingTodos => pendingTodoList.isNotEmpty;

  @computed
  ObservableList<TodoStore> get visibleTodos {
    switch (state) {
      case VisibilityState.pending:
        return pendingTodoList;
      case VisibilityState.completed:
        return completedTodoList;
      default:
        return todos;
    }
  }

  @computed
  bool get canCheckAllCompleted =>
      hasPendingTodos && state != VisibilityState.completed;

  @action
  void addTodo(String taskContent) {
    final _todo = TodoStore(taskContent);
    todos.add(_todo);
  }

  @action
  void removeTodo(TodoStore todo) {
    todos.removeWhere((element) => element == todo);
  }

  @action
  void changeState(VisibilityState state) => this.state = state;

  @action
  void checkAllAsCompleted() {
    for (var todo in todos) {
      todo.isDone = true;
    }
  }
}
