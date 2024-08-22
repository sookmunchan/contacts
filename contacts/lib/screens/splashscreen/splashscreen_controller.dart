
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class SplashscreenController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(const Duration(milliseconds: 1000));
    String currentRouteStr = Get.currentRoute;
    print("getroute::${currentRouteStr}");

   Get.offAndToNamed(Routes.LOGIN);
  }
}
