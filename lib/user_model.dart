// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  List<String> text;


  UserModel({
    this.text,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
  };
}