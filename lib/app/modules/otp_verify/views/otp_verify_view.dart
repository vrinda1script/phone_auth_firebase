import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/otp_verify_controller.dart';

class OtpVerifyView extends GetView<OtpVerifyController> {
  const OtpVerifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Otp Verify'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter Your OTP',
                  style: Get.textTheme.headline6,
                ),
              ],
            ),
            Center(
              child: PinCodeTextField(
                length: 4,
                obscureText: false,
                pinTheme: PinTheme(
                    errorBorderColor: Colors.red,
                    shape: PinCodeFieldShape.box,
                    borderWidth: 2,
                    borderRadius: BorderRadius.circular(5),
                    selectedColor: Colors.white,
                    inactiveFillColor: Colors.grey,
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white),
                keyboardType: TextInputType.number,
                enableActiveFill: true,
                controller: controller.pinCodeTextController,
                onChanged: (value) {},
                appContext: context,
                validator: (value) {
                  if (GetUtils.isNumericOnly(value ?? '') &&
                      value?.length == 4) {
                    return null;
                  } else {
                    return 'invalid';
                  }
                },
                autoDisposeControllers: false,
              ),
            )
          ],
        ));
  }
}
