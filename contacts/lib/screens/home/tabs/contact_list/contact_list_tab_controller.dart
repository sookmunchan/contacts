import 'dart:convert';

import 'package:contacts/modal/contact_list_data.dart';
import 'package:contacts/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ContactListTabController extends GetxController {
  TextEditingController searchTextController = TextEditingController();
  RxList<ContactListData> contactLists = <ContactListData>[].obs;
  RxList<ContactListData> filterContactLists = <ContactListData>[].obs;
  RxBool isSearch = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    contactLists.value = StorageService().getContactLists();
    contactLists.refresh();

    filterContactLists.value =
        List<ContactListData>.from(contactLists.toList());

    print("listtab::${contactLists.length}");
  }

  onSearchTextChanged(String searchQuery) async {
    if (searchQuery.isNotEmpty) {
      isSearch.value = true;
      filterContactLists.value = List<ContactListData>.from(contactLists
          .where((element) => '${element.firstname}${element.lastname}'
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList());
    } else {
      isSearch.value = false;
      filterContactLists.value =
          List<ContactListData>.from(contactLists.toList());
    }

    print("filterContactLists::${filterContactLists.length}");
  }
}
