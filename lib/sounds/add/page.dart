import 'package:discord_instants_app/sounds/model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'store.dart';

class AddSoundPage extends StatelessWidget {
  AddSoundPage({this.sound});

  final _addSoundsStore = GetIt.I.get<AddSoundStore>();
  final _formKey = GlobalKey<FormState>();
  final Sound sound;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!_formKey.currentState.validate()) {
            return;
          }
          _formKey.currentState.save();

          if (sound != null) {
            _addSoundsStore.editSound(sound);
          } else {
            _addSoundsStore.addSound();
          }
          Navigator.pop(context);
        },
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    initialValue: sound?.title ?? "",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nome",
                    ),
                    validator: (value) {
                      if (value.isEmpty || value.length < 3) {
                        return "Nome inválido";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      _addSoundsStore.setName(value);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    initialValue: sound?.desc ?? "",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Descrição",
                    ),
                    onSaved: (String value) {
                      _addSoundsStore.setDesc(value);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    initialValue: sound?.url ?? "",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Link",
                    ),
                    validator: (value) {
                      if (value.isEmpty || value.length < 3) {
                        return "link inválido";
                      }

                      if (value.substring(value.length - 3) != "mp3") {
                        return "Insira um link para um arquivo mp3";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      _addSoundsStore.setSoundLink(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
