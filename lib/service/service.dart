import 'dart:convert';

import 'package:dio/dio.dart';

class AuthServices {
  final dio = Dio(
    BaseOptions(baseUrl: 'http://reqres.in/', responseType: ResponseType.plain),
  );
  //>>>check signin status<<<//
  Future<Response<dynamic>?> checkLogin(signinData) async {
    final response = await dio.post('api/login', data: jsonEncode(signinData));
    return response;
  }
}
