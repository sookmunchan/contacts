import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactDetailsPageController extends GetxController {
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController dobTextController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
  }
}
