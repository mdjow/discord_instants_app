import 'package:cloud_firestore/cloud_firestore.dart';

class Sound {
  Sound({
    this.documentID,
    this.title,
    this.desc,
    this.url,
    this.ref,
  });

  factory Sound.fromJson(Map<String, dynamic> value) {
    final out = Sound(
      documentID: value["id"],
      title: value["title"],
      desc: value["desc"],
      url: value["url"],
      ref: value["ref"],
    );

    return out;
  }

  final String title;
  final String desc;
  final String documentID;
  final String url;
  final DocumentReference ref;
}
