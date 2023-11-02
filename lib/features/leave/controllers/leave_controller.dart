import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:semis/constants/pallete.dart';
import 'package:semis/models/leave_application.dart';

class LeaveController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<LeaveApplication> leaveApplications = <LeaveApplication>[].obs;

  Future<void> submitLeaveApplication({
    required String leaveType,
    required String cause,
    required DateTime fromDate,
    required DateTime toDate,
    required String status,
    required int employeeId,
  }) async {
    try {
      isLoading.value = true; // Show loader while submitting
      final response = await http.post(
        Uri.parse(
            'https://semis.imdigisol.com/api/insertemployeeleave?Type=$leaveType&Cause=$cause&FromDate=$fromDate&ToDate=$toDate&Status=$status&EmployeeID=$employeeId'),
      );

      if (response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Application Sent Succussfully.",
          icon: const Icon(
            Icons.verified,
            color: Colors.green,
            size: 35,
          ),
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to insert data',
          icon: const Icon(
            Icons.not_interested,
            color: Colors.red,
            size: 35,
          ),
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to insert data');
    } finally {
      isLoading.value = false; // Hide loader after API call
    }
  }

  Future<void> fetchLeaveApplications() async {
    try {
      isLoading.value = true; // Show loader while fetching

      final response = await http.get(
        Uri.parse('https://semis.imdigisol.com/api/employeeleave'),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData is List) {
          // If response is a list of LeaveApplication objects
          List<LeaveApplication> data = responseData
              .map((item) => LeaveApplication.fromJson(item))
              .toList();

          leaveApplications.assignAll(data);
        } else if (responseData is Map<String, dynamic>) {
          // If response is a single LeaveApplication object
          LeaveApplication singleLeave =
              LeaveApplication.fromJson(responseData);
          leaveApplications.assignAll([singleLeave]);
        } else {
          Get.snackbar('Error', 'Invalid data format');
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch leave applications');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false; // Hide loader after API call
    }
  }
}
