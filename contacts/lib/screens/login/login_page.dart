import 'package:contacts/routes/app_pages.dart';
import 'package:contacts/constants/colors.dart';
import 'package:contacts/screens/login/login_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Text("Hi there!"),
        Text("Please login to see your contact list"),
        SizedBox(
          height: 50.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
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
        ElevatedButton(
            onPressed: () async {
              controller.loginOnClicked(
                  controller.usernameTextController.text, context);
            },
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
            ))
      ])),
    );
  }
}
