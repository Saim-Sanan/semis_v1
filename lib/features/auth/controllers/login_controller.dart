import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:semis/features/school/screens/select_school.dart';
import 'package:semis/models/school_list.dart';
import 'package:semis/models/school_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> checkLoggedInUser() async {
    try {
      isLoading.value = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final cnic = prefs.getString('cnic');
      if (cnic != null) {
        final schools = await cnicLogin(cnic);
        if (schools != null) {
          // Check if there are users associated with the CNIC
          if (schools.schoolCount > 0) {
            Get.off(
              () => const SelectSchool(),
              arguments: {'schools': schools, 'cnic': cnic},
            );
          } else {
            // If no users found, display a message to the user
            Get.snackbar("No Schools Found",
                "No Schools are associated with this CNIC.");
          }
        }
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<SchoolList?> cnicLogin(String cnic) async {
    try {
      final headers = {
        'token':
            '\$2a\$09\$eoI2FfGruHb1/hpztWA6eOw37Z622O3a7h.B9C/u0O1yu8j6kABem'
      };

      final response = await http.get(
        Uri.parse('https://app.imdigisol.com/api/AllSchools?cnic=$cnic'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Parse the JSON array
        var jsonResponse = json.decode(response.body);
        if (jsonResponse is List && jsonResponse.isNotEmpty) {
          // Parse the list of users
          List<School> schools = jsonResponse
              .map((userJson) => School.fromJson(userJson))
              .toList();
          int schoolCount = schools.length;

          return SchoolList(schoolCount: schoolCount, schools: schools);
        } else {
          Get.snackbar("Error7", 'Invalid API response');
          return null;
        }
      } else {
        Get.snackbar("Error6", '${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      Get.snackbar("Error4", e.toString());
      return null;
    }
  }

  void logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('cnic');
    await pref.remove('isLoggedIn');
  }
}
