import 'package:contacts/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  TextEditingController usernameTextController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> loginOnClicked(String usernameStr, BuildContext context) async {
    // if (usernameStr.isNotEmpty && usernameStr.length > 10) {
    await Get.offAndToNamed(Routes.HOME);
    // } else {
    // const snackBar = SnackBar(
    // content: Text('Yay! A SnackBar!'),
    // );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // }
  }
}
