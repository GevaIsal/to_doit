import 'package:flutter/material.dart';

class BottomAppBarMenu extends StatefulWidget {
  final bool active;
  BottomAppBarMenu({Key key, this.active}) : super(key: key);

  @override
  _BottomAppBarMenuState createState() => _BottomAppBarMenuState();
}

class _BottomAppBarMenuState extends State<BottomAppBarMenu> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 75,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.stacked_bar_chart,
                color: widget.active ? Colors.green : Colors.blueGrey,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  Navigator.of(context)
                      .pushReplacementNamed('/stadistic_screen');
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.home,
                color: widget.active ? Colors.green : Colors.blueGrey,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushReplacementNamed('/home_screen');
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: widget.active ? Colors.green : Colors.blueGrey,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  Navigator.of(context)
                      .pushReplacementNamed('/settings_screen');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
