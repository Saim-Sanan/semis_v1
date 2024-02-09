import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/models/employee_salary_slip.dart';
import 'package:semis/widgets/salary_slip_card.dart';

class SalarySlipDetailsScreen extends StatelessWidget {
  const SalarySlipDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic args = Get.arguments;

    final String totalIncome = args['total_income'];
    final int netAmount = args['net_amount'];
    final int totalDeduction = args['total_deduction'];
    final DateTime salaryMonth = args['salaryMonth'];
    final List<IncomeHead> listOfIncomeHeads = args['list_income_head'];

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Pallete.blueColor, // Set the background color
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: Get.height * 0.017,
          right: Get.height * 0.017,
        ),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.015,
            ),
            SalarySlipCard(
              salaryMonth: salaryMonth,
              netAmount: netAmount,
              totalIncome: totalIncome,
              totalDeduction: totalDeduction,
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: Get.width * 0.35,
                      height: Get.height * 0.035,
                    ),
                    Positioned(
                      top: 17,
                      left: 0,
                      child: Container(
                        color: Pallete.blueColor.withAlpha(70),
                        width: Get.width * 0.32,
                        height: Get.height * 0.025,
                      ),
                    ),
                    Positioned(
                      top: 1,
                      left: 2,
                      child: Text(
                        "Net-Income",
                        style: TextStyle(
                            fontSize: Get.height * 0.0275,
                            fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
                Text(
                  "$netAmount",
                  style: TextStyle(
                      color: Pallete.blueColor,
                      fontSize: Get.height * 0.027,
                      fontWeight: FontWeight.w800),
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.025,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total-Income",
                  style: TextStyle(
                      fontSize: Get.height * 0.027,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "$netAmount",
                  style: TextStyle(
                      color: Pallete.blueColor.withAlpha(160),
                      fontSize: Get.height * 0.027,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            if (listOfIncomeHeads.isNotEmpty)
              for (int i = 0; i < listOfIncomeHeads.length; i++)
                Container(
                  margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        listOfIncomeHeads[i].accountName!,
                        style: TextStyle(
                          fontSize: Get.height * 0.023,
                        ),
                      ),
                      Text(
                        "${listOfIncomeHeads[i].rate}",
                        style: TextStyle(
                          fontSize: Get.height * 0.023,
                        ),
                      ),
                    ],
                  ),
                ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total-Deduction",
                  style: TextStyle(
                      fontSize: Get.height * 0.027,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "$totalDeduction",
                  style: TextStyle(
                      color: Pallete.blueColor.withAlpha(160),
                      fontSize: Get.height * 0.027,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),

            //todo: add code for adding the dynamic deduction list once we have some data about it from api
          ],
        ),
      ),
    );
  }
}
