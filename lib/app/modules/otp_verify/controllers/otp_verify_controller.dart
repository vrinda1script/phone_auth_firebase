import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:otp_auth/app/routes/app_pages.dart';

class OtpVerifyController extends GetxController {
  late TextEditingController pinCodeTextController;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String? verify = Get.arguments;

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

  void onVerifyOTP() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verify!, smsCode: pinCodeTextController.text);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      Get.toNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar('error', 'Invalid Info');
    }
  }
}
