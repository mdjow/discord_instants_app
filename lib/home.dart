import 'package:flutter/material.dart';
import 'sounds/page.dart';

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        primaryColorDark: Colors.indigo,
        accentColor: Colors.indigoAccent,
        brightness: Brightness.dark,
        buttonColor: Colors.white30,
      ),
      title: "Discord Instants App",
      home: MySoundsPage(),
      routes: <String, WidgetBuilder>{
        "SOUNDS_PAGE": (BuildContext context) => MySoundsPage(),
      },
    );
  }
}
