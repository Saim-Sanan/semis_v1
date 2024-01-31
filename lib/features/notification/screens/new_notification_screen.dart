import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/notification/controller/notification_controller.dart';
import 'package:semis/widgets/notification_tile.dart';

class NewNotificationScreen extends StatelessWidget {
  const NewNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController =
        Get.find<NotificationController>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height * 0.1,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_sharp,
          ),
        ),
        title: const Text(
          "Notifications",
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Pallete.blueColor, // Set the background color
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: Get.height * 0.02,
          right: Get.height * 0.02,
          top: Get.height * 0.01,
        ),
        child: notificationController.todayNotifications.isNotEmpty
            ? ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  if (notificationController.todayNotifications.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today",
                          style: TextStyle(
                            fontSize: Get.height * 0.028,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(
                          Icons.sort,
                          color: Pallete.blueColor,
                          size: 30,
                        )
                      ],
                    ),
                  ...notificationController.todayNotifications.map(
                    (todayNotification) =>
                        NotificationTile(notification: todayNotification),
                  ),
                ],
              )
            : const Center(
                child: Text("No new notifications"),
              ),
      ),
    );
  }
}
