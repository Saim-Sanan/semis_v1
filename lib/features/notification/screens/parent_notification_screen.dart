import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/animated_loader.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/notification/controller/notification_controller.dart';
import 'package:semis/widgets/notification_tile.dart';

class ParentNotificationScreen extends StatefulWidget {
  const ParentNotificationScreen({Key? key}) : super(key: key);

  @override
  State<ParentNotificationScreen> createState() =>
      _ParentNotificationScreenState();
}

class _ParentNotificationScreenState extends State<ParentNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final dynamic arg = Get.arguments;
    final NotificationController notificationController =
        arg['notification_controller'];

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
      body: Obx(() {
        return notificationController.isLoading.value
            ? const AnimatedLoader2()
            : Padding(
                padding: EdgeInsets.only(
                  left: Get.height * 0.02,
                  right: Get.height * 0.02,
                  top: Get.height * 0.01,
                ),
                child: ListView(
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
                    if (notificationController.thisWeekNotifications.isNotEmpty)
                      Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "This Week",
                                style: TextStyle(
                                  fontSize: Get.height * 0.028,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (notificationController
                                  .todayNotifications.isEmpty)
                                const Icon(
                                  Icons.sort,
                                  color: Pallete.blueColor,
                                  size: 30,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ...notificationController.thisWeekNotifications.map(
                      (thisWeekNotification) =>
                          NotificationTile(notification: thisWeekNotification),
                    ),
                    if (notificationController.olderNotifications.isNotEmpty)
                      Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Older",
                                style: TextStyle(
                                  fontSize: Get.height * 0.028,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (notificationController
                                      .todayNotifications.isEmpty &&
                                  notificationController
                                      .thisWeekNotifications.isEmpty)
                                const Icon(
                                  Icons.sort,
                                  color: Pallete.blueColor,
                                  size: 30,
                                )
                            ],
                          ),
                        ],
                      ),
                    ...notificationController.olderNotifications.map(
                      (olderNotification) =>
                          NotificationTile(notification: olderNotification),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
