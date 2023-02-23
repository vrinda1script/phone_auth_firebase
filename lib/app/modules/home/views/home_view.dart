import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.orange,
                  child: FlutterLogo(
                    size: Get.height * .1,
                  ),
                )),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Phone Number',
                  style: Get.textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: IntlPhoneField(
                    key: controller.phoneFormKey,
                    controller: controller.phoneNumberTextController,
                    // validator: (value) =>
                    //     GetUtils.isBlank(value)! ? 'invalid value' : '',
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.onSubmit();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    child: Text(
                      'Send OTP',
                      style: Get.textTheme.headline6!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
