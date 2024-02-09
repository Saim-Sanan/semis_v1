import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:semis/models/student_hostel_details.dart';

class HostelController extends GetxController{
  RxBool isLoading = false.obs;

  Future<StudentHostelDetails?> getHostelDetails() async{

    try{
      isLoading.value = true;
      final dataResponse = await http.get(
        //todo: we have to make this url dynamic
        Uri.parse(
            "https://mis.hms.edu.pk/api/hostelstudent?stdID=15222"),
      );

      if (dataResponse.statusCode == 200) {
        var jsonResponse = jsonDecode(dataResponse.body);

        if (jsonResponse is List && jsonResponse.isNotEmpty) {
          return StudentHostelDetails.fromJson(jsonResponse[0]);
        } else {
          Get.snackbar("Error", 'Invalid API response');
          return null;
        }
      } else {
        Get.snackbar("Error", dataResponse.reasonPhrase.toString());
        return null;
      }
    }catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
    return null;
  }

}