import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AttendanceController extends GetxController {
  RxBool isLoading = false.obs;
  RxMap<DateTime, String> attendanceData = RxMap<DateTime, String>();

  Future<void> fetchStudentAttendanceData() async {
    isLoading.value = true;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final stdID = prefs.getString('stdID');
      final classCode = prefs.getString('classCode');
      final schoolUrl = prefs.getString('schoolUrl');
      final url = Uri.parse(
          '${schoolUrl}std_attendance?stdID=$stdID&classcode=$classCode');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final apiResponse = json.decode(response.body) as Map<String, dynamic>;

        Map<DateTime, String> resultMap = {};

        apiResponse.forEach((key, value) {
          DateTime? date = DateTime.tryParse(key);
          if (date != null) {
            resultMap[date] = value.toString();
          }
        });

        attendanceData.assignAll(resultMap);
      } else {
        throw Exception('Failed to fetch data from the API');
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchTeacherAttendanceData() async {
    isLoading.value = true;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final stdID = prefs.getString('stdID');
      final classCode = prefs.getString('classCode');
      final schoolUrl = prefs.getString('schoolUrl');
      final url = Uri.parse(
          '${schoolUrl}std_attendance?stdID=$stdID&classcode=$classCode');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final apiResponse = json.decode(response.body) as Map<String, dynamic>;

        Map<DateTime, String> resultMap = {};

        apiResponse.forEach((key, value) {
          DateTime? date = DateTime.tryParse(key);
          if (date != null) {
            resultMap[date] = value.toString();
          }
        });

        attendanceData.assignAll(resultMap);
      } else {
        throw Exception('Failed to fetch data from the API');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
