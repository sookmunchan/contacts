import 'package:contacts/constants/colors.dart';
import 'package:contacts/routes/app_pages.dart';
import 'package:contacts/screens/home/tabs/contact_list/contact_list_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListTab extends StatelessWidget {
  const ContactListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactListTabController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.primaryWhite,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryBlue,
          shape: CircleBorder(),
          onPressed: () {
            Get.toNamed(Routes.CONTACTDETAILS);
          },
          child: Icon(
            Icons.add,
            color: AppColors.primaryWhite,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100.0,
              child: Text(
                'My Contacts',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: AppColors.primaryBlack,
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: controller.searchTextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  floatingLabelStyle: TextStyle(color: AppColors.primaryBlack),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryBlue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryBlue),
                  ),
                  hoverColor: AppColors.primaryBlue,
                  fillColor: AppColors.primaryBlue,
                  focusColor: AppColors.primaryBlue,
                  labelText: "Search your contact list",
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
