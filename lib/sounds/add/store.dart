import "package:cloud_firestore/cloud_firestore.dart";
import "package:discord_instants_app/login/store.dart";
import "package:get_it/get_it.dart";
import "package:mobx/mobx.dart";

import "../model.dart";
import "../store.dart";

part "store.g.dart";

class AddSoundStore = _AddSoundStoreBase with _$AddSoundStore;

abstract class _AddSoundStoreBase with Store {
  final _fireStore = GetIt.I.get<Firestore>();
  final _loginStore = GetIt.I.get<LoginStore>();
  final _soundStore = GetIt.I.get<SoundsStore>();

  @observable
  String name;

  @observable
  String desc;

  @observable
  String soundLink;

  @observable
  bool favor;

  @observable
  bool public = true;

  @observable
  bool favorIsBusy = false;

  @action
  void setPublic(value) => public = value;

  @action
  void setName(value) => name = value;

  @action
  void setDesc(value) => desc = value;

  @action
  void setSoundLink(value) => soundLink = value;

  @action
  void setFavor(DocumentReference ref) {
    if (ref == null) {
      favor = false;
      return;
    }
    var exist = _soundStore.mySounds.firstWhere((sound) => sound?.ref == ref, orElse: () => null);
    favor = exist == null ? false : true;
  }

  @action
  void addSound() {
    if (!_loginStore.logged) {
      return;
    }

    final model = {
      "title": name,
      "desc": desc,
      "url": soundLink,
      "private": !public,
    };

    var ref;
    if (public) {
      ref = _fireStore.collection("sounds").document();
      ref.setData({"id": ref.documentID, ...model});
    }

    final mySoundRef = _fireStore
        .collection("user")
        .document(
          _loginStore.user.uid,
        )
        .collection("sounds")
        .document();

    mySoundRef.setData({
      ...model,
      "ref": ref,
      "id": mySoundRef.documentID,
      "order": 0,
    });
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
      "private": !public,
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

  @action
  Future<void> favorSound(Sound sound) async {
    if (!_loginStore.logged || favorIsBusy) {
      return;
    }

    favorIsBusy = true;

    final model = {
      "title": name,
      "desc": desc,
      "url": soundLink,
      "private": !public,
    };

    final ref = _fireStore
        .collection("user")
        .document(
          _loginStore.user.uid,
        )
        .collection("sounds")
        .document();

    await ref.setData({
      ...model,
      "id": ref.documentID,
      "ref": sound.ref ?? ref,
      "order": 0,
    });

    favorIsBusy = false;

    setFavor(sound.ref ?? ref);
  }

  @action
  Future<void> disfavorSound(Sound sound) async {
    if (!_loginStore.logged || favorIsBusy) {
      return;
    }

    favorIsBusy = true;

    await _fireStore
        .collection("user")
        .document(
          _loginStore.user.uid,
        )
        .collection("sounds")
        .document(sound.documentID)
        .delete();

    favorIsBusy = false;

    setFavor(sound.ref);
  }
}
