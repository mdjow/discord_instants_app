import 'package:discord_instants_app/drawer/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'add/page.dart';
import 'store.dart';

class MySoundsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MySoundsPageState();
}

class _MySoundsPageState extends State<MySoundsPage> {
  final _soundsStore = GetIt.I.get<SoundsStore>();

  int currentTab = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: DrawerPage(),
      ),
      appBar: AppBar(),
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.queue_music),
              title: Text("Meus Sons"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              title: Text("Sons da comunidade"),
            ),
          ],
          currentIndex: currentTab,
          selectedItemColor: Theme.of(context).accentColor,
          onTap: (value) {
            _soundsStore.setTabSelected(value);
            setState(() {
              currentTab = value;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddSoundPage()),
        ),
        child: const Icon(Icons.add),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      ),
      body: Observer(
        builder: (_) => GridView.count(
          primary: false,
          padding: const EdgeInsets.all(2),
          crossAxisSpacing: 2,
          mainAxisSpacing: 1,
          crossAxisCount: 3,
          children: _soundsStore.sounds
              .map(
                (sound) => RaisedButton(
                  onLongPress: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddSoundPage(
                        sound: sound,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: () => _soundsStore.playing == sound.url
                      ? _soundsStore.stopDiscord(sound.url)
                      : _soundsStore.playDiscord(sound.url),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          sound.title.toUpperCase(),
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Observer(
                        builder: (_) => _soundsStore.playing == sound.url
                            ? Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.stop,
                                  size: 40,
                                ),
                              )
                            : Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 40,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
