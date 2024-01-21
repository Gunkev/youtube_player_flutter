import 'dart:convert';

class VideoModel {
  int? id;
  String? name;
  String? url;

  VideoModel(this.id, this.name, this.url);

  VideoModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name= json['name'].toString();
    url = json['url'];

  }
}