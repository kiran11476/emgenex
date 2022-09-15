// To parse this JSON data, do
//
//     final signInModelClass = signInModelClassFromJson(jsonString);

import 'dart:convert';

SignInModelClass signInModelClassFromJson(String str) =>
    SignInModelClass.fromJson(json.decode(str));

String signInModelClassToJson(SignInModelClass data) =>
    json.encode(data.toJson());

class SignInModelClass {
  SignInModelClass({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory SignInModelClass.fromJson(Map<String, dynamic> json) =>
      SignInModelClass(
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "password": password == null ? null : password,
      };
}
