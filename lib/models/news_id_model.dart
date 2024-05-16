// To parse this JSON data, do
//
//     final newsIdModel = newsIdModelFromJson(jsonString);

import 'dart:convert';

List<int> newsIdModelFromJson(String str) => List<int>.from(json.decode(str).map((x) => x));

String newsIdModelToJson(List<int> data) => json.encode(List<dynamic>.from(data.map((x) => x)));