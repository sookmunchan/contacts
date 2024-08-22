import 'package:contacts/constants/colors.dart';
import 'package:contacts/screens/home/tabs/contact_list/contact_list_tab.dart';
import 'package:contacts/screens/home/home_page_controller.dart';
import 'package:contacts/screens/home/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              backgroundColor: AppColors.primaryWhite,
              currentIndex: controller.currentIndex.value,
              onTap: (index) {
                controller.currentIndex.value = index;
                print('test index::$index');
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
            )),
        body: SafeArea(
            child: Obx(() => IndexedStack(
                  index: controller.currentIndex.value,
                  children: [
                    ContactListTab(),
                    ProfileTab(),
                  ],
                ))),
      );
    });
  }
}
