import 'package:contacts/constants/colors.dart';
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
          color: Colors.white,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My profiles',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: AppColors.primaryBlack,
                    decoration: TextDecoration.none),
              ),
            ],
          ),
        ),
      );
    });
  }
}
