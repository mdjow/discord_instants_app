import 'package:audioplayer/audioplayer.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";

import "drawer/store.dart";
import "home.dart";
import "login/store.dart";
import 'services/sound.dart';
import "sounds/add/store.dart";
import "sounds/store.dart";
import "store.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt getIt = GetIt.I;

  getIt.registerSingleton<AudioPlayer>(AudioPlayer());
  getIt.registerSingleton<Firestore>(Firestore());

  getIt.registerSingleton<MainStore>(MainStore());
  getIt.registerSingleton<Dio>(_buildClient());

  getIt.registerSingleton<SoundService>(SoundServiceImpl());

  getIt.registerSingleton<LoginStore>(LoginStore());
  getIt.registerSingleton<SoundsStore>(SoundsStore());
  getIt.registerSingleton<AddSoundStore>(AddSoundStore());
  getIt.registerSingleton<DrawerStore>(DrawerStore());

  runApp(HomePage());
}

Dio _buildClient() {
  final _mainStore = GetIt.I.get<MainStore>();

  final client = Dio(
    BaseOptions(
      baseUrl: "http://${_mainStore.apiUrl}/",
      headers: {
        "Content-Type": "application/json",
      },
      responseType: ResponseType.json,
    ),
  );

  return client;
}
