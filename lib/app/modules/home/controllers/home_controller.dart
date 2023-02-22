import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:otp_auth/app/routes/app_pages.dart';

class HomeController extends GetxController {
  late TextEditingController phoneNumberTextController;
  final phoneFormKey = GlobalKey<FormState>();

  final count = 0.obs;
  @override
  void onInit() {
    phoneNumberTextController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    phoneNumberTextController.dispose();
    super.onClose();
  }

  void onSubmitCheck() {
    if (phoneFormKey.currentState?.validate() ?? false) {
      if (phoneNumberTextController.toString().length == 10) {
        onSubmit();
      }
    }
  }

  void onSubmit() {
    Get.toNamed(Routes.OTP_VERIFY);
  }
}
