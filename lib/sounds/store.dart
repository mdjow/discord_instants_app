import "dart:async";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:discord_instants_app/login/store.dart";
import "package:discord_instants_app/services/sound.dart";
import "package:get_it/get_it.dart";
import "package:mobx/mobx.dart";

import "model.dart";

part "store.g.dart";

class SoundsStore = _SoundsStoreBase with _$SoundsStore;

abstract class _SoundsStoreBase with Store {
  final _fireStore = GetIt.I.get<Firestore>();
  final _loginStore = GetIt.I.get<LoginStore>();

  Timer timerSearch;

  @action
  void init() {
    when((_) => _loginStore.logged, () {
      getMySounds();
      getMyInstantsSounds();
    });

    getCommunitySounds();
  }

  @observable
  List<String> tabs = ["Meus Sons", "Sons da comunidade", "Sons do MyInstants"];

  @observable
  ObservableStream<QuerySnapshot> _mySounds;

  @observable
  ObservableStream<QuerySnapshot> _communitySounds;

  @observable
  List<Sound> _myInstantsSounds;

  @observable
  int currentTab = 0;

  @observable
  String playing = "";

  @observable
  List<Sound> myIntantsSounds;

  @computed
  List<Sound> get mySounds => _mySounds?.value?.documents?.map((doc) => Sound.fromJson(doc.data ?? {}))?.toList();

  @computed
  List<Sound> get communitySounds =>
      _communitySounds?.value?.documents?.map((doc) => Sound.fromJson(doc.data ?? {}))?.toList();

  @computed
  List<Sound> get sounds {
    switch (currentTab) {
      case 0:
        return mySounds;
      case 1:
        return communitySounds;
      case 2:
        return myIntantsSounds;
        break;
      default:
        return [];
    }
  }

  @action
  void setMySoundOrdem(int order, Sound sound) {
    _fireStore
        .collection(
          "user",
        )
        .document(_loginStore.user.uid)
        .collection(
          "sounds",
        )
        .document(sound.documentID)
        .updateData({"order": order});
  }

  @action
  void setTabSelected(int value) {
    currentTab = value;

    switch (currentTab) {
      case 2:
        getMyInstantsSounds();
        break;
      default:
        break;
    }
  }

  @action
  void getCommunitySounds() {
    _communitySounds = ObservableStream(
      _fireStore
          .collection(
            "sounds",
          )
          .snapshots(),
    );
  }

  @action
  void searchCommunitySounds(String value) {
    _communitySounds = ObservableStream(
      _fireStore
          .collection(
            "sounds",
          )
          .where("title", isGreaterThanOrEqualTo: value)
          .getDocuments()
          .asStream(),
    );
  }

  @action
  void getMySounds() {
    if (!_loginStore.logged) {
      _mySounds = null;
      return;
    }

    _mySounds = ObservableStream(
      _fireStore
          .collection(
            "user",
          )
          .document(_loginStore.user.uid)
          .collection(
            "sounds",
          )
          .orderBy("order")
          .snapshots(),
    );
  }

  @action
  void searchMySounds(String value) {
    if (!_loginStore.logged) {
      _mySounds = null;
      return;
    }

    _mySounds = ObservableStream(
      _fireStore
          .collection(
            "user",
          )
          .document(_loginStore.user.uid)
          .collection(
            "sounds",
          )
          .orderBy("order")
          .where("title", isGreaterThanOrEqualTo: value)
          .getDocuments()
          .asStream(),
    );
  }

  @action
  Future<void> getMyInstantsSounds({String value = "", int page = 1}) async {
    if (timerSearch?.isActive ?? false) {
      timerSearch.cancel();
    }

    timerSearch = Timer(Duration(milliseconds: 500), () async {
      myIntantsSounds = await getMyInstants(page: page, search: value);
    });
  }

  @action
  void searchSound(String value) {
    switch (currentTab) {
      case 0:
        searchMySounds(value);
        break;
      case 1:
        searchCommunitySounds(value);
        break;
      case 2:
        getMyInstantsSounds(value: value);
        break;
      default:
        break;
    }
  }

  @action
  Future<void> playDiscord(Sound sound) async {
    playing = sound.url;
    await playOnDiscord(sound.url);
    playing = "";
  }

  @action
  Future<void> stopDiscord(Sound sound) async {
    playing = "";
    await stopPlayingOnDiscord(sound.url);
  }
}
