import 'package:contacts/screens/home/tabs/contact_list/details/contact_details_page_controller.dart';
import 'package:get/get.dart';

class ContactDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactDetailsPageController>(
        () => ContactDetailsPageController());
  }
}
