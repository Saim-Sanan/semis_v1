import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:semis/models/employee_salary.dart';


class SalaryController extends GetxController{
  RxBool isLoading = false.obs;

  Future<EmployeeSalary?> getEmployeeSalaryDataFromApi(String schoolUrl, int employeeId) async{
    try{
      isLoading.value = true;
;      final dataResponse = await http.get(
        Uri.parse(
            "${schoolUrl}employeesalaryinfo?EmployeeID=$employeeId"),
      );

      if (dataResponse.statusCode == 200) {
        var jsonResponse = jsonDecode(dataResponse.body);

        return EmployeeSalary.fromJson(jsonResponse);
      } else {
        Get.snackbar("Error16", "Response error from the server");
        return null;
      }

    }catch(e){
      Get.snackbar("Error15", e.toString());
    } finally{
      isLoading.value = false;
    }
    return null;
  }
}