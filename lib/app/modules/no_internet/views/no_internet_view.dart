import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/no_internet_controller.dart';

class NoInternetView extends GetView<NoInternetController> {
  const NoInternetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea
    (
      child: Scaffold(
       
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Icon(Icons.signal_wifi_statusbar_connected_no_internet_4_sharp,
            color: Colors.red,
            size: 150,),
            Text('Not Internet Available',style: Get.textTheme.headline4,)
          ],),
        )
      ),
    );
  }
}
