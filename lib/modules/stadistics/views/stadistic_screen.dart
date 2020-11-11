import 'package:flutter/material.dart';
import 'package:to_doit/components/views/bottom_app_bar.dart';

class StadisticScreen extends StatefulWidget {
  @override
  _StadisticScreenState createState() => _StadisticScreenState();
}

class _StadisticScreenState extends State<StadisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stadistics'),
      ),
      body: Center(
        child: Text('Stadistics Screen'),
      ),
      bottomNavigationBar: BottomAppBarMenu(active: true),
    );
  }
}
