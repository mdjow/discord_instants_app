import 'package:flutter/material.dart';
import 'sounds/page.dart';

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        accentColor: Colors.blueGrey,
      ),
      title: "Discord Instants App",
      home: MySoundsPage(),
      routes: <String, WidgetBuilder>{
        "SOUNDS_PAGE": (BuildContext context) => MySoundsPage(),
      },
    );
  }
}
