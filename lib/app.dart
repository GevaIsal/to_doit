import 'package:flutter/material.dart';
import 'package:to_doit/components/views/animation_route.dart';
import 'package:to_doit/modules/home/views/home_screen.dart';
import 'package:to_doit/modules/settings/views/settings_screen.dart';
import 'package:to_doit/modules/stadistics/views/stadistic_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To DoIt',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home_screen':
            return ChangingRoute(page: HomeScreen());
          case '/settings_screen':
            return ChangingRoute(page: SettingsScreen());
          case '/stadistic_screen':
            return ChangingRoute(page: StadisticScreen());
        }
        return null;
      },
      initialRoute: '/home_screen',
    );
  }
}
