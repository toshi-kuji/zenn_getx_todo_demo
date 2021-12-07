import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page_not_found'.tr),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.offAllNamed('/home');
          },
          child: Text('to_home'.tr),
        ),
      ),
    );
  }
}
