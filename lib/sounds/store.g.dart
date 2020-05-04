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
      (_$mySoundsComputed ??= Computed<List<Sound>>(() => super.mySounds))
          .value;
  Computed<List<Sound>> _$communitySoundsComputed;

  @override
  List<Sound> get communitySounds => (_$communitySoundsComputed ??=
          Computed<List<Sound>>(() => super.communitySounds))
      .value;
  Computed<List<Sound>> _$soundsComputed;

  @override
  List<Sound> get sounds =>
      (_$soundsComputed ??= Computed<List<Sound>>(() => super.sounds)).value;
  Computed<AudioPlayerState> _$playerStateChangedComputed;

  @override
  AudioPlayerState get playerStateChanged => (_$playerStateChangedComputed ??=
          Computed<AudioPlayerState>(() => super.playerStateChanged))
      .value;

  final _$tabsAtom = Atom(name: '_SoundsStoreBase.tabs');

  @override
  List<String> get tabs {
    _$tabsAtom.context.enforceReadPolicy(_$tabsAtom);
    _$tabsAtom.reportObserved();
    return super.tabs;
  }

  @override
  set tabs(List<String> value) {
    _$tabsAtom.context.conditionallyRunInAction(() {
      super.tabs = value;
      _$tabsAtom.reportChanged();
    }, _$tabsAtom, name: '${_$tabsAtom.name}_set');
  }

  final _$_mySoundsAtom = Atom(name: '_SoundsStoreBase._mySounds');

  @override
  ObservableStream<QuerySnapshot> get _mySounds {
    _$_mySoundsAtom.context.enforceReadPolicy(_$_mySoundsAtom);
    _$_mySoundsAtom.reportObserved();
    return super._mySounds;
  }

  @override
  set _mySounds(ObservableStream<QuerySnapshot> value) {
    _$_mySoundsAtom.context.conditionallyRunInAction(() {
      super._mySounds = value;
      _$_mySoundsAtom.reportChanged();
    }, _$_mySoundsAtom, name: '${_$_mySoundsAtom.name}_set');
  }

  final _$_communitySoundsAtom =
      Atom(name: '_SoundsStoreBase._communitySounds');

  @override
  ObservableStream<QuerySnapshot> get _communitySounds {
    _$_communitySoundsAtom.context.enforceReadPolicy(_$_communitySoundsAtom);
    _$_communitySoundsAtom.reportObserved();
    return super._communitySounds;
  }

  @override
  set _communitySounds(ObservableStream<QuerySnapshot> value) {
    _$_communitySoundsAtom.context.conditionallyRunInAction(() {
      super._communitySounds = value;
      _$_communitySoundsAtom.reportChanged();
    }, _$_communitySoundsAtom, name: '${_$_communitySoundsAtom.name}_set');
  }

  final _$_playerStateChangedAtom =
      Atom(name: '_SoundsStoreBase._playerStateChanged');

  @override
  ObservableStream<AudioPlayerState> get _playerStateChanged {
    _$_playerStateChangedAtom.context
        .enforceReadPolicy(_$_playerStateChangedAtom);
    _$_playerStateChangedAtom.reportObserved();
    return super._playerStateChanged;
  }

  @override
  set _playerStateChanged(ObservableStream<AudioPlayerState> value) {
    _$_playerStateChangedAtom.context.conditionallyRunInAction(() {
      super._playerStateChanged = value;
      _$_playerStateChangedAtom.reportChanged();
    }, _$_playerStateChangedAtom,
        name: '${_$_playerStateChangedAtom.name}_set');
  }

  final _$currentTabAtom = Atom(name: '_SoundsStoreBase.currentTab');

  @override
  int get currentTab {
    _$currentTabAtom.context.enforceReadPolicy(_$currentTabAtom);
    _$currentTabAtom.reportObserved();
    return super.currentTab;
  }

  @override
  set currentTab(int value) {
    _$currentTabAtom.context.conditionallyRunInAction(() {
      super.currentTab = value;
      _$currentTabAtom.reportChanged();
    }, _$currentTabAtom, name: '${_$currentTabAtom.name}_set');
  }

  final _$playingAtom = Atom(name: '_SoundsStoreBase.playing');

  @override
  String get playing {
    _$playingAtom.context.enforceReadPolicy(_$playingAtom);
    _$playingAtom.reportObserved();
    return super.playing;
  }

  @override
  set playing(String value) {
    _$playingAtom.context.conditionallyRunInAction(() {
      super.playing = value;
      _$playingAtom.reportChanged();
    }, _$playingAtom, name: '${_$playingAtom.name}_set');
  }

  final _$localPlayingAtom = Atom(name: '_SoundsStoreBase.localPlaying');

  @override
  String get localPlaying {
    _$localPlayingAtom.context.enforceReadPolicy(_$localPlayingAtom);
    _$localPlayingAtom.reportObserved();
    return super.localPlaying;
  }

  @override
  set localPlaying(String value) {
    _$localPlayingAtom.context.conditionallyRunInAction(() {
      super.localPlaying = value;
      _$localPlayingAtom.reportChanged();
    }, _$localPlayingAtom, name: '${_$localPlayingAtom.name}_set');
  }

  final _$myIntantsSoundsAtom = Atom(name: '_SoundsStoreBase.myIntantsSounds');

  @override
  List<Sound> get myIntantsSounds {
    _$myIntantsSoundsAtom.context.enforceReadPolicy(_$myIntantsSoundsAtom);
    _$myIntantsSoundsAtom.reportObserved();
    return super.myIntantsSounds;
  }

  @override
  set myIntantsSounds(List<Sound> value) {
    _$myIntantsSoundsAtom.context.conditionallyRunInAction(() {
      super.myIntantsSounds = value;
      _$myIntantsSoundsAtom.reportChanged();
    }, _$myIntantsSoundsAtom, name: '${_$myIntantsSoundsAtom.name}_set');
  }

  final _$getMyInstantsSoundsAsyncAction = AsyncAction('getMyInstantsSounds');

  @override
  Future<void> getMyInstantsSounds({String value = "", int page = 1}) {
    return _$getMyInstantsSoundsAsyncAction
        .run(() => super.getMyInstantsSounds(value: value, page: page));
  }

  final _$playDiscordAsyncAction = AsyncAction('playDiscord');

  @override
  Future<void> playDiscord(Sound sound) {
    return _$playDiscordAsyncAction.run(() => super.playDiscord(sound));
  }

  final _$stopDiscordAsyncAction = AsyncAction('stopDiscord');

  @override
  Future<void> stopDiscord(Sound sound) {
    return _$stopDiscordAsyncAction.run(() => super.stopDiscord(sound));
  }

  final _$_SoundsStoreBaseActionController =
      ActionController(name: '_SoundsStoreBase');

  @override
  void init() {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction();
    try {
      return super.init();
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void playLocalSound(String url) {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction();
    try {
      return super.playLocalSound(url);
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLocalSound() {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction();
    try {
      return super.stopLocalSound();
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMySoundOrdem(int order, Sound sound) {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction();
    try {
      return super.setMySoundOrdem(order, sound);
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTabSelected(int value) {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction();
    try {
      return super.setTabSelected(value);
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getCommunitySounds() {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction();
    try {
      return super.getCommunitySounds();
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchCommunitySounds(String value) {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction();
    try {
      return super.searchCommunitySounds(value);
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getMySounds() {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction();
    try {
      return super.getMySounds();
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchMySounds(String value) {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction();
    try {
      return super.searchMySounds(value);
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchSound(String value) {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction();
    try {
      return super.searchSound(value);
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'tabs: ${tabs.toString()},currentTab: ${currentTab.toString()},playing: ${playing.toString()},localPlaying: ${localPlaying.toString()},myIntantsSounds: ${myIntantsSounds.toString()},mySounds: ${mySounds.toString()},communitySounds: ${communitySounds.toString()},sounds: ${sounds.toString()},playerStateChanged: ${playerStateChanged.toString()}';
    return '{$string}';
  }
}
