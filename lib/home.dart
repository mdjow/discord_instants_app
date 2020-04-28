import "package:flutter/material.dart";
import "package:get_it/get_it.dart";

import "sounds/page.dart";
import "store.dart";

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    final _mainStore = GetIt.I.get<MainStore>();

    _mainStore.getApi();

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
