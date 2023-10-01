import 'dart:convert';

import 'package:get/get.dart';
import 'package:semis/models/child_model.dart';
import 'package:semis/models/child_list.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SchoolController extends GetxController {
  RxBool isLoading = false.obs;

  Future<Children?> schoolLogin(
      String cnic, String password, String schoolUrl) async {
    try {
      final loginResponse = await http.post(
        Uri.parse(
            "${schoolUrl}login?email=$cnic&password=$password&device_name=phone"),
      );

      if (loginResponse.statusCode == 200) {
        final bearerToken = loginResponse.body;

        _saveToken(bearerToken);

        var headers = {
          'Authorization': 'Bearer $bearerToken',
        };

        var userResponse = await http.get(
          Uri.parse("${schoolUrl}cnic?fcnic=$cnic"),
          headers: headers,
        );

        if (userResponse.statusCode == 200) {
          var jsonResponse = json.decode(userResponse.body);
          if (jsonResponse is List && jsonResponse.isNotEmpty) {
            List<Child> children = jsonResponse
                .map((childJson) => Child.fromJson(childJson))
                .toList();
            int childCount = children.length;

            return Children(childCount: childCount, children: children);
          } else {
            Get.snackbar("Error", 'Invalid API response');
            return null;
          }
        } else {
          Get.snackbar("Error", userResponse.reasonPhrase.toString());
          return null;
        }
      } else {
        Get.snackbar("Error", loginResponse.reasonPhrase.toString());
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    }
  }

  void _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
