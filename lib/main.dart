import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/services.dart';

import 'src/home.dart';

void main() => runApp(Main());

// class Main extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Time Converter',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Home(),
//     );
//   }
// }

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with WidgetsBindingObserver {
  bool _useWhiteStatusBarForeground;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (_useWhiteStatusBarForeground != null) {
        FlutterStatusbarcolor.setStatusBarWhiteForeground(
            _useWhiteStatusBarForeground);
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  changeStatusColour(Color color, {bool useWhiteStatusBarForeground}) async {
    try {
      await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
      if (useWhiteStatusBarForeground == null) {
        _useWhiteStatusBarForeground = useWhiteForeground(color);
      } else {
        _useWhiteStatusBarForeground = useWhiteStatusBarForeground;
      }
      FlutterStatusbarcolor.setStatusBarWhiteForeground(
          _useWhiteStatusBarForeground);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColour(Colors.transparent);
    return MaterialApp(
      title: 'Time Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(changeStatusColour),
    );
  }
}
