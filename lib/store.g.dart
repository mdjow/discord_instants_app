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
    _$apiUrlAtom.reportRead();
    return super.apiUrl;
  }

  @override
  set apiUrl(String value) {
    _$apiUrlAtom.reportWrite(value, super.apiUrl, () {
      super.apiUrl = value;
    });
  }

  final _$setApiUrlAsyncAction = AsyncAction('_MainStoreBase.setApiUrl');

  @override
  Future<void> setApiUrl(dynamic value) {
    return _$setApiUrlAsyncAction.run(() => super.setApiUrl(value));
  }

  final _$getApiAsyncAction = AsyncAction('_MainStoreBase.getApi');

  @override
  Future<void> getApi() {
    return _$getApiAsyncAction.run(() => super.getApi());
  }

  @override
  String toString() {
    return '''
apiUrl: ${apiUrl}
    ''';
  }
}
