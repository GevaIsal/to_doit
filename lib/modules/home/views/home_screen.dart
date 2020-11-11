import 'package:flutter/material.dart';
import 'package:to_doit/components/views/bottom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List taskAddedList = [];
  TextEditingController _taskContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To DoIt'),
        actions: [IconButton(icon: Icon(Icons.alarm_on), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Lunes 12 de Noviembre',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: todoList(),
            ),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBarMenu(active: true),
    );
  }

  List<Widget> todoList() {
    return List<Widget>.generate(
      taskAddedList.length,
      (index) {
        return Text(taskAddedList[index] ?? '');
      },
    );
  }

  Future<dynamic> dialogFill(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(
          'Add new task',
          textAlign: TextAlign.center,
        ),
        content: ListView(
          children: [
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              controller: _taskContentController,
            ),
            SizedBox(height: 10),
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now(),
              onDateChanged: (date) => print(date),
            ),
            SizedBox(height: 10),
          ],
        ),
        actions: [
          OutlineButton(
            child: Text('Cancel'),
            textColor: Colors.red,
            borderSide: BorderSide(color: Colors.red),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Add'),
            color: Colors.green,
            onPressed: () {
              setState(() {
                taskAddedList.add(_taskContentController.text);
                _taskContentController.clear();
              });

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
          onPressed: () => dialogFill(context),
        ),
      ),
    );
  }
}
