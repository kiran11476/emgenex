import 'package:emgenex/model/signin.dart';
import 'package:emgenex/view/screenhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/service.dart';

class LogInController extends GetxController {
  void userSignin(String email, String password) async {
    Map<String, dynamic> signIn = {"email": email, "password": password};
    try {
      final response = await AuthServices().checkLogin(signIn);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        SignInModelClass datas = signInModelClassFromJson(response.data);

        Get.offAll(
          const ScreenHome(),
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
  }
}
