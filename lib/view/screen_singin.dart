import 'dart:developer';

import 'package:emgenex/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/background.dart';
import '../controller/email_controller.dart';
import '../controller/validator.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);

  final loginController = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CupertinoColors.systemGrey5,
        body: SafeArea(
          child: Stack(
            children: [
              const BackgroundImage(
                  image:
                      'https://img.freepik.com/free-photo/red-black-brush-stroke-banner-background-perfect-canva_1361-3597.jpg?size=626&ext=jpg'),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hey ,\nLogin Now.',
                        style: GoogleFonts.dosis(
                          textStyle: TextStyle(
                            color: Theme.of(context).canvasColor,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: CupertinoTextFormFieldRow(
                      validator: (mail) {
                        validController.mailValidation(mail!);
                      },
                      controller: _mailController,
                      placeholder: 'Enter your Email',
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: CupertinoColors.white,
                          border: Border.all(color: CupertinoColors.white)),
                    ),
                  ),
                  CupertinoTextFormFieldRow(
                    validator: (password) {
                      validController.passwordValidation(password!);
                    },
                    controller: _passwordController,
                    obscureText: true,
                    placeholder: 'Enter your password',
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: CupertinoColors.white,
                        border: Border.all(
                            color: Theme.of(context).backgroundColor)),
                  ),
                  CupertinoButton(
                    color: const Color.fromARGB(147, 227, 237, 229),
                    onPressed: signinButtonPressed,
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void signinButtonPressed() {
    final mail = _mailController.text.trim();
    final password = _passwordController.text.trim();
    if (mail.isEmpty || password.isEmpty) {
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          'fill the field',
          'Every Fields Are Required',
          colorText: Colors.red);
      return;
    } else {
      authController.userSignin(mail, password);
    }
  }

  final validController = Get.put(ValidationController());
  final authController = Get.put(LogInController());
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
}
