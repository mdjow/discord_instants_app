import "dart:async";

import 'package:audioplayer/audioplayer.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import "package:discord_instants_app/login/store.dart";
import "package:discord_instants_app/services/sound.dart";
import "package:get_it/get_it.dart";
import "package:mobx/mobx.dart";

import "model.dart";

part "store.g.dart";

enum Pages {
  mySonds,
  communitySounds,
  myInstantsSound,
}

class SoundsStore = _SoundsStoreBase with _$SoundsStore;

abstract class _SoundsStoreBase with Store {
  final _fireStore = GetIt.I.get<Firestore>();
  final _loginStore = GetIt.I.get<LoginStore>();
  final _audioPlugin = GetIt.I.get<AudioPlayer>();
  final _soundService = GetIt.I.get<SoundService>();

  Timer timerSearch;

  @action
  void init() {
    _playerStateChanged = _audioPlugin.onPlayerStateChanged.asObservable();
    _playerStateChanged.listen((s) {
      if (s == AudioPlayerState.STOPPED) {
        localPlaying = "";
      }
    });

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
  ObservableStream<AudioPlayerState> _playerStateChanged;

  @observable
  Pages currentTab = Pages.mySonds;

  @observable
  String playing = "";

  @observable
  String localPlaying = "";

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
      case Pages.mySonds:
        return mySounds;
      case Pages.communitySounds:
        return communitySounds;
      case Pages.myInstantsSound:
        return myIntantsSounds;
        break;
      default:
        return [];
    }
  }

  @computed
  AudioPlayerState get playerStateChanged => _playerStateChanged.value;

  @action
  void playLocalSound(String url) {
    localPlaying = url;

    if (playerStateChanged == AudioPlayerState.PLAYING) {
      _audioPlugin.stop();
    }
    _audioPlugin.play(url);
  }

  @action
  void stopLocalSound() {
    _audioPlugin.stop();
    localPlaying = "";
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
  void setTabSelected(Pages value) {
    currentTab = value;

    switch (currentTab) {
      case Pages.myInstantsSound:
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
      final out = await _soundService.getMyInstants(page: page, search: value);

      myIntantsSounds = out?.data?.sounds ?? [];
    });
  }

  @action
  void searchSound(String value) {
    switch (currentTab) {
      case Pages.mySonds:
        searchMySounds(value);
        break;
      case Pages.communitySounds:
        searchCommunitySounds(value);
        break;
      case Pages.myInstantsSound:
        getMyInstantsSounds(value: value);
        break;
      default:
        break;
    }
  }

  @action
  Future<void> playDiscord(Sound sound) async {
    playing = sound.url;
    await _soundService.playOnDiscord(sound.url);
    playing = "";
  }

  @action
  Future<void> stopDiscord(Sound sound) async {
    playing = "";
    await _soundService.stopPlayingOnDiscord(sound.url);
  }
}
