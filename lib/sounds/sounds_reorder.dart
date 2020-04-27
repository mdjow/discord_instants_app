import "package:discord_instants_app/sounds/store.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";

import "model.dart";

class SoundsReorderPage extends StatefulWidget {
  SoundsReorderPage({this.sounds});

  final List<Sound> sounds;
  @override
  State<StatefulWidget> createState() => _SoundsReorderPageState();
}

class _SoundsReorderPageState extends State<SoundsReorderPage> {
  final _soundsStore = GetIt.I.get<SoundsStore>();

  List<Sound> sounds = [];

  @override
  void initState() {
    setState(() {
      sounds = [...widget.sounds];
    });

    super.initState();
  }

  void onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex--;
    }

    final row = sounds.removeAt(oldIndex);
    setState(() {
      sounds.insert(newIndex, row);
    });

    _soundsStore.setMySoundOrdem(newIndex, row);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ReorderableListView(
        onReorder: onReorder,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: List.generate(
          sounds.length,
          (index) => ListViewCard(index: index, key: Key("$index"), listItems: sounds),
        ),
      ),
    );
  }
}

class ListViewCard extends StatefulWidget {
  final int index;
  final Key key;
  final List<Sound> listItems;

  ListViewCard({this.listItems, this.index, this.key});

  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<ListViewCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      color: Theme.of(context).bottomAppBarColor,
      child: InkWell(
        splashColor: Colors.blue,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${widget.listItems[widget.index].title}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${widget.listItems[widget.index].desc}",
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.reorder,
                color: Colors.grey,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
