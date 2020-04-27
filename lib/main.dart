import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";

import "drawer/store.dart";
import "home.dart";
import "login/store.dart";
import "sounds/add/store.dart";
import "sounds/store.dart";
import "store.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt getIt = GetIt.I;

  getIt.registerSingleton<LoginStore>(LoginStore());
  getIt.registerSingleton<Firestore>(Firestore());
  getIt.registerSingleton<SoundsStore>(SoundsStore());
  getIt.registerSingleton<AddSoundStore>(AddSoundStore());
  getIt.registerSingleton<DrawerStore>(DrawerStore());
  getIt.registerSingleton<MainStore>(MainStore());

  runApp(HomePage());
}
