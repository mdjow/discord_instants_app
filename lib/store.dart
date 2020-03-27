import 'package:mobx/mobx.dart';

part 'store.g.dart';

class MainStore = _MainStoreBase with _$MainStore;

abstract class _MainStoreBase with Store {
  @observable
  String apiUrl = "10.0.2.2:9001";

  @action
  void setApiUrl(value) => apiUrl = value;
}
