import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/animated_loader.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/salary/controller/salary_controller.dart';
import 'package:semis/features/salary/screens/Salary_slip_detail_screen.dart';
import 'package:semis/models/employee_salary_slip.dart';
import 'package:semis/widgets/salary_slip_card.dart';

class SalarySlipsScreen extends StatefulWidget {
  const SalarySlipsScreen({Key? key}) : super(key: key);

  @override
  State<SalarySlipsScreen> createState() => _SalarySlipsScreenState();
}

class _SalarySlipsScreenState extends State<SalarySlipsScreen> {
  final dynamic args = Get.arguments;
  final SalaryController _salaryController = Get.put(SalaryController());
  late final List<EmployeeSalarySlip>? _employeeSalaryList;
  late int teacherID;
  late String schoolUrl;

  @override
  void initState() {
    super.initState();
    teacherID = args['teacherID'];
    schoolUrl = args['schoolUrl'];
    loadSalarySlips();
  }

  void loadSalarySlips() async {
    _employeeSalaryList =
        await _salaryController.getEmployeeSalarySlips(schoolUrl, teacherID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Salary Slips",
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
              "Employee ID : $teacherID",
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
            ? const AnimatedLoader2()
            : (_employeeSalaryList == null
                ? const Center(
                    child: Text("No Data Found"),
                  )
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Get.height * 0.017),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: _employeeSalaryList!.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Get.to(() => const SalarySlipDetailsScreen(),
                                    arguments: {
                                      "net_amount": _employeeSalaryList![index]
                                          .netAmount!,
                                      "total_income":
                                          "${_employeeSalaryList![index].totalIncome!}",
                                      "total_deduction":
                                          _employeeSalaryList![index]
                                              .totalDeduction!,
                                      "list_income_head":
                                          _employeeSalaryList![index]
                                              .incomeHeads,
                                      "salaryMonth" : _employeeSalaryList![index].forMonth!
                                    },
                                    transition: Transition.rightToLeft);
                              },
                              child: Hero(
                                tag: "salarySlipCard$index",
                                child: SalarySlipCard(
                                  salaryMonth: _employeeSalaryList![index].forMonth!,
                                    netAmount:
                                        _employeeSalaryList![index].netAmount!,
                                    totalIncome:
                                        "${_employeeSalaryList![index].totalIncome!}",
                                    totalDeduction: _employeeSalaryList![index]
                                        .totalDeduction!),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
      }),
    );
  }
}
