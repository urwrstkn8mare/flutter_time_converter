import 'package:flutter/material.dart';

class CustomFab extends StatefulWidget {
  final IconData icon;
  final Function onPressed;
  final String heroTag;

  CustomFab({@required this.icon, @required this.heroTag, this.onPressed});

  @override
  _CustomFabState createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> {
  Function onPressed;

  @override
  void initState() {
    super.initState();

    onPressed = (onPressed == widget.onPressed) ? () {} : widget.onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        widget.icon,
        color: Theme.of(context).primaryColor,
        size: 30,
      ),
      onPressed: onPressed,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      heroTag: widget.heroTag,
    );
  }
}
