// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SoundsStore on _SoundsStoreBase, Store {
  Computed<List<Sound>> _$mySoundsComputed;

  @override
  List<Sound> get mySounds =>
      (_$mySoundsComputed ??= Computed<List<Sound>>(() => super.mySounds,
              name: '_SoundsStoreBase.mySounds'))
          .value;
  Computed<List<Sound>> _$communitySoundsComputed;

  @override
  List<Sound> get communitySounds => (_$communitySoundsComputed ??=
          Computed<List<Sound>>(() => super.communitySounds,
              name: '_SoundsStoreBase.communitySounds'))
      .value;
  Computed<List<Sound>> _$soundsComputed;

  @override
  List<Sound> get sounds =>
      (_$soundsComputed ??= Computed<List<Sound>>(() => super.sounds,
              name: '_SoundsStoreBase.sounds'))
          .value;
  Computed<AudioPlayerState> _$playerStateChangedComputed;

  @override
  AudioPlayerState get playerStateChanged => (_$playerStateChangedComputed ??=
          Computed<AudioPlayerState>(() => super.playerStateChanged,
              name: '_SoundsStoreBase.playerStateChanged'))
      .value;

  final _$tabsAtom = Atom(name: '_SoundsStoreBase.tabs');

  @override
  List<String> get tabs {
    _$tabsAtom.reportRead();
    return super.tabs;
  }

  @override
  set tabs(List<String> value) {
    _$tabsAtom.reportWrite(value, super.tabs, () {
      super.tabs = value;
    });
  }

  final _$_mySoundsAtom = Atom(name: '_SoundsStoreBase._mySounds');

  @override
  ObservableStream<QuerySnapshot> get _mySounds {
    _$_mySoundsAtom.reportRead();
    return super._mySounds;
  }

  @override
  set _mySounds(ObservableStream<QuerySnapshot> value) {
    _$_mySoundsAtom.reportWrite(value, super._mySounds, () {
      super._mySounds = value;
    });
  }

  final _$_communitySoundsAtom =
      Atom(name: '_SoundsStoreBase._communitySounds');

  @override
  ObservableStream<QuerySnapshot> get _communitySounds {
    _$_communitySoundsAtom.reportRead();
    return super._communitySounds;
  }

  @override
  set _communitySounds(ObservableStream<QuerySnapshot> value) {
    _$_communitySoundsAtom.reportWrite(value, super._communitySounds, () {
      super._communitySounds = value;
    });
  }

  final _$_playerStateChangedAtom =
      Atom(name: '_SoundsStoreBase._playerStateChanged');

  @override
  ObservableStream<AudioPlayerState> get _playerStateChanged {
    _$_playerStateChangedAtom.reportRead();
    return super._playerStateChanged;
  }

  @override
  set _playerStateChanged(ObservableStream<AudioPlayerState> value) {
    _$_playerStateChangedAtom.reportWrite(value, super._playerStateChanged, () {
      super._playerStateChanged = value;
    });
  }

  final _$currentTabAtom = Atom(name: '_SoundsStoreBase.currentTab');

  @override
  Pages get currentTab {
    _$currentTabAtom.reportRead();
    return super.currentTab;
  }

  @override
  set currentTab(Pages value) {
    _$currentTabAtom.reportWrite(value, super.currentTab, () {
      super.currentTab = value;
    });
  }

  final _$playingAtom = Atom(name: '_SoundsStoreBase.playing');

  @override
  String get playing {
    _$playingAtom.reportRead();
    return super.playing;
  }

  @override
  set playing(String value) {
    _$playingAtom.reportWrite(value, super.playing, () {
      super.playing = value;
    });
  }

  final _$localPlayingAtom = Atom(name: '_SoundsStoreBase.localPlaying');

  @override
  String get localPlaying {
    _$localPlayingAtom.reportRead();
    return super.localPlaying;
  }

  @override
  set localPlaying(String value) {
    _$localPlayingAtom.reportWrite(value, super.localPlaying, () {
      super.localPlaying = value;
    });
  }

  final _$myIntantsSoundsAtom = Atom(name: '_SoundsStoreBase.myIntantsSounds');

  @override
  List<Sound> get myIntantsSounds {
    _$myIntantsSoundsAtom.reportRead();
    return super.myIntantsSounds;
  }

  @override
  set myIntantsSounds(List<Sound> value) {
    _$myIntantsSoundsAtom.reportWrite(value, super.myIntantsSounds, () {
      super.myIntantsSounds = value;
    });
  }

  final _$getMyInstantsSoundsAsyncAction =
      AsyncAction('_SoundsStoreBase.getMyInstantsSounds');

  @override
  Future<void> getMyInstantsSounds({String value = "", int page = 1}) {
    return _$getMyInstantsSoundsAsyncAction
        .run(() => super.getMyInstantsSounds(value: value, page: page));
  }

  final _$playDiscordAsyncAction = AsyncAction('_SoundsStoreBase.playDiscord');

  @override
  Future<void> playDiscord(Sound sound) {
    return _$playDiscordAsyncAction.run(() => super.playDiscord(sound));
  }

  final _$stopDiscordAsyncAction = AsyncAction('_SoundsStoreBase.stopDiscord');

  @override
  Future<void> stopDiscord(Sound sound) {
    return _$stopDiscordAsyncAction.run(() => super.stopDiscord(sound));
  }

  final _$_SoundsStoreBaseActionController =
      ActionController(name: '_SoundsStoreBase');

  @override
  void init() {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction(
        name: '_SoundsStoreBase.init');
    try {
      return super.init();
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void playLocalSound(String url) {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction(
        name: '_SoundsStoreBase.playLocalSound');
    try {
      return super.playLocalSound(url);
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLocalSound() {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction(
        name: '_SoundsStoreBase.stopLocalSound');
    try {
      return super.stopLocalSound();
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMySoundOrdem(int order, Sound sound) {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction(
        name: '_SoundsStoreBase.setMySoundOrdem');
    try {
      return super.setMySoundOrdem(order, sound);
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTabSelected(Pages value) {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction(
        name: '_SoundsStoreBase.setTabSelected');
    try {
      return super.setTabSelected(value);
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getCommunitySounds() {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction(
        name: '_SoundsStoreBase.getCommunitySounds');
    try {
      return super.getCommunitySounds();
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchCommunitySounds(String value) {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction(
        name: '_SoundsStoreBase.searchCommunitySounds');
    try {
      return super.searchCommunitySounds(value);
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getMySounds() {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction(
        name: '_SoundsStoreBase.getMySounds');
    try {
      return super.getMySounds();
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchMySounds(String value) {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction(
        name: '_SoundsStoreBase.searchMySounds');
    try {
      return super.searchMySounds(value);
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchSound(String value) {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction(
        name: '_SoundsStoreBase.searchSound');
    try {
      return super.searchSound(value);
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabs: ${tabs},
currentTab: ${currentTab},
playing: ${playing},
localPlaying: ${localPlaying},
myIntantsSounds: ${myIntantsSounds},
mySounds: ${mySounds},
communitySounds: ${communitySounds},
sounds: ${sounds},
playerStateChanged: ${playerStateChanged}
    ''';
  }
}
