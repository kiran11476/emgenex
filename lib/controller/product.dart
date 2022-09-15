import 'dart:developer';

import 'package:emgenex/service/service.dart';
import 'package:get/get.dart';

import '../model/productmode.dart';

class ProductController extends GetxController {
  List<Datum>? users;
  getUser() async {
    try {
      final response = await AuthServices().getuser();

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final data = productModelClassFromJson(response.data);
        users = data.data;
        update();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }
}
