import 'dart:convert';

import 'package:contacts/modal/contact_list_data.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  static final _storage = getStorage();

  ///This is needed if we need to expose storage object
  static GetStorage getStorage() {
    return _storage;
  }

  Future<void> initStorage() async {
    await GetStorage.init();
  }
}
