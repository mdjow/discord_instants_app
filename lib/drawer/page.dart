import 'package:discord_instants_app/login/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../store.dart';

import 'store.dart';

class DrawerPage extends StatelessWidget {
  final _mainStore = GetIt.I.get<MainStore>();
  final _loginStore = GetIt.I.get<LoginStore>();

  final _formKey = GlobalKey<FormState>();
  final maskFormatter = MaskTextInputFormatter(mask: '###.###.###.###:##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Observer(
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                !_loginStore.logged
                    ? RaisedButton(
                        child: Text("login"),
                        onPressed: () => _loginStore.signIn(),
                      )
                    : Row(
                        children: [
                          Text(_loginStore?.user?.displayName ?? ""),
                          RaisedButton(
                            child: Text("logout"),
                            onPressed: () => _loginStore.logout(),
                          )
                        ],
                      ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    initialValue: _mainStore.apiUrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "IP",
                    ),
                    validator: (value) {
                      if (value.isEmpty || value.length < 3) {
                        return "ip inválido";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      _mainStore.setApiUrl(value);
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Salvar"),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
