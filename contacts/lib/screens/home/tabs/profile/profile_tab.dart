import 'package:contacts/constants/colors.dart';
import 'package:contacts/routes/app_pages.dart';
import 'package:contacts/screens/home/tabs/profile/profile_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileTabController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: AppColors.primaryWhite,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'My Profile',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: AppColors.primaryBlack,
                    decoration: TextDecoration.none),
              ),
              TextButton(
                  onPressed: () {
                    controller.logoutOnClicked();
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
        body: Obx(() => Container(
              width: Get.width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.primaryBlue,
                          radius: 50.0,
                          child: ClipOval(
                            child: Text(
                              controller.displayName.value,
                              style: TextStyle(
                                  color: AppColors.primaryWhite,
                                  fontSize: 30.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                            '${controller.userInfo.value.firstname} ${controller.userInfo.value.lastname}',
                            style: TextStyle(
                                color: AppColors.primaryBlack, fontSize: 20.0)),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text('${controller.userInfo.value.email ?? ' - '}',
                            style: TextStyle(
                                color: AppColors.primaryBlack, fontSize: 15.0)),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text('${controller.userInfo.value.dob ?? ' - '}',
                            style: TextStyle(
                                color: AppColors.primaryBlack, fontSize: 15.0)),
                        Container(
                          width: Get.width,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          child: ElevatedButton(
                              onPressed: () async {
                                controller.updateDetailOnClicked();
                              },
                              child: Text('Update my detail',
                                  style: TextStyle(
                                    color: AppColors.primaryWhite,
                                  )),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBlue,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      );
    });
  }
}
