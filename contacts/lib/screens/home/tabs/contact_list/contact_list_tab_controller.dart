import 'dart:convert';

import 'package:contacts/modal/contact_list_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ContactListTabController extends GetxController {
  TextEditingController searchTextController = TextEditingController();
  RxList<ContactListData> contactLists = <ContactListData>[].obs;

  @override
  void onInit() async {
    super.onInit();

    readJson();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');

    contactLists.value = (jsonDecode(response) as List<dynamic>)
        .map((e) => ContactListData.fromJson(e as Map<String, dynamic>))
        .toList();
    contactLists.refresh();

    print("contactList::${contactLists.length}");
  }
}
