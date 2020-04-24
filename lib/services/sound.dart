import 'package:dio/dio.dart';
import 'package:discord_instants_app/sounds/model.dart';
import 'package:get_it/get_it.dart';

import '../store.dart';
import 'response_extractor.dart';

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

Future<List<Sound>> getMyInstants({int page = 1, String search = ""}) async {
  final _mainStore = GetIt.I.get<MainStore>();
  String params = "page=$page";

  if (search.isNotEmpty) {
    params = "$params&search=$search";
  }
  try {
    final res = await Dio().get('http://${_mainStore.apiUrl}/instant/list?$params');

    final data = extractResponse(res.data);
    final list = data["instants"] ?? [];
    return list
            ?.map<Sound>((s) => Sound.fromJson({
                  "title": s["name"] ?? "",
                  "url": s["url"] ?? "",
                }))
            ?.toList() ??
        [];
  } catch (err) {
    print(err);
    return [];
  }
}

enum Status {
  OK,
  ERROR,
}
