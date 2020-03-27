// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<bool> _$loggedComputed;

  @override
  bool get logged =>
      (_$loggedComputed ??= Computed<bool>(() => super.logged)).value;

  final _$userAtom = Atom(name: '_LoginStoreBase.user');

  @override
  FirebaseUser get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(FirebaseUser value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$credentialAtom = Atom(name: '_LoginStoreBase.credential');

  @override
  AuthCredential get credential {
    _$credentialAtom.context.enforceReadPolicy(_$credentialAtom);
    _$credentialAtom.reportObserved();
    return super.credential;
  }

  @override
  set credential(AuthCredential value) {
    _$credentialAtom.context.conditionallyRunInAction(() {
      super.credential = value;
      _$credentialAtom.reportChanged();
    }, _$credentialAtom, name: '${_$credentialAtom.name}_set');
  }

  final _$logoutAsyncAction = AsyncAction('logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$signInAsyncAction = AsyncAction('signIn');

  @override
  Future<void> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  @override
  String toString() {
    final string =
        'user: ${user.toString()},credential: ${credential.toString()},logged: ${logged.toString()}';
    return '{$string}';
  }
}
