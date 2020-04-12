import 'package:discord_instants_app/sounds/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'add/page.dart';
import 'model.dart';

class SoundItem extends StatelessWidget {
  final Color color;
  final Sound sound;

  SoundItem({this.color, this.sound});

  @override
  Widget build(BuildContext context) {
    final _soundsStore = GetIt.I.get<SoundsStore>();

    return RaisedButton(
      color: color,
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
        side: BorderSide(),
      ),
      onPressed: () =>
          _soundsStore.playing == sound.url ? _soundsStore.stopDiscord(sound.url) : _soundsStore.playDiscord(sound.url),
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
    );
  }
}
