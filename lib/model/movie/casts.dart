import 'package:dou_ban_movie/model/movie/avatar.dart';

class Casts {
  String _alt;
  Avatar _avatars;
  String _name;
  String _id;

  Casts({String alt, Avatar avatars, String name, String id}) {
    this._alt = alt;
    this._avatars = avatars;
    this._name = name;
    this._id = id;
  }

  String get alt => _alt;

  set alt(String alt) => _alt = alt;

  Avatar get avatars => _avatars;

  set avatars(Avatar avatars) => _avatars = avatars;

  String get name => _name;

  set name(String name) => _name = name;

  String get id => _id;

  set id(String id) => _id = id;

  Casts.fromJson(Map<String, dynamic> json) {
    _alt = json['alt'];
    _avatars =
        json['avatars'] != null ? new Avatar.fromJson(json['avatars']) : null;
    _name = json['name'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this._alt;
    if (this._avatars != null) {
      data['avatars'] = this._avatars.toJson();
    }
    data['name'] = this._name;
    data['id'] = this._id;
    return data;
  }
}
