// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddSoundStore on _AddSoundStoreBase, Store {
  final _$nameAtom = Atom(name: '_AddSoundStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$descAtom = Atom(name: '_AddSoundStoreBase.desc');

  @override
  String get desc {
    _$descAtom.reportRead();
    return super.desc;
  }

  @override
  set desc(String value) {
    _$descAtom.reportWrite(value, super.desc, () {
      super.desc = value;
    });
  }

  final _$soundLinkAtom = Atom(name: '_AddSoundStoreBase.soundLink');

  @override
  String get soundLink {
    _$soundLinkAtom.reportRead();
    return super.soundLink;
  }

  @override
  set soundLink(String value) {
    _$soundLinkAtom.reportWrite(value, super.soundLink, () {
      super.soundLink = value;
    });
  }

  final _$favorAtom = Atom(name: '_AddSoundStoreBase.favor');

  @override
  bool get favor {
    _$favorAtom.reportRead();
    return super.favor;
  }

  @override
  set favor(bool value) {
    _$favorAtom.reportWrite(value, super.favor, () {
      super.favor = value;
    });
  }

  final _$publicAtom = Atom(name: '_AddSoundStoreBase.public');

  @override
  bool get public {
    _$publicAtom.reportRead();
    return super.public;
  }

  @override
  set public(bool value) {
    _$publicAtom.reportWrite(value, super.public, () {
      super.public = value;
    });
  }

  final _$favorIsBusyAtom = Atom(name: '_AddSoundStoreBase.favorIsBusy');

  @override
  bool get favorIsBusy {
    _$favorIsBusyAtom.reportRead();
    return super.favorIsBusy;
  }

  @override
  set favorIsBusy(bool value) {
    _$favorIsBusyAtom.reportWrite(value, super.favorIsBusy, () {
      super.favorIsBusy = value;
    });
  }

  final _$favorSoundAsyncAction = AsyncAction('_AddSoundStoreBase.favorSound');

  @override
  Future<void> favorSound(Sound sound) {
    return _$favorSoundAsyncAction.run(() => super.favorSound(sound));
  }

  final _$disfavorSoundAsyncAction =
      AsyncAction('_AddSoundStoreBase.disfavorSound');

  @override
  Future<void> disfavorSound(Sound sound) {
    return _$disfavorSoundAsyncAction.run(() => super.disfavorSound(sound));
  }

  final _$_AddSoundStoreBaseActionController =
      ActionController(name: '_AddSoundStoreBase');

  @override
  void setPublic(dynamic value) {
    final _$actionInfo = _$_AddSoundStoreBaseActionController.startAction(
        name: '_AddSoundStoreBase.setPublic');
    try {
      return super.setPublic(value);
    } finally {
      _$_AddSoundStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(dynamic value) {
    final _$actionInfo = _$_AddSoundStoreBaseActionController.startAction(
        name: '_AddSoundStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_AddSoundStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDesc(dynamic value) {
    final _$actionInfo = _$_AddSoundStoreBaseActionController.startAction(
        name: '_AddSoundStoreBase.setDesc');
    try {
      return super.setDesc(value);
    } finally {
      _$_AddSoundStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSoundLink(dynamic value) {
    final _$actionInfo = _$_AddSoundStoreBaseActionController.startAction(
        name: '_AddSoundStoreBase.setSoundLink');
    try {
      return super.setSoundLink(value);
    } finally {
      _$_AddSoundStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFavor(bool value) {
    final _$actionInfo = _$_AddSoundStoreBaseActionController.startAction(
        name: '_AddSoundStoreBase.setFavor');
    try {
      return super.setFavor(value);
    } finally {
      _$_AddSoundStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> isFavorite(Sound soundRef) {
    final _$actionInfo = _$_AddSoundStoreBaseActionController.startAction(
        name: '_AddSoundStoreBase.isFavorite');
    try {
      return super.isFavorite(soundRef);
    } finally {
      _$_AddSoundStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSound() {
    final _$actionInfo = _$_AddSoundStoreBaseActionController.startAction(
        name: '_AddSoundStoreBase.addSound');
    try {
      return super.addSound();
    } finally {
      _$_AddSoundStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editSound(Sound sound) {
    final _$actionInfo = _$_AddSoundStoreBaseActionController.startAction(
        name: '_AddSoundStoreBase.editSound');
    try {
      return super.editSound(sound);
    } finally {
      _$_AddSoundStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
desc: ${desc},
soundLink: ${soundLink},
favor: ${favor},
public: ${public},
favorIsBusy: ${favorIsBusy}
    ''';
  }
}
