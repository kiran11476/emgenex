import 'dart:developer';

import 'package:emgenex/service/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    AuthServices().getuser();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: SizedBox(
        height: 500,
        child: GetBuilder<ProductController>(
          init: ProductController(),
          initState: (_) {},
          builder: (controller) => controller.users == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.users!.length,
                  itemBuilder: (BuildContext context, index) {
                    return ListTile(
                      title: Text(controller.users![index].name),
                    );
                  }),
        ),
      ),
    );
  }
}
