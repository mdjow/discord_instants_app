import "package:discord_instants_app/sounds/store.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get_it/get_it.dart";

import "add/page.dart";
import "model.dart";

class SoundItem extends StatelessWidget {
  final Color color;
  final Sound sound;

  SoundItem({this.color, this.sound});

  @override
  Widget build(BuildContext context) {
    final _soundsStore = GetIt.I.get<SoundsStore>();

    return RaisedButton(
      // color: color,
      color: Theme.of(context).cardColor,
      onPressed: () => Navigator.push(
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
      textColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            sound.title.toUpperCase(),
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Observer(
                  builder: (_) => _soundsStore.playing == sound.url
                      ? IconButton(
                          color: Colors.red,
                          iconSize: 30,
                          icon: Icon(
                            Icons.stop,
                          ),
                          onPressed: () => _soundsStore.stopDiscord(sound),
                        )
                      : IconButton(
                          iconSize: 30,
                          color: Colors.deepPurpleAccent,
                          icon: Icon(
                            Icons.send,
                          ),
                          onPressed: () => _soundsStore.playDiscord(sound),
                        ),
                ),
              ),
              Observer(
                builder: (_) => _soundsStore.localPlaying == sound.url
                    ? IconButton(
                        color: Colors.red,
                        iconSize: 30,
                        icon: Icon(
                          Icons.stop,
                        ),
                        onPressed: () => _soundsStore.stopLocalSound(),
                      )
                    : IconButton(
                        iconSize: 30,
                        color: Colors.green,
                        icon: Icon(
                          Icons.play_circle_outline,
                        ),
                        onPressed: () => _soundsStore.playLocalSound(sound.url),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
