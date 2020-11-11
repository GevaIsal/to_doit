import 'package:flutter/material.dart';

class ChangingRoute extends PageRouteBuilder {
  final Widget page;
  ChangingRoute({this.page})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                page,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              var begin = Offset(-0.05, 0.0);
              var end = Offset.zero;
              var curve = Curves.slowMiddle;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            });
}
