import 'package:discord_instants_app/drawer/page.dart';
import 'package:discord_instants_app/login/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'model.dart';
import 'sound_item.dart';

class SoundsList extends StatelessWidget {
  final _loginStore = GetIt.I.get<LoginStore>();

  final Color color;
  final List<Sound> sounds;
  final int tab;

  SoundsList({this.tab, this.color, this.sounds});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (tab == 0 && !_loginStore.logged) {
        return Container(
          alignment: Alignment.center,
          child: signInGoogle(),
        );
      }

      if (sounds == null) {
        return Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        );
      }

      if (sounds.isEmpty) {
        return Container(
          alignment: Alignment.center,
          child: Text("Nenhum som encontrado"),
        );
      }

      return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(2),
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        crossAxisCount: 3,
        children: sounds.map((sound) => SoundItem(color: color, sound: sound)).toList(),
      );
    });
  }
}
