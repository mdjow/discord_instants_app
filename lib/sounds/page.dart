import "package:bubbled_navigation_bar/bubbled_navigation_bar.dart";
import "package:discord_instants_app/drawer/page.dart";
import "package:discord_instants_app/sounds/sounds_reorder.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get_it/get_it.dart";

import "add/page.dart";
import "sounds_list.dart";
import "store.dart";

class MySoundsPage extends StatefulWidget {
  final colors = [Colors.deepPurple, Colors.red, Colors.teal];

  final icons = [
    CupertinoIcons.double_music_note,
    CupertinoIcons.collections,
    CupertinoIcons.folder_open,
  ];
  @override
  State<StatefulWidget> createState() => _MySoundsPageState();
}

class _MySoundsPageState extends State<MySoundsPage> {
  final _soundsStore = GetIt.I.get<SoundsStore>();
  final TextEditingController _textEditController = new TextEditingController();

  PageController _pageController;
  MenuPositionController _menuPositionController;
  bool userPageDragging = false;

  @override
  void initState() {
    _soundsStore.init();
    _menuPositionController = MenuPositionController(initPosition: 0);

    _pageController = PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);
    _pageController.addListener(handlePageChange);

    super.initState();
  }

  void handlePageChange() {
    _menuPositionController.absolutePosition = _pageController.page;
  }

  bool checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification && scrollNotification.direction != ScrollDirection.idle) {
      userPageDragging = true;
    } else if (scrollNotification is ScrollEndNotification) {
      userPageDragging = false;
    }
    if (userPageDragging) {
      _menuPositionController.findNearestTarget(_pageController.page);
    }

    return userPageDragging;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Padding getIcon(int index, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Icon(widget.icons[index], size: 30, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerPage(),
      ),
      appBar: AppBar(
        actions: [
          Observer(
            builder: (_) => _soundsStore.currentTab == 0
                ? IconButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SoundsReorderPage(
                          sounds: _soundsStore.mySounds ?? [],
                        ),
                      ),
                    ),
                    icon: Icon(Icons.format_list_numbered),
                  )
                : Container(),
          ),
        ],
        title: TextField(
          controller: _textEditController,
          decoration: InputDecoration(
            hintText: "Buscar ...",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white30),
          ),
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          onChanged: _soundsStore.searchSound,
        ),
        backgroundColor: Theme.of(context).bottomAppBarColor,
      ),
      bottomNavigationBar: Observer(
        builder: (_) => BubbledNavigationBar(
          controller: _menuPositionController,
          initialIndex: 0,
          itemMargin: EdgeInsets.symmetric(horizontal: 8),
          backgroundColor: Theme.of(context).appBarTheme.color,
          defaultBubbleColor: Colors.indigo,
          onTap: (index) {
            _pageController.animateToPage(
              index,
              curve: Curves.easeInOutQuad,
              duration: Duration(
                milliseconds: 400,
              ),
            );
            _soundsStore.setTabSelected(index);
            _textEditController.clear();
          },
          items: _soundsStore.tabs.map((title) {
            var index = _soundsStore.tabs.indexOf(title);
            var color = widget.colors[index];
            return BubbledNavigationBarItem(
              icon: getIcon(index, color),
              activeIcon: getIcon(index, Colors.white),
              bubbleColor: color,
              title: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        height: 50.0,
        width: 50.0,
        child: FittedBox(
          child: Observer(
            builder: (_) => FloatingActionButton(
              backgroundColor: Theme.of(context).bottomAppBarColor,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddSoundPage()),
              ),
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) => checkUserDragging(scrollNotification),
        child: Observer(
          builder: (_) => PageView(
            controller: _pageController,
            children: [
              SoundsList(
                sounds: _soundsStore.mySounds,
                color: widget.colors[0],
                tab: 0,
              ),
              SoundsList(
                sounds: _soundsStore.communitySounds,
                color: widget.colors[1],
                tab: 1,
              ),
              SoundsList(
                sounds: _soundsStore.myIntantsSounds,
                color: widget.colors[2],
                tab: 2,
              )
            ],
            onPageChanged: (value) {
              _soundsStore.setTabSelected(value);
              _textEditController.clear();
            },
          ),
        ),
      ),
    );
  }
}
