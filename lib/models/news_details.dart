// To parse this JSON data, do
//
//     final newsDetailsModel = newsDetailsModelFromJson(jsonString);

import 'dart:convert';

NewsDetailsModel newsDetailsModelFromJson(String str) => NewsDetailsModel.fromJson(json.decode(str));

String newsDetailsModelToJson(NewsDetailsModel data) => json.encode(data.toJson());

class NewsDetailsModel {
  String? by;
  int? descendants;
  int? id;
  List<int>? kids;
  int? score;
  int? time;
  String? title;
  String? type;
  String? url;

  NewsDetailsModel({
    this.by,
    this.descendants,
    this.id,
    this.kids,
    this.score,
    this.time,
    this.title,
    this.type,
    this.url,
  });

  factory NewsDetailsModel.fromJson(Map<String, dynamic> json) => NewsDetailsModel(
    by: json["by"],
    descendants: json["descendants"],
    id: json["id"],
    kids: json["kids"] == null ? [] : List<int>.from(json["kids"]!.map((x) => x)),
    score: json["score"],
    time: json["time"],
    title: json["title"],
    type: json["type"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "by": by,
    "descendants": descendants,
    "id": id,
    "kids": kids == null ? [] : List<dynamic>.from(kids!.map((x) => x)),
    "score": score,
    "time": time,
    "title": title,
    "type": type,
    "url": url,
  };
}

