import 'package:firebase_auth/firebase_auth.dart';
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

  void onSubmit() async {
    Get.toNamed(
      Routes.OTP_VERIFY,
    );
    debugPrint(phoneNumberTextController.text);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumberTextController.text,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        Get.toNamed(Routes.OTP_VERIFY, arguments: verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    // Get.toNamed(Routes.OTP_VERIFY);
  }
}
