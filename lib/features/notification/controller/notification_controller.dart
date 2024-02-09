import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:semis/models/notification.dart';

class NotificationController extends GetxController {
  RxBool isLoading = false.obs;
  List<ParentNotification> notifications = []; //contains all notifications
  List<ParentNotification> todayNotifications =
      []; //contains only today's notification
  List<ParentNotification> thisWeekNotifications =
      []; //contains this week notifications except today's
  List<ParentNotification> olderNotifications =
      []; // contains older notification except this weeks

  Future<void> getParentNotification(String schoolUrl, String stdID) async {
    try {
      isLoading.value = true;
      final dataResponse = await http.get(
        //todo: we have to make this url dynamic
        Uri.parse(
            "https://semis.imdigisol.com/api/noticePerStudent?stdID=15600"),
      );

      if (dataResponse.statusCode == 200) {
        var jsonResponse = jsonDecode(dataResponse.body);

        if (jsonResponse is List && jsonResponse.isNotEmpty) {
          List<ParentNotification> notificationsResponse = jsonResponse
              .map((notification) => ParentNotification.fromJson(notification))
              .toList();

          notifications = notificationsResponse;
          classifyNotification(notifications);
        } else {
          Get.snackbar("Error14", 'Invalid API response');
          return;
        }
      } else {
        Get.snackbar("Error13", dataResponse.reasonPhrase.toString());
        return;
      }
    } catch (e) {
      Get.snackbar("Error12", e.toString());
      return;
    } finally {
      isLoading.value = false;
    }
  }

  void classifyNotification(List<ParentNotification> notifications) {
    // it classifies the notifications based on time

    todayNotifications = [];
    thisWeekNotifications = [];
    olderNotifications = [];

    bool isInToday(String dateString) {
      DateTime dateTime = DateTime.parse(dateString);
      DateTime today = DateTime.now();

      return dateTime.year == today.year &&
          dateTime.month == today.month &&
          dateTime.day == today.day;
    }

    bool isInThisWeekButNotToday(String dateString) {
      DateTime dateTime = DateTime.parse(dateString);
      DateTime today = DateTime.now();
      DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));
      DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));

      return dateTime.isAfter(startOfWeek) &&
          dateTime.isBefore(endOfWeek) &&
          !isInToday(dateString);
    }

    for (int i = 0; i < notifications.length; i++) {
      if (isInToday(notifications[i].issueDate!)) {
        todayNotifications.add(notifications[i]);
      } else if (isInThisWeekButNotToday(notifications[i].issueDate!)) {
        thisWeekNotifications.add(notifications[i]);
      } else {
        olderNotifications.add(notifications[i]);
      }
    }
  }
}
