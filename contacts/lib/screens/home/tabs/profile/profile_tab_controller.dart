import 'package:contacts/modal/contact_list_data.dart';
import 'package:contacts/routes/app_pages.dart';
import 'package:contacts/storage_service.dart';
import 'package:get/get.dart';

class ProfileTabController extends GetxController {
  Rx<ContactListData> userInfo = ContactListData().obs;
  RxString displayName = ''.obs;
  int selectedUserId = -1;
  RxList<ContactListData> contactLists = <ContactListData>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    contactLists.value = StorageService().getContactLists();

    if (contactLists.isNotEmpty) {
      selectedUserId = await StorageService().getUserIndex();
      userInfo.value = contactLists[selectedUserId];
      userInfo.refresh();

      print('userinfo::${userInfo.value.firstname}');
      print('selectedUserId::${selectedUserId}');
      displayName.value =
          '${userInfo.value.firstname?[0]}${userInfo.value.lastname?[0]}';
    }
  }

  Future<void> logoutOnClicked() async {
    await StorageService().deleteData();
    Get.offAndToNamed(Routes.LOGIN);
  }

  updateDetailOnClicked() {
    Get.toNamed(Routes.CONTACTDETAILS, arguments: {
      'displayName': displayName.value,
      'isUpdate': true,
      'index': selectedUserId,
      'isMe': true,
    });
  }
}
