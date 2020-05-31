// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<bool> _$loggedComputed;

  @override
  bool get logged => (_$loggedComputed ??=
          Computed<bool>(() => super.logged, name: '_LoginStoreBase.logged'))
      .value;

  final _$userAtom = Atom(name: '_LoginStoreBase.user');

  @override
  FirebaseUser get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(FirebaseUser value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$credentialAtom = Atom(name: '_LoginStoreBase.credential');

  @override
  AuthCredential get credential {
    _$credentialAtom.reportRead();
    return super.credential;
  }

  @override
  set credential(AuthCredential value) {
    _$credentialAtom.reportWrite(value, super.credential, () {
      super.credential = value;
    });
  }

  final _$logoutAsyncAction = AsyncAction('_LoginStoreBase.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$signInAsyncAction = AsyncAction('_LoginStoreBase.signIn');

  @override
  Future<void> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  @override
  String toString() {
    return '''
user: ${user},
credential: ${credential},
logged: ${logged}
    ''';
  }
}
