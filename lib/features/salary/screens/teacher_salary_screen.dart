import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/animated_loader.dart';
import 'package:semis/constants/detail_tile.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/salary/controller/salary_controller.dart';
import 'package:semis/models/employee_salary.dart';
import 'package:semis/models/teacher.dart';

class TeacherSalaryScreen extends StatefulWidget {
  const TeacherSalaryScreen({Key? key}) : super(key: key);

  @override
  State<TeacherSalaryScreen> createState() => _TeacherSalaryScreenState();
}

class _TeacherSalaryScreenState extends State<TeacherSalaryScreen> {
  final SalaryController _salaryController = Get.put(SalaryController());
  final dynamic args = Get.arguments;

  late final EmployeeSalary? employeeSalary;
  late final String schoolUrl;
  late final Teacher teacher;

  @override
  void initState() {
    super.initState();
    schoolUrl = args['schoolUrl'];
    teacher = args['teacher'];
    loadEmployeeSalary();
  }

  void loadEmployeeSalary() async {
    employeeSalary = await _salaryController.getEmployeeSalaryDataFromApi(
        schoolUrl, teacher.employeeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          teacher.empName,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Pallete.blueColor, // Set the background color
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Get.size * 0.01,
          child: Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              "Employee ID : ${teacher.employeeId}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        return _salaryController.isLoading.value
            ? AnimatedLoader2()
            : Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Details",
                        style: TextStyle(
                          color: Pallete.blueColor,
                          fontSize: Get.height * 0.025,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: Get.width * 0.7,
                    child: const Divider(
                      color: Colors.black,
                      thickness: 0.55,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DetailTile(
                            title: "Designation",
                            icon: Icons.person_pin_rounded,
                            subtitle: "${employeeSalary!.empDesignation}",
                          ),
                          DetailTile(
                            title: "Account Code",
                            icon: Icons.sticky_note_2,
                            subtitle:
                                "${employeeSalary!.incomeHeads![0].accountCode}",
                          ),
                          DetailTile(
                            title: "Account Name",
                            icon: Icons.account_box,
                            subtitle:
                                "${employeeSalary!.incomeHeads![0].accountName}",
                          ),
                          DetailTile(
                            title: "Total Income",
                            icon: Icons.attach_money,
                            subtitle: "${employeeSalary!.totalIncome}",
                          ),
                          DetailTile(
                            title: "Rate",
                            icon: Icons.account_balance_wallet_rounded,
                            subtitle: "${employeeSalary!.incomeHeads![0].rate}",
                          ),
                          DetailTile(
                            title: "Status",
                            icon: Icons.person,
                            subtitle:
                                "${employeeSalary!.incomeHeads![0].status}",
                          ),
                          DetailTile(
                            title: "Net Amount",
                            icon: Icons.currency_exchange,
                            subtitle: "${employeeSalary!.netAmount}",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
