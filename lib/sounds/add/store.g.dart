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
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$descAtom = Atom(name: '_AddSoundStoreBase.desc');

  @override
  String get desc {
    _$descAtom.context.enforceReadPolicy(_$descAtom);
    _$descAtom.reportObserved();
    return super.desc;
  }

  @override
  set desc(String value) {
    _$descAtom.context.conditionallyRunInAction(() {
      super.desc = value;
      _$descAtom.reportChanged();
    }, _$descAtom, name: '${_$descAtom.name}_set');
  }

  final _$soundLinkAtom = Atom(name: '_AddSoundStoreBase.soundLink');

  @override
  String get soundLink {
    _$soundLinkAtom.context.enforceReadPolicy(_$soundLinkAtom);
    _$soundLinkAtom.reportObserved();
    return super.soundLink;
  }

  @override
  set soundLink(String value) {
    _$soundLinkAtom.context.conditionallyRunInAction(() {
      super.soundLink = value;
      _$soundLinkAtom.reportChanged();
    }, _$soundLinkAtom, name: '${_$soundLinkAtom.name}_set');
  }

  final _$_AddSoundStoreBaseActionController =
      ActionController(name: '_AddSoundStoreBase');

  @override
  void setName(dynamic value) {
    final _$actionInfo = _$_AddSoundStoreBaseActionController.startAction();
    try {
      return super.setName(value);
    } finally {
      _$_AddSoundStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDesc(dynamic value) {
    final _$actionInfo = _$_AddSoundStoreBaseActionController.startAction();
    try {
      return super.setDesc(value);
    } finally {
      _$_AddSoundStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSoundLink(dynamic value) {
    final _$actionInfo = _$_AddSoundStoreBaseActionController.startAction();
    try {
      return super.setSoundLink(value);
    } finally {
      _$_AddSoundStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSound() {
    final _$actionInfo = _$_AddSoundStoreBaseActionController.startAction();
    try {
      return super.addSound();
    } finally {
      _$_AddSoundStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editSound(Sound sound) {
    final _$actionInfo = _$_AddSoundStoreBaseActionController.startAction();
    try {
      return super.editSound(sound);
    } finally {
      _$_AddSoundStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'name: ${name.toString()},desc: ${desc.toString()},soundLink: ${soundLink.toString()}';
    return '{$string}';
  }
}
