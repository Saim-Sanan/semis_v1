import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/animated_loader.dart';
import 'package:semis/constants/detail_tile.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/salary/controller/salary_controller.dart';
import 'package:semis/models/employee_loan.dart';

class EmployeeLoanScreen extends StatefulWidget {
  const EmployeeLoanScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeLoanScreen> createState() => _EmployeeLoanScreenState();
}

class _EmployeeLoanScreenState extends State<EmployeeLoanScreen> {
  final SalaryController _salaryController = Get.put(SalaryController());
  final dynamic args = Get.arguments;
  late final int teacherID;

  late final String schoolUrl;

  late final EmployeeLoan? employeeLoan;

  @override
  void initState() {
    super.initState();
    teacherID = args['teacherID'];
    schoolUrl = args['schoolUrl'];
    loadLoanData(schoolUrl, teacherID);
  }

  void loadLoanData(String schoolUrl, int employeeID) async {
    employeeLoan =
        await _salaryController.getEmployeeLoan(schoolUrl, employeeID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Loans",
          style: TextStyle(
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
              "Employee ID : ${teacherID}",
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
            : (employeeLoan == null
                ? const Center(
                    child: Text("No Record Found"),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Loan Details",
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DetailTile(
                              title: "Employee Name",
                              icon: Icons.person,
                              subtitle: employeeLoan!.empName!,
                            ),
                            DetailTile(
                              title: "Employee Designation",
                              icon: Icons.work,
                              subtitle: employeeLoan!.empDesignation!,
                            ),
                            DetailTile(
                                title: "Date",
                                icon: Icons.date_range,
                                subtitle:
                                    "${employeeLoan!.date!.year}-${employeeLoan!.date!.month}-${employeeLoan!.date!.day}"),
                            DetailTile(
                                title: "Amount",
                                icon: Icons.money,
                                subtitle: employeeLoan!.amount!),
                            DetailTile(
                              title: "Installment",
                              icon: Icons.access_time_filled,
                              subtitle: employeeLoan!.installment!,
                            ),
                            DetailTile(
                                title: "Status",
                                icon: Icons.outbond_rounded,
                                subtitle: employeeLoan!.status!),
                          ],
                        ),
                      )
                    ],
                  ));
      }),
    );
  }
}
