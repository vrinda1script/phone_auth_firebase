import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/network.dart';

class PhoneNumberLoginController extends GetxController {
  late TextEditingController phoneNumberTextController;
  final phoneFormKey = GlobalKey<FormState>();

  late Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';

  @override
  void onInit() {
    phoneNumberTextController = TextEditingController();

    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      print('source $_source');
      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string =
              _source.values.toList()[0] ? 'Mobile: Online' : 'Mobile: Offline';
          break;
        case ConnectivityResult.wifi:
          string =
              _source.values.toList()[0] ? 'WiFi: Online' : 'WiFi: Offline';
          break;
        case ConnectivityResult.none:
        default:
          string = 'Offline';
      }

      super.onInit();
    });
  }

  @override
  void onClose() {
    phoneNumberTextController.dispose();
    _networkConnectivity.disposeStream();

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
  }
}
