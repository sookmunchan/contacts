import 'package:contacts/constants/colors.dart';
import 'package:contacts/screens/home/tabs/contact_list/details/contact_details_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactDetailsPage extends StatelessWidget {
  const ContactDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactDetailsPageController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: AppColors.primaryWhite,
          title: const Text('Contact Details'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          padding: EdgeInsets.symmetric(vertical: 15.0),
          color: AppColors.primaryWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryBlue,
                radius: 50.0,
                child: ClipOval(
                  child: Text('AS'),
                ),
              ),
              _mainInfoWidget(controller),
              _subInfoWidget(controller),
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: ElevatedButton(
                    onPressed: () async {},
                    child: Text(controller.isUpdate.value ? "Update" : "Save",
                        style: TextStyle(
                          color: AppColors.primaryWhite,
                        )),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                    )),
              ),
              controller.isUpdate.value
                  ? Container(
                      width: Get.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: ElevatedButton(
                          onPressed: () async {},
                          child: Text('Remove',
                              style: TextStyle(
                                color: AppColors.primaryRed,
                              )),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryTransparent,
                          )),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      );
    });
  }

  Widget _mainInfoWidget(ContactDetailsPageController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          Text('Main Information'),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 1.0,
            color: AppColors.primaryLightGray,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: controller.firstNameTextController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                floatingLabelStyle:
                    const TextStyle(color: AppColors.primaryBlack),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryBlue),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryBlue),
                ),
                hoverColor: AppColors.primaryBlue,
                fillColor: AppColors.primaryBlue,
                focusColor: AppColors.primaryBlue,
                labelText: controller.isUpdate.value
                    ? controller.listData.value.firstname
                    : "Enter first name",
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: controller.lastNameTextController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                floatingLabelStyle:
                    const TextStyle(color: AppColors.primaryBlack),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryBlue),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryBlue),
                ),
                hoverColor: AppColors.primaryBlue,
                fillColor: AppColors.primaryBlue,
                focusColor: AppColors.primaryBlue,
                labelText: controller.isUpdate.value
                    ? controller.listData.value.lastname
                    : "Enter last name",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _subInfoWidget(ContactDetailsPageController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          Text('Sub Information'),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 1.0,
            color: AppColors.primaryLightGray,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: controller.emailTextController,
              decoration: InputDecoration(
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
                labelText: controller.isUpdate.value
                    ? controller.listData.value.email ?? ""
                    : "Enter email",
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: controller.dobTextController,
              decoration: InputDecoration(
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
                labelText: controller.isUpdate.value
                    ? controller.listData.value.dob ?? ""
                    : "Enter birthday",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
