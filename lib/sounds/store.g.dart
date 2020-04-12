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

  final _$_myInstantsSoundsAtom =
      Atom(name: '_SoundsStoreBase._myInstantsSounds');

  @override
  List<Sound> get _myInstantsSounds {
    _$_myInstantsSoundsAtom.context.enforceReadPolicy(_$_myInstantsSoundsAtom);
    _$_myInstantsSoundsAtom.reportObserved();
    return super._myInstantsSounds;
  }

  @override
  set _myInstantsSounds(List<Sound> value) {
    _$_myInstantsSoundsAtom.context.conditionallyRunInAction(() {
      super._myInstantsSounds = value;
      _$_myInstantsSoundsAtom.reportChanged();
    }, _$_myInstantsSoundsAtom, name: '${_$_myInstantsSoundsAtom.name}_set');
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
        'currentTab: ${currentTab.toString()},playing: ${playing.toString()},myIntantsSounds: ${myIntantsSounds.toString()},mySounds: ${mySounds.toString()},communitySounds: ${communitySounds.toString()},sounds: ${sounds.toString()}';
    return '{$string}';
  }
}
