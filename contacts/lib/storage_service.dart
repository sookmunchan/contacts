import 'dart:convert';

import 'package:contacts/modal/contact_list_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final storage = GetStorage();

  Future<void> initStorage() async {
    await GetStorage.init();
  }

  Future<void> storeSelectedUserIndex(int index) async {
    return await storage.write('selectedUserIndex', index);
  }

  Future<int> getUserIndex() async {
    return await storage.read('selectedUserIndex') ?? -1;
  }

  Future<void> storeUserInfo(ContactListData userInfo) async {
    await storage.write('userInfo', jsonEncode(userInfo));
  }

  Future<void> storeContactList(List<ContactListData> contactList) async {
    await storage.write('contactLists', jsonEncode(contactList));
  }

  List<ContactListData> getContactLists() {
    if (storage.read('contactLists') == null) {
      return <ContactListData>[];
    }

    return (jsonDecode(storage.read('contactLists')) as List<dynamic>)
        .map((e) => ContactListData.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> insertData(ContactListData listData) async {
    List<ContactListData>? contactLists =
        (jsonDecode(storage.read('contactLists')) as List<dynamic>)
            .map((e) => ContactListData.fromJson(e as Map<String, dynamic>))
            .toList();

    contactLists.add(listData);

    await storage.write('contactLists', jsonEncode(contactLists));
  }

  Future<void> updateData(ContactListData listData) async {
    List<ContactListData>? contactLists =
        (jsonDecode(storage.read('contactLists')) as List<dynamic>)
            .map((e) => ContactListData.fromJson(e as Map<String, dynamic>))
            .toList();

    int index = contactLists.indexWhere((element) => element.id == listData.id);
    contactLists[index] = listData;
    print("contactLists::${contactLists[index].lastname}");
    print("listData::${listData.lastname}");
    await storage.write('contactLists', jsonEncode(contactLists));
  }

  Future<void> removeData(ContactListData listData) async {
    List<ContactListData>? contactLists =
        (jsonDecode(storage.read('contactLists')) as List<dynamic>)
            .map((e) => ContactListData.fromJson(e as Map<String, dynamic>))
            .toList();

    int index = contactLists.indexWhere((element) => element.id == listData.id);
    contactLists.removeAt(index);
    await storage.write('contactLists', jsonEncode(contactLists));
  }

  Future<void> deleteData() async {
    await storage.remove('contactLists');
    await storage.remove('userInfo');
    await storage.remove('selectedUserIndex');
  }
}
