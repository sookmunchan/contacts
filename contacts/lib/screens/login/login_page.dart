import 'package:contacts/routes/app_pages.dart';
import 'package:contacts/constants/colors.dart';
import 'package:contacts/screens/login/login_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginPageController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Hi there!",
              style: TextStyle(
                  color: AppColors.primaryBlack,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold)),
          Text("Please login to see your contact list",
              style: TextStyle(
                  color: AppColors.primaryBlack,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 30.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextField(
              controller: controller.usernameTextController,
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
                labelText: "User ID",
              ),
            ),
          ),
          Container(
            width: Get.width - 20.0,
            child: ElevatedButton(
                onPressed: () async {
                  controller.loginOnClicked(
                      controller.usernameTextController.text, context);
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: AppColors.primaryWhite),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                )),
          )
        ])),
      );
    });
  }
}
