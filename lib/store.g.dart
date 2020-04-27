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

  final _$setApiUrlAsyncAction = AsyncAction('setApiUrl');

  @override
  Future<void> setApiUrl(dynamic value) {
    return _$setApiUrlAsyncAction.run(() => super.setApiUrl(value));
  }

  final _$getApiAsyncAction = AsyncAction('getApi');

  @override
  Future<void> getApi() {
    return _$getApiAsyncAction.run(() => super.getApi());
  }

  @override
  String toString() {
    final string = 'apiUrl: ${apiUrl.toString()}';
    return '{$string}';
  }
}
