import "package:mobx/mobx.dart";

import "package:shared_preferences/shared_preferences.dart";

part "store.g.dart";

class MainStore = _MainStoreBase with _$MainStore;

abstract class _MainStoreBase with Store {
  final String _apiKey = "api";

  @observable
  String apiUrl = "10.0.2.2:9001";

  @action
  Future<void> setApiUrl(value) async {
    var prefs = await SharedPreferences.getInstance();
    if (await prefs.setString(_apiKey, value)) {
      apiUrl = value;
    }
  }

  @action
  Future<void> getApi() async {
    var prefs = await SharedPreferences.getInstance();
    apiUrl = prefs.getString(_apiKey);
  }
}
