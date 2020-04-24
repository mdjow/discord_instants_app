import 'package:discord_instants_app/login/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../store.dart';

class DrawerPage extends StatelessWidget {
  final _mainStore = GetIt.I.get<MainStore>();
  final _loginStore = GetIt.I.get<LoginStore>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        children: [
          !_loginStore.logged
              ? Padding(padding: EdgeInsets.only(top: 40, bottom: 20), child: signInGoogle())
              : UserAccountsDrawerHeader(
                  accountName: Text(_loginStore?.user?.displayName ?? ""),
                  accountEmail: Text(_loginStore?.user?.email ?? ""),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Theme.of(context).platform == TargetPlatform.iOS ? Colors.blue : Colors.white,
                    backgroundImage: NetworkImage(_loginStore?.user?.photoUrl),
                  ),
                ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                Form(
                  key: _formKey,
                  child: TextFormField(
                      initialValue: _mainStore.apiUrl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "IP",
                      ),
                      validator: (value) {
                        if (value.isEmpty || value.length < 3) {
                          return "IP inválido";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          _mainStore.setApiUrl(value);
                        }
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                ),
                ListTile(
                  onTap: _loginStore.logout,
                  title: Text("Sair"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget signInGoogle() {
  final _loginStore = GetIt.I.get<LoginStore>();

  return OutlineButton(
    splashColor: Colors.white70,
    onPressed: _loginStore.signIn,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    highlightElevation: 0,
    borderSide: BorderSide(color: Colors.white70),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/logo.png"), height: 35.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Faça login no Google",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
