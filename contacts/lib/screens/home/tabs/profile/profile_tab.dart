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
        body: Container(
          width: Get.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My profiles',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: AppColors.primaryBlack,
                          decoration: TextDecoration.none),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Logout',
                          style: TextStyle(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primaryBlue,
                      radius: 50.0,
                      child: ClipOval(
                        child: Text('AS'),
                        // child: avatarImgUrl != null && avatarImgUrl!.isNotEmpty
                        //     ? CachedNetworkImage(
                        //         imageUrl: avatarImgUrl!,
                        //         fit: BoxFit.fill,
                        //         errorWidget: (context, url, error) =>
                        //             EmptyImageWidget(),
                        //         placeholder: (context, url) => EmptyImageWidget(),
                        //       )
                        //     : Center(
                        //         child: Text(
                        //         username ?? "",
                        //         style: AppTextStyles.medium_h3
                        //             .copyWith(color: AppColors.white),
                        //       )),
                      ),
                    ),
                    Text('Name'),
                    Text('email'),
                    Text('dob'),
                    Container(
                      width: Get.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: ElevatedButton(
                          onPressed: () async {
                            Get.toNamed(Routes.CONTACTDETAILS);
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
        ),
      );
    });
  }
}
