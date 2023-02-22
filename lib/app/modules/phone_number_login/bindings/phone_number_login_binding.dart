import 'package:get/get.dart';

import '../controllers/phone_number_login_controller.dart';

class PhoneNumberLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneNumberLoginController>(
      () => PhoneNumberLoginController(),
    );
  }
}
