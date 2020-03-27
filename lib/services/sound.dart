import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../store.dart';

Future<Status> playOnDiscord(String link) async {
  final _mainStore = GetIt.I.get<MainStore>();
  try {
    await Dio().post('http://${_mainStore.apiUrl}/bot/play', data: {"url": link});
    return Status.OK;
  } catch (e) {
    return Status.ERROR;
  }
}

Future<void> stopPlayingOnDiscord(String link) async {
  final _mainStore = GetIt.I.get<MainStore>();

  try {
    await Dio().post('http://${_mainStore.apiUrl}/bot/stop');
    return Status.OK;
  } catch (e) {
    return Status.ERROR;
  }
}

enum Status {
  OK,
  ERROR,
}
