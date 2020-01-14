import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'src/home.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   systemNavigationBarColor: Colors.grey[200],
    //   systemNavigationBarIconBrightness: Brightness.dark,
    //   systemNavigationBarDividerColor: Colors.black,
    // ));

    return MaterialApp(
      title: 'Time Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
