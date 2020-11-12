import 'package:mobx/mobx.dart';

part 'todo.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  _TodoStore(this.taskContent);

  @observable
  String taskContent = '';

  @observable
  bool isDone = false;
}
