import "package:dio/dio.dart";
import "package:discord_instants_app/sounds/model.dart";
import "package:get_it/get_it.dart";

Status _getStatus(String label) {
  switch (label) {
    case "ok":
      return Status.OK;
    default:
      return Status.ERROR;
  }
}

class StatusResponse<T> {
  final String label;
  final String message;
  final Status status;
  final T data;

  factory StatusResponse.fromJson(Map<String, dynamic> value, T fromJson(Map<String, dynamic> o)) {
    final status = _getStatus(value["label"] ?? "ok");
    final out = StatusResponse<T>(
      label: value["label"] ?? "",
      message: value["message"] ?? "",
      status: status,
      data: value["data"] != null ? fromJson(value["data"]) : null,
    );

    return out;
  }

  StatusResponse({
    this.label,
    this.message,
    this.status,
    this.data,
  });
}

class PlaySoundResponse {
  final String exitReason;

  static PlaySoundResponse fromJson(Map<String, dynamic> value) {
    final out = PlaySoundResponse(
      exitReason: value["exitReason"] ?? "",
    );

    return out;
  }

  PlaySoundResponse({this.exitReason});
}

class StopSoundResponse {
  final String exitReason;

  static StopSoundResponse fromJson(Map<String, dynamic> value) {
    final out = StopSoundResponse(
      exitReason: value["exitReason"] ?? "",
    );

    return out;
  }

  StopSoundResponse({this.exitReason});
}

class GetMyInstantsSoundResponse {
  final List<Sound> sounds;

  static GetMyInstantsSoundResponse fromJson(Map<String, dynamic> value) {
    final list = value["instants"] ?? [];
    final out = GetMyInstantsSoundResponse(
      sounds: list
              ?.map<Sound>((s) => Sound.fromJson({
                    "title": s["name"] ?? "",
                    "url": s["url"] ?? "",
                  }))
              ?.toList() ??
          [],
    );

    return out;
  }

  GetMyInstantsSoundResponse({this.sounds});
}

abstract class SoundService {
  Future<StatusResponse<PlaySoundResponse>> playOnDiscord(String link);
  Future<StatusResponse<StopSoundResponse>> stopPlayingOnDiscord(String link);
  Future<StatusResponse<GetMyInstantsSoundResponse>> getMyInstants({
    int page,
    String search,
  });
}

class SoundServiceImpl implements SoundService {
  final _client = GetIt.I.get<Dio>();

  @override
  Future<StatusResponse<PlaySoundResponse>> playOnDiscord(String link) async {
    const url = "bot/play";
    final data = {
      "url": link,
    };

    final response = await _client.post(url, data: data);

    return StatusResponse<PlaySoundResponse>.fromJson(
      response.data,
      PlaySoundResponse.fromJson,
    );
  }

  @override
  Future<StatusResponse<StopSoundResponse>> stopPlayingOnDiscord(String link) async {
    const url = "bot/stop";

    final response = await _client.post(url);

    final Map<String, dynamic> data = response.data == "" ? {} : response;

    return StatusResponse<StopSoundResponse>.fromJson(
      data,
      StopSoundResponse.fromJson,
    );
  }

  @override
  Future<StatusResponse<GetMyInstantsSoundResponse>> getMyInstants({
    int page = 1,
    String search = "",
  }) async {
    var params = "page=$page";

    if (search.isNotEmpty) {
      params = "$params&search=$search";
    }

    var url = "instant/list?$params";

    final response = await _client.get(url);

    return StatusResponse<GetMyInstantsSoundResponse>.fromJson(
      response.data,
      GetMyInstantsSoundResponse.fromJson,
    );
  }
}

enum Status {
  OK,
  ERROR,
}
