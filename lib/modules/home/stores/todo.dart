import 'package:mobx/mobx.dart';

part 'todo.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  @observable
  String taskContent = '';

  @observable
  bool isDone = false;

  @action
  void setTaskContent(String taskContent) {
    this.taskContent = taskContent;
  }

  @action
  setTaskState(bool taskState) {
    this.isDone = !isDone;
  }
}
