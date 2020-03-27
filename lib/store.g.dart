// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on _MainStoreBase, Store {
  final _$apiUrlAtom = Atom(name: '_MainStoreBase.apiUrl');

  @override
  String get apiUrl {
    _$apiUrlAtom.context.enforceReadPolicy(_$apiUrlAtom);
    _$apiUrlAtom.reportObserved();
    return super.apiUrl;
  }

  @override
  set apiUrl(String value) {
    _$apiUrlAtom.context.conditionallyRunInAction(() {
      super.apiUrl = value;
      _$apiUrlAtom.reportChanged();
    }, _$apiUrlAtom, name: '${_$apiUrlAtom.name}_set');
  }

  final _$_MainStoreBaseActionController =
      ActionController(name: '_MainStoreBase');

  @override
  void setApiUrl(dynamic value) {
    final _$actionInfo = _$_MainStoreBaseActionController.startAction();
    try {
      return super.setApiUrl(value);
    } finally {
      _$_MainStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'apiUrl: ${apiUrl.toString()}';
    return '{$string}';
  }
}
