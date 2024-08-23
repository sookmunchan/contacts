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
      controller.onInit();
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
            Container(
              padding: EdgeInsets.all(15.0),
              height: 60.0,
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
                onChanged: (value) {
                  print("searchText order: $value");
                  controller.onSearchTextChanged(value);
                },
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
            Obx(() => (controller.contactLists.isNotEmpty)
                ? Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.all(10.0),
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.filterContactLists.length,
                        itemBuilder: (BuildContext context, int index) {
                          String firstC = controller
                                  .filterContactLists[index].firstname?[0] ??
                              "";
                          String lastC = controller
                                  .filterContactLists[index].lastname?[0] ??
                              '';

                          return GestureDetector(
                            onTap: () async {
                              if (controller.isSearch.value) {
                                int index2 = controller.contactLists.indexWhere(
                                    (element) =>
                                        element.id ==
                                        controller
                                            .filterContactLists[index].id);
                                print('index2::$index2');

                                Get.toNamed(Routes.CONTACTDETAILS, arguments: {
                                  'displayName': firstC + lastC,
                                  'isUpdate': true,
                                  'index': index2,
                                });
                              } else {
                                Get.toNamed(Routes.CONTACTDETAILS, arguments: {
                                  'displayName': firstC + lastC,
                                  'isUpdate': true,
                                  'index': index,
                                });
                              }
                            },
                            child: Obx(() => Container(
                                  color: AppColors.primaryWhite,
                                  height: 60.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColors.primaryBlue,
                                        radius: 25.0,
                                        child: ClipOval(
                                          child: Text(
                                              '$firstC'
                                              '$lastC',
                                              style: TextStyle(
                                                  color: AppColors.primaryWhite,
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                          '${controller.filterContactLists[index].firstname} ${controller.filterContactLists[index].lastname}'
                                          '  ${controller.selectedUserId.value == index ? '(you)' : ''}')
                                    ],
                                  ),
                                )),
                          );
                        }))
                : SizedBox.shrink())
          ],
        ),
      );
    });
  }
}
