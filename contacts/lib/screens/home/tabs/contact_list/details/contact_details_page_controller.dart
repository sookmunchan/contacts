import 'package:contacts/modal/contact_list_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactDetailsPageController extends GetxController {
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController dobTextController = TextEditingController();
  Rx<ContactListData> listData = ContactListData().obs;
  RxBool isUpdate = false.obs;

  @override
  void onInit() async {
    super.onInit();

    if (Get.arguments['isUpdate'] != null) {
      isUpdate.value = Get.arguments['isUpdate'];

      if (isUpdate.value) {
        listData.value = Get.arguments['item'];

        print("listData:: ${listData.value.firstname}");
      }
    } else {
      isUpdate.value = false;
    }
  }
}
