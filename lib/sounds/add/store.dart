import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discord_instants_app/login/store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../model.dart';

part 'store.g.dart';

class AddSoundStore = _AddSoundStoreBase with _$AddSoundStore;

abstract class _AddSoundStoreBase with Store {
  final _fireStore = GetIt.I.get<Firestore>();
  final _loginStore = GetIt.I.get<LoginStore>();

  @observable
  String name;

  @observable
  String desc;

  @observable
  String soundLink;

  @action
  void setName(value) => name = value;

  @action
  void setDesc(value) => desc = value;

  @action
  void setSoundLink(value) => soundLink = value;

  @action
  void addSound() {
    if (!_loginStore.logged) {
      return;
    }

    final model = {
      "title": name,
      "desc": desc,
      "url": soundLink,
    };

    final ref = _fireStore.collection("sounds").document();
    ref.setData({"id": ref.documentID, ...model});

    final mySoundRef = _fireStore
        .collection("user")
        .document(
          _loginStore.user.uid,
        )
        .collection("sounds")
        .document();

    mySoundRef.setData({...model, "ref": ref, "id": mySoundRef.documentID});
  }

  @action
  void editSound(Sound sound) {
    if (!_loginStore.logged) {
      return;
    }

    final model = {
      "title": name,
      "desc": desc,
      "url": soundLink,
    };

    sound.ref.updateData(model);

    final ref = _fireStore
        .collection("user")
        .document(
          _loginStore.user.uid,
        )
        .collection("sounds")
        .document(sound.documentID);
    ref.updateData(model);
  }
}
