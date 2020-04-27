import "package:mobx/mobx.dart";

part "store.g.dart";

class DrawerStore = _DrawerStoreBase with _$DrawerStore;

abstract class _DrawerStoreBase with Store {}
