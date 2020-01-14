import 'package:flutter/material.dart';

class CustomSpacedList extends StatelessWidget {
  final Widget spacer;
  final List<Widget> listOfWidgets;
  final double height;
  final ScrollController sc;

  CustomSpacedList({
    @required this.spacer,
    @required this.listOfWidgets,
    @required this.height,
    @required this.sc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ScrollConfiguration(
        behavior: NoGlowBehavior(),
        child: ListView.separated(
          controller: sc,
          padding: EdgeInsets.all(0),
          itemBuilder: (BuildContext context, int index) {
            if (index == (listOfWidgets.indexOf(listOfWidgets.last) + 1)) {
              return SizedBox();
            } else {
              return listOfWidgets[index];
            }
          },
          separatorBuilder: (BuildContext context, int index) => spacer,
          itemCount: listOfWidgets.length + 1,
        ),
      ),
    );
  }
}

class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return BouncingScrollPhysics();
  }
}
