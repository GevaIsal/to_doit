import 'package:flutter/material.dart';
import 'package:to_doit/components/views/bottom_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Screen'),
      ),
      bottomNavigationBar: BottomAppBarMenu(active: CurrentPage.settings),
    );
  }
}
