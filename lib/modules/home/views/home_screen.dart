import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:to_doit/components/views/bottom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:to_doit/modules/home/stores/todo.dart';
import 'package:to_doit/modules/home/stores/todo_list.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:numberpicker/numberpicker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

void alarmSetterTest() {
  print('Hello World!');
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentHour = 0;
  int _currentMinute = 0;
  int _currentSecond = 0;
  List taskAddedList = [];
  TextEditingController _taskTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.flag),
        title: Text(
          'To DoIt',
          style: TextStyle(
            fontFamily: 'Arial',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBarMenu(active: CurrentPage.home),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 5.0,
            margin: EdgeInsets.zero,
            child: Container(
              color: Colors.green[200],
              padding: EdgeInsets.all(10),
              child: Text(
                'November 11th',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          buildTodoDescription(context),
          buildTodoList(context),
        ],
      ),
    );
  }

  Widget buildTodoDescription(BuildContext context) {
    final listStore = context.watch<TodoListStore>();
    String description = '';

    if (listStore.todos.isEmpty) {
      description = 'Therere no Todos/Taks added here';
    } else {
      description = listStore.todos.length == 1
          ? 'You have ${listStore.todos.length} Todo'
          : 'You have ${listStore.todos.length} Todos';
    }

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    );
  }

  Widget buildTodoList(BuildContext context) {
    final listStore = context.watch<TodoListStore>();

    return Observer(
      builder: (_) {
        return Flexible(
          child: ListView.builder(
            itemCount: listStore.visibleTodos.length,
            itemBuilder: (BuildContext _, int index) {
              final _todo = listStore.visibleTodos[index];
              return buildSwipeTodo(_todo);
            },
          ),
        );
      },
    );
  }

  Widget buildSwipeTodo(TodoStore _todo) {
    final listStore = context.read<TodoListStore>();

    return Observer(
      builder: (_) => SwipeActionCell(
        key: ObjectKey(_todo),
        performsFirstActionWithFullSwipe: true,
        trailingActions: <SwipeAction>[
          SwipeAction(
            title: 'Delete',
            onTap: (CompletionHandler handler) async {
              await handler(true);
              setState(() {
                listStore.removeTodo(_todo);
              });
            },
            color: Colors.red,
          ),
        ],
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.8),
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: _todo.isDone,
            onChanged: (bool changeValue) {
              _todo.isDone = changeValue;
            },
            title: Text(
              _todo.taskContent,
              maxLines: 2,
              style: TextStyle(
                fontSize: 16.0,
                color: _todo.isDone ? Colors.grey[600] : Colors.blueGrey[900],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildAddTodo(BuildContext context) {
    final listStore = context.read<TodoListStore>();

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(
          'Add new Todo',
          textAlign: TextAlign.center,
        ),
        content: Container(
          height: 250,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Todo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Add a todo',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    contentPadding: EdgeInsets.all(8.0),
                    prefixIcon: Icon(Icons.text_rotation_none),
                  ),
                  controller: _taskTextController,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 20),
                Text(
                  'Alarm',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: NumberPicker.integer(
                        initialValue: _currentHour,
                        minValue: 0,
                        maxValue: 24,
                        onChanged: (newHour) {
                          setState(() {
                            _currentHour = newHour;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: NumberPicker.integer(
                        initialValue: _currentMinute,
                        minValue: 0,
                        maxValue: 59,
                        onChanged: (newMinute) {
                          setState(() {
                            _currentMinute = newMinute;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: NumberPicker.integer(
                        initialValue: _currentSecond,
                        minValue: 0,
                        maxValue: 59,
                        onChanged: (newSecond) {
                          setState(() {
                            _currentSecond = newSecond;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        actions: [
          OutlineButton(
            child: Text('Cancel'),
            textColor: Colors.red,
            borderSide: BorderSide(color: Colors.red),
            onPressed: () {
              setState(() {
                _taskTextController.clear();
              });
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Add'),
            color: Colors.green,
            onPressed: () {
              setState(() {
                listStore.addTodo(_taskTextController.text);
                _taskTextController.clear();
              });
              AndroidAlarmManager.periodic(
                Duration(
                  seconds: (_currentSecond +
                      _currentMinute * 60 +
                      _currentHour * 360),
                ),
                (_currentSecond + _currentMinute + _currentHour + 1),
                alarmSetterTest,
              );
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Container floatingActionButton() {
    return Container(
      child: FittedBox(
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => buildAddTodo(context),
        ),
      ),
    );
  }
}
