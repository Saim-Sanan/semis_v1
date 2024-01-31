import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/models/notification.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({Key? key, required this.notification})
      : super(key: key);

  final ParentNotification notification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Get.height * 0.015,
        // bottom: Get.height * 0.009,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Get.height * 0.015),
        child: Container(
          height: Get.height * 0.13,
          padding: EdgeInsets.only(
            left: Get.height * 0.02,
            right: Get.height * 0.02,
          ),
          decoration: BoxDecoration(
            border: const Border(
              left: BorderSide(
                color: Pallete.blueColor,
                width: 5,
              ),
            ),
            color: isInToday(notification.issueDate!)
                ? Pallete.blueColor.withOpacity(0.08)
                : Pallete.blueColor.withOpacity(0.03),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/calendar.png",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    dateFormater(notification.issueDate!),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: Get.height * 0.028),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Get.height * 0.02),
                height: Get.height * 0.13,
                width: 1,
                color: Colors.grey.withOpacity(0.4),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.noticeTitle!,
                      style: TextStyle(
                        fontSize: Get.height * 0.027,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Text(
                      notification.noticeDescription!,
                      style: TextStyle(
                          fontSize: Get.height * 0.02, color: Colors.black54),
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isInToday(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    DateTime today = DateTime.now();

    return dateTime.year == today.year &&
        dateTime.month == today.month &&
        dateTime.day == today.day;
  }

  String dateFormater(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    // Format the date as "dd/MM"
    String formattedDate =
        "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}";

    return formattedDate;
  }
}
