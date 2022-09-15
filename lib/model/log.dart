// To parse this JSON data, do
//
//     final logModelClass = logModelClassFromJson(jsonString);

import 'dart:convert';

LogModelClass logModelClassFromJson(String str) =>
    LogModelClass.fromJson(json.decode(str));

String logModelClassToJson(LogModelClass data) => json.encode(data.toJson());

class LogModelClass {
  LogModelClass({
    required this.token,
  });

  String? token;

  factory LogModelClass.fromJson(Map<String, dynamic> json) => LogModelClass(
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
      };
}
