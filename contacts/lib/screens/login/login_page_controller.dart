import 'dart:convert';

import 'package:contacts/constants/colors.dart';
import 'package:contacts/modal/contact_list_data.dart';
import 'package:contacts/routes/app_pages.dart';
import 'package:contacts/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  TextEditingController usernameTextController = TextEditingController();
  RxList<ContactListData> contactLists = <ContactListData>[].obs;
  Rx<ContactListData> userInfo = ContactListData().obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    getContactLists();
  }

  Future<void> getContactLists() async {
    int selectedUserId = await StorageService().getUserIndex();
    print('selectedUserId::${selectedUserId}');
    final String response = await rootBundle.loadString('assets/data.json');

    contactLists.value = (jsonDecode(response) as List<dynamic>)
        .map((e) => ContactListData.fromJson(e as Map<String, dynamic>))
        .toList();
    contactLists.sort((a, b) => a.firstname!.toLowerCase().compareTo(
          b.firstname!.toLowerCase(),
        ));
    contactLists.refresh();
    await StorageService().storeContactList(contactLists);

    if (selectedUserId >= 0) {
      await Get.offAndToNamed(Routes.HOME);
    }
  }

  Future<void> loginOnClicked(String usernameStr, BuildContext context) async {
    if (usernameStr.isNotEmpty && usernameStr.length > 10) {
      int index =
          contactLists.indexWhere((element) => element.id == usernameStr);
      print('isLogin::$index');

      if (index >= 0) {
        await StorageService().storeUserInfo(contactLists[index]);
        await StorageService().storeSelectedUserIndex(index);
        await Get.offAndToNamed(Routes.HOME);
      }
    } else {
      const snackBar = SnackBar(
        backgroundColor: AppColors.primaryRed,
        content: Text('Username format is not correct'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
