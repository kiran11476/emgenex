import 'dart:convert';

import 'package:dio/dio.dart';

// https://reqres.in/api/unknown
class AuthServices {
  final dio = Dio(
    BaseOptions(
        baseUrl: 'https://reqres.in/', responseType: ResponseType.plain),
  );
  //>>>check signin status<<<//
  Future<Response<dynamic>?> checkLogin(signinData) async {
    final response = await dio.post('api/login', data: jsonEncode(signinData));
    return response;
  }

  Future<Response<dynamic>?> getuser() async {
    final response = await dio.get('api/unknown');

    return response;
  }
}
