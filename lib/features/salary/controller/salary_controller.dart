import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:semis/models/employee_loan.dart';
import 'package:semis/models/employee_salary.dart';
import 'package:semis/models/employee_salary_slip.dart';

class SalaryController extends GetxController {
  RxBool isLoading = false.obs;

  Future<EmployeeSalary?> getEmployeeSalaryDataFromApi(
      String schoolUrl, int employeeID) async {
    try {
      isLoading.value = true;

      final dataResponse = await http.get(
        Uri.parse("${schoolUrl}employeesalaryinfo?EmployeeID=$employeeID"),
      );

      if (dataResponse.statusCode == 200) {
        var jsonResponse = jsonDecode(dataResponse.body);

        return EmployeeSalary.fromJson(jsonResponse);
      } else {
        Get.snackbar("Error16", "Response error from the server");
        return null;
      }
    } catch (e) {
      Get.snackbar("Error15", e.toString());
    } finally {
      isLoading.value = false;
    }
    return null;
  }

  Future<List<EmployeeSalarySlip>?> getEmployeeSalarySlips(
      String schoolUrl, int employeeID) async {
    try {
      isLoading.value = true;

      final dataResponse = await http.get(
        Uri.parse(
            "https://mis.hms.edu.pk/api/employeesalaryslips?EmployeeID=345"),
      );

      if (dataResponse.statusCode == 200) {
        var jsonResponse = jsonDecode(dataResponse.body);

        if (jsonResponse is List && jsonResponse.isNotEmpty) {
          List<EmployeeSalarySlip> salarySlipsResponse = jsonResponse
              .map((salarySlip) => EmployeeSalarySlip.fromJson(salarySlip))
              .toList();

          return salarySlipsResponse;
        } else {
          Get.snackbar("Error", 'Invalid API response');
          return null;
        }
      } else {
        Get.snackbar("Error", dataResponse.reasonPhrase.toString());
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }

    return null;
  }

  Future<EmployeeLoan?> getEmployeeLoan(String schoolUrl, int employeeID) async{
    try {
      isLoading.value = true;


      final dataResponse = await http.get(
        Uri.parse("https://mis.hms.edu.pk/api/employeeloans?EmployeeID=286"),
      );

      if (dataResponse.statusCode == 200) {
        var jsonResponse = jsonDecode(dataResponse.body);

        return EmployeeLoan.fromJson(jsonResponse[0]);
      } else {
        Get.snackbar("Error", "Response error from the server");
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
    return null;
  }
}
