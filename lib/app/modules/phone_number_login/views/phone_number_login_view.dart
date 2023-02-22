import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/phone_number_login_controller.dart';

class PhoneNumberLoginView extends GetView<PhoneNumberLoginController> {
  const PhoneNumberLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhoneNumberLoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PhoneNumberLoginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
