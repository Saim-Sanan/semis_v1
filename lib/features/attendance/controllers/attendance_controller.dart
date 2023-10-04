import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AttendanceController extends GetxController {
  RxBool isLoading = false.obs;
  RxMap<DateTime, String> attendanceData = RxMap<DateTime, String>();

  Future<void> fetchAttendanceData() async {
    isLoading.value = true;

    try {
      final url = Uri.parse(
          'https://fga.bsoft.pk/api/std_attendance?stdID=1&classcode=5');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final apiResponse = json.decode(response.body) as List<dynamic>;

        Map<DateTime, String> resultMap = {};

        for (var map in apiResponse) {
          if (map is Map<String, dynamic>) {
            map.forEach((key, value) {
              DateTime? date = DateTime.tryParse(key);
              if (date != null) {
                resultMap[date] = value.toString();
              }
            });
          }
        }

        attendanceData.assignAll(resultMap);
      } else {
        throw Exception('Failed to fetch data from the API');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
