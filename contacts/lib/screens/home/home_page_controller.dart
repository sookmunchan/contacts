import 'dart:convert';

import 'package:contacts/modal/contact_list_data.dart';
import 'package:contacts/screens/home/tabs/profile/profile_tab_controller.dart';
import 'package:contacts/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController
    with GetTickerProviderStateMixin {
  TextEditingController searchTextController = TextEditingController();
  ProfileTabController profilePageController = Get.find();
  RxInt currentIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
  }
}
