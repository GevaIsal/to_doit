import 'package:mobx/mobx.dart';
import 'package:to_doit/modules/home/stores/todo.dart';

part 'todo_list.g.dart';

class TodoListStore = _TodoListStore with _$TodoListStore;

abstract class _TodoListStore with Store {
  @observable
  List<TodoStore> comletedTasks = [];

  @observable
  List<TodoStore> uncompletedTasks = [];

  @action
  void addToCompletedTasks() {}

  @action
  void addToUnCompletedTasks() {}
}
