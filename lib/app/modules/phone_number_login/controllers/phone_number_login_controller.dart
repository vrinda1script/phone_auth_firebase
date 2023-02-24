import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_auth/app/utils/network.dart';

import '../../../routes/app_pages.dart';

class PhoneNumberLoginController extends GetxController {
  late TextEditingController phoneNumberTextController;
  final phoneFormKey = GlobalKey<FormState>();
   final _networkCheck = Get.find<NetworkConnectivity>();

  //late Map _source = {ConnectivityResult.none: false};
  //final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';

  @override
  void onInit() {
    phoneNumberTextController = TextEditingController();

    // _networkConnectivity.initialise();
    // _networkConnectivity.myStream.listen((source) {
    //   _source = source;
    //   print('source $_source');
    //   // 1.
    //   switch (_source.keys.toList()[0]) {
    //     case ConnectivityResult.mobile:
    //       string =
    //           _source.values.toList()[0] ? 'Mobile: Online' : 'Mobile: Offline';
    //       break;
    //     case ConnectivityResult.wifi:
    //       string =
    //           _source.values.toList()[0] ? 'WiFi: Online' : 'WiFi: Offline';
    //       break;
    //     case ConnectivityResult.none:
    //     default:
    //       string = 'Offline';
    // }

      super.onInit();
    }
  @override
  void onClose() {
   phoneNumberTextController.dispose();
    super.onClose();
  }

 void onSubmitNumber(phoneNumber){
  phoneNumberTextController.text=phoneNumber;

 }

  void onSubmit() async {
    Get.toNamed(
      Routes.OTP_VERIFY,
    );
    debugPrint(phoneNumberTextController.text);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumberTextController.text,
      verificationCompleted: (PhoneAuthCredential credential) {
        
      },
      verificationFailed: (FirebaseAuthException e) {
         if (e.code == 'invalid-phone-number') {
      debugPrint('The provided phone number is not valid.');}
      },
       codeSent: (String verificationId, int? resendToken) async {
    // Update the UI - wait for the user to enter the SMS code
    String smsCode = '123456';

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
   // await auth.signInWithCredential(credential);
  },
      // codeSent: (String verificationId, int? resendToken) {
      //    String smsCode = 'xxxx';
      //   Get.toNamed(Routes.OTP_VERIFY, arguments: verificationId);
      // },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
