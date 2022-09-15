import 'dart:developer';

import 'package:emgenex/view/screenhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/log.dart';
import '../service/service.dart';

class LogInController extends GetxController {
  void userSignin(String email, String password) async {
    if (email == 'eve.holt@reqres.in' && password == 'cityslicka') {
      Map<String, dynamic> signindata = {
        'email': email,
        'password': password,
      };

      final response = await AuthServices().checkLogin(signindata);

      log(response.toString());
      try {
        if (response!.statusCode == 200 || response.statusCode == 201) {
          log('3');
          final datas = logModelClassFromJson(response.data);
          log('4');
          Get.offAll(
            ScreenHome(),
          );

          Get.snackbar(
            'Login sucessfull',
            'user logged',
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            'Login Error',
            'entered mail or password is incorrect',
            snackPosition: SnackPosition.TOP,
            colorText: Colors.red,
          );
        }
      } catch (e) {
        Get.snackbar('Login Error', 'entered mail or password is incorrect',
            snackPosition: SnackPosition.TOP, colorText: Colors.red);
      }
    } else {
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          'Login Error',
          'please enter valid admin data',
          colorText: Colors.red);
      return;
    }
  }
}
