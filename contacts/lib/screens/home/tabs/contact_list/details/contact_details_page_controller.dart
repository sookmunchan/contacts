import 'dart:convert';

import 'package:contacts/constants/colors.dart';
import 'package:contacts/modal/contact_list_data.dart';
import 'package:contacts/screens/home/tabs/contact_list/contact_list_tab.dart';
import 'package:contacts/screens/home/tabs/contact_list/contact_list_tab_controller.dart';
import 'package:contacts/screens/home/tabs/profile/profile_tab_controller.dart';
import 'package:contacts/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ContactDetailsPageController extends GetxController {
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController dobTextController = TextEditingController();
  RxBool isUpdate = false.obs;
  RxString displayName = "".obs;
  RxInt selectedIndex = 0.obs;
  RxBool isMe = false.obs;
  RxList<ContactListData> contactLists = <ContactListData>[].obs;

  @override
  void onInit() async {
    super.onInit();

    if (Get.arguments['isMe'] != null) {
      isMe.value = Get.arguments['isMe'];
    } else {
      isMe.value = false;
    }

    if (Get.arguments['isUpdate'] != null) {
      contactLists.value = StorageService().getContactLists();
      print("contactLists::${contactLists.value}");
      isUpdate.value = Get.arguments['isUpdate'];

      if (isUpdate.value) {
        displayName.value = Get.arguments['displayName'];
        selectedIndex.value = Get.arguments['index'];

        firstNameTextController.text =
            contactLists[selectedIndex.value].firstname!;
        lastNameTextController.text =
            contactLists[selectedIndex.value].lastname!;
        emailTextController.text =
            contactLists[selectedIndex.value].email ?? "";
        dobTextController.text = contactLists[selectedIndex.value].dob ?? "";
      }
    } else {
      isUpdate.value = false;
    }
  }

  Future<void> updateData() async {
    contactLists[selectedIndex.value].firstname = firstNameTextController.text;
    contactLists[selectedIndex.value].lastname = lastNameTextController.text;
    contactLists[selectedIndex.value].email = emailTextController.text;
    contactLists[selectedIndex.value].dob = dobTextController.text;

    await StorageService()
        .updateData(contactLists[selectedIndex.value])
        .then((value) async {
      await Get.find<ContactListTabController>().onInit().then((value) async {
        await Get.find<ProfileTabController>().onInit().then((value) async {
          Get.back();
        });
      });
    });
  }

  Future<void> insertData(BuildContext context) async {
    if (firstNameTextController.text.length > 5 &&
        lastNameTextController.text.length > 5) {
      ContactListData listData = ContactListData(
          id: '${DateTime.now().millisecond}',
          firstname: firstNameTextController.text,
          lastname: lastNameTextController.text,
          email: emailTextController.text,
          dob: dobTextController.text);

      await StorageService().insertData(listData).then((value) async {
        await Get.find<ContactListTabController>()
            .onInit()
            .then((value) => Get.back());
      });
    } else {
      const snackBar = SnackBar(
        backgroundColor: AppColors.primaryRed,
        content: Text('Firstname and lastname format not correct'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> deleteData() async {
    await StorageService()
        .removeData(contactLists[selectedIndex.value])
        .then((value) async {
      await Get.find<ContactListTabController>()
          .onInit()
          .then((value) => Get.back());
    });
  }
}
