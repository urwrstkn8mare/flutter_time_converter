import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          color: Colors.red,
          child: Text(
            "Search",
            style: TextStyle(
              fontWeight: FontWeight.w900 /* black */,
              fontSize: 50.0,
              color: Colors.black,
            ),
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}
