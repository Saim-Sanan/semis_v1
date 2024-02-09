import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/feature_block.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/models/teacher.dart';

class SalaryDashboardScreen extends StatelessWidget {
  const SalaryDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic args = Get.arguments;
    final Teacher teacher = args['teacher'];
    final String schoolUrl = args['schoolUrl'];

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
            padding: const EdgeInsets.only(bottom: 15),
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
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Options",
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
          Spacer(),
          Container(
            height: Get.height * 0.5,
            margin: EdgeInsets.all(Get.height * 0.02),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0.5,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // Offset in the y direction
                ),
              ],
            ),
            child: GridView.count(crossAxisCount: 2, children: [
              FeatureBlock(
                  title: "This Month Salary",
                  icon: Icons.monetization_on_outlined,
                  onTap: () {
                    Get.toNamed('/employee_salary', arguments: {
                      'teacher': teacher,
                      'schoolUrl': schoolUrl,
                    });
                  }),
              FeatureBlock(
                  title: "Salary Slips",
                  icon: Icons.event_note_rounded,
                  onTap: () {
                    Get.toNamed('/salary_slips_screen', arguments: {
                      'teacherID': teacher.employeeId,
                      'schoolUrl': schoolUrl,
                    });
                  }),
              FeatureBlock(
                  title: "Employee Loan", icon: Icons.money, onTap: () {
                    Get.toNamed("/employeeLoanScreen",  arguments: {
                      'teacherID': teacher.employeeId,
                      'schoolUrl': schoolUrl,
                    });
              }),
              FeatureBlock(
                  title: "Current Salary",
                  icon: Icons.monetization_on_outlined,
                  onTap: () {}),
            ]),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
