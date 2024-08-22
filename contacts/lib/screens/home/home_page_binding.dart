import 'package:contacts/screens/home/tabs/contact_list/contact_list_tab_controller.dart';
import 'package:contacts/screens/home/home_page_controller.dart';
import 'package:contacts/screens/home/tabs/contact_list/details/contact_details_page_controller.dart';
import 'package:contacts/screens/home/tabs/profile/profile_tab_controller.dart';
import 'package:get/get.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
    );
    Get.lazyPut<ContactListTabController>(
      () => ContactListTabController(),
    );
    Get.lazyPut<ProfileTabController>(
      () => ProfileTabController(),
    );
    Get.lazyPut<ContactDetailsPageController>(
      () => ContactDetailsPageController(),
    );
  }
}
