import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_auth/app/utils/network.dart';

import 'app/routes/app_pages.dart';



void main()
async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

  Get.lazyPut(
    () => NetworkConnectivity(),
    fenix: true,
  );
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
