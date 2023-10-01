import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceController extends GetxController {
  RxBool isLoading = false.obs;
  final apiUrl = 'https://fga.bsoft.pk/api/std_attendance?stdID=1&classcode=5';
  RxList<Map<String, dynamic>> attendanceData = <Map<String, dynamic>>[].obs;

  Future<void> fetchData() async {
    try {
      // Fetch data from the API
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var headers = {
        'Authorization': 'Bearer $token',
      };
      final response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (response.statusCode == 200) {
        // Parse the response data as a list of maps
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty && data[0] is List<dynamic>) {
          attendanceData.value = data[0].cast<Map<String, dynamic>>();
        }
      } else {
        // Handle error here if needed
        Get.snackbar(
            'Error1', 'Failed to fetch data: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle exceptions here if needed
      Get.snackbar('error2', 'Error: $e');
    }
  }
}
