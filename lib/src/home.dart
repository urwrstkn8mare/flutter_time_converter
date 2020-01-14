import 'package:flutter/material.dart';
import 'package:flutter_time_converter/src/search/searchPage.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'body/body.dart';
import 'global_widgets/customFab.dart';
import 'panel/panel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double _initFabHeight = 113.0 + 25.0;
  double _fabHeight;
  double _panelHeightOpen = 575.0;
  double _panelHeightClosed = 113.0;
  PanelController _pc = new PanelController();
  double _panelPosition = 0.0;
  ScrollController _sc = new ScrollController();

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    _panelHeightOpen = deviceHeight - 170;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            panel: Panel(_panelHeightOpen, _sc),
            body: Body(),
            minHeight: _panelHeightClosed,
            maxHeight: _panelHeightOpen,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(0, -1),
                color: Colors.black.withOpacity(0.3),
              ),
            ],
            parallaxEnabled: true,
            parallaxOffset: .5,
            onPanelSlide: (double pos) => setState(() {
              _panelPosition = pos;
              _fabHeight =
                  _panelPosition * (_panelHeightOpen - _panelHeightClosed) +
                      _initFabHeight;
            }),
            controller: _pc,
            onPanelClosed: () {
              _sc.animateTo(
                0,
                duration: Duration(milliseconds: (0.1 * 1000).toInt()),
                curve: Curves.easeOut,
              );
            },
          ),
          // The FABs (Floating Action Buttons)
          Positioned(
            right: 20.0 + (_panelPosition * (30.0 + 25.0 + 25.0)),
            bottom: _fabHeight,
            child: CustomFab(
              icon: Icons.navigation,
              heroTag: "locationFab",
            ),
          ),
          Positioned(
            right: 20.0,
            bottom:
                _fabHeight + ((1.0 - _panelPosition) * (30.0 + 25.0 + 25.0)),
            child: CustomFab(
              icon: Icons.search,
              heroTag: "searchFab",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
