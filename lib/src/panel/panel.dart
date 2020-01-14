import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'timeWidget.dart';
import '../global_widgets/customSpacedList.dart';

class Panel extends StatelessWidget {
  final double _openHeight;
  final ScrollController _sc;

  Panel(this._openHeight, this._sc);

  @override
  Widget build(BuildContext context) {
    List<TimeWidget> items = [];
    for (int i = 0; i < 10; i++) {
      items.add(
        TimeWidget(
          icon: Icons.navigation,
          timeZoneIndentifier: "Sydney/Australia",
          timeString: "10:20",
          isPM: true,
          dayString: "Thursday, 39th December",
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 12.0,
        ),
        // The Panel's Handle
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
          ],
        ),
        SizedBox(
          height: 12.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Times",
                style: TextStyle(
                  fontWeight: FontWeight.w900 /* black */,
                  fontSize: 36.0,
                ),
              ),
              Text(
                "FROM YOUR SELECTIONS",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                  fontSize: 14.0,
                ),
              ),
              Container(
                height: 15.0,
              ),
              CustomSpacedList(
                height: _openHeight - 12 - 5 - 12 - 36 - 14 - 14 - 15,
                spacer: SizedBox(height: 20),
                listOfWidgets: items,
                sc: _sc,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
