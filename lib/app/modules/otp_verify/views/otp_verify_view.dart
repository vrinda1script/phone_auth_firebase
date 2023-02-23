import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:otp_auth/app/routes/app_pages.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/otp_verify_controller.dart';

class OtpVerifyView extends GetView<OtpVerifyController> {
  const OtpVerifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Otp Verify'),
            centerTitle: true,
          ),
          body: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              const SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter Your OTP',
                    style: Get.textTheme.headline6,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: PinCodeTextField(
                  length: 6,
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
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () {
                    controller.onVerifyOTP();
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: Text(
                    'Verify Otp',
                    style:
                        Get.textTheme.headline6!.copyWith(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(Routes.PHONE_NUMBER_LOGIN),
                    child: Text(
                      'Edit your Phone Number',
                      style: Get.textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
