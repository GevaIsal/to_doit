import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_doit/app.dart';
import 'package:to_doit/modules/home/stores/todo_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(
    Provider<TodoListStore>(
      create: (_) => TodoListStore(),
      child: App(),
    ),
  );
}
