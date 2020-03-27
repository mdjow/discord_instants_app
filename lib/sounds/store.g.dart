// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SoundsStore on _SoundsStoreBase, Store {
  Computed<List<Sound>> _$soundsComputed;

  @override
  List<Sound> get sounds =>
      (_$soundsComputed ??= Computed<List<Sound>>(() => super.sounds)).value;

  final _$_soundsAtom = Atom(name: '_SoundsStoreBase._sounds');

  @override
  ObservableStream<QuerySnapshot> get _sounds {
    _$_soundsAtom.context.enforceReadPolicy(_$_soundsAtom);
    _$_soundsAtom.reportObserved();
    return super._sounds;
  }

  @override
  set _sounds(ObservableStream<QuerySnapshot> value) {
    _$_soundsAtom.context.conditionallyRunInAction(() {
      super._sounds = value;
      _$_soundsAtom.reportChanged();
    }, _$_soundsAtom, name: '${_$_soundsAtom.name}_set');
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

  final _$playDiscordAsyncAction = AsyncAction('playDiscord');

  @override
  Future<void> playDiscord(String link) {
    return _$playDiscordAsyncAction.run(() => super.playDiscord(link));
  }

  final _$stopDiscordAsyncAction = AsyncAction('stopDiscord');

  @override
  Future<void> stopDiscord(String link) {
    return _$stopDiscordAsyncAction.run(() => super.stopDiscord(link));
  }

  final _$_SoundsStoreBaseActionController =
      ActionController(name: '_SoundsStoreBase');

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
  void getMySounds() {
    final _$actionInfo = _$_SoundsStoreBaseActionController.startAction();
    try {
      return super.getMySounds();
    } finally {
      _$_SoundsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentTab: ${currentTab.toString()},playing: ${playing.toString()},sounds: ${sounds.toString()}';
    return '{$string}';
  }
}
