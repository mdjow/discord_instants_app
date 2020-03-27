import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discord_instants_app/login/store.dart';
import 'package:discord_instants_app/services/sound.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'model.dart';

part 'store.g.dart';

class SoundsStore = _SoundsStoreBase with _$SoundsStore;

abstract class _SoundsStoreBase with Store {
  final _fireStore = GetIt.I.get<Firestore>();
  final _loginStore = GetIt.I.get<LoginStore>();

  _SoundsStoreBase() {
    when(
      (_) => _loginStore.logged,
      () => _sounds = ObservableStream(
        _fireStore
            .collection(
              "user",
            )
            .document(_loginStore.user.uid)
            .collection(
              "sounds",
            )
            .snapshots(),
      ),
    );
  }

  @observable
  ObservableStream<QuerySnapshot> _sounds;

  @observable
  int currentTab = 0;

  @observable
  String playing = "";

  @computed
  List<Sound> get sounds => _sounds?.value?.documents?.map((doc) => Sound.fromJson(doc.data ?? {}))?.toList() ?? [];

  @action
  void setTabSelected(int value) {
    currentTab = value;

    switch (currentTab) {
      case 0:
        getMySounds();
        break;
      case 1:
        getCommunitySounds();
        break;
      default:
        break;
    }
  }

  @action
  void getCommunitySounds() {
    _sounds = ObservableStream(
      _fireStore
          .collection(
            "sounds",
          )
          .snapshots(),
    );
  }

  @action
  void getMySounds() {
    if (!_loginStore.logged) {
      _sounds = null;
      return;
    }

    _sounds = ObservableStream(
      _fireStore
          .collection(
            "user",
          )
          .document(_loginStore.user.uid)
          .collection(
            "sounds",
          )
          .snapshots(),
    );
  }

  @action
  Future<void> playDiscord(String link) async {
    playing = link;
    await playOnDiscord(link);
    playing = "";
  }

  @action
  Future<void> stopDiscord(String link) async {
    playing = "";
    await stopPlayingOnDiscord(link);
  }
}
