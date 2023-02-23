import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 110,
                backgroundColor: Colors.orange,
                child: FlutterLogo(
                  size: Get.height * .2,
                ),
              ),
              Text(
                'WELCOME',
                style: Get.textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
