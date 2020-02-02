import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;
  CustomPageRoute({this.page})
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
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInExpo,
              reverseCurve: Curves.easeOutExpo,
            )),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20 * animation.value),
                topRight: Radius.circular(20 * animation.value),
              ),
              child: child,
            ),
          ),
        );
}
