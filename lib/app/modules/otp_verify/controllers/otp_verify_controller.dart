import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpVerifyController extends GetxController {
  late TextEditingController pinCodeTextController;

  @override
  void onInit() {
    pinCodeTextController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    pinCodeTextController.dispose();
    super.onClose();
  }
}
