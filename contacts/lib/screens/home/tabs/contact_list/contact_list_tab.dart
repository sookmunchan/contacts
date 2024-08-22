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
            Get.toNamed(Routes.CONTACTDETAILS, arguments: {'isUpdate': false});
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
            Obx(() => Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.contactLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      String firstC =
                          controller.contactLists[index].firstname![0];
                      String lastC =
                          controller.contactLists[index].lastname![0];

                      return GestureDetector(
                        onTap: () async {
                          Get.toNamed(Routes.CONTACTDETAILS, arguments: {
                            'item': controller.contactLists[index],
                            'isUpdate': true
                          });
                        },
                        child: Container(
                          height: 60.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.primaryBlue,
                                radius: 25.0,
                                child: ClipOval(
                                  child: Text('$firstC' '$lastC'),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                  '${controller.contactLists[index].firstname} ${controller.contactLists[index].lastname}')
                            ],
                          ),
                        ),
                      );
                    })))
          ],
        ),
      );
    });
  }
}
