import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SalarySlipCard extends StatelessWidget {
  const SalarySlipCard(
      {Key? key,
      required this.netAmount,
      required this.totalIncome,
      required this.totalDeduction, required this.salaryMonth})
      : super(key: key);

  final int netAmount;
  final String totalIncome;
  final int totalDeduction;
  final DateTime salaryMonth;

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('yyyy-MM');

    return Container(
      margin: EdgeInsets.only(
        bottom: Get.height * 0.01,
      ),
      height: Get.height * 0.25,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xCC62AEEE), // Light blue color
            Color(0xFF368AFD), // Dark blue color
          ],
          stops: [0.1, 0.9], // Adjust the position of colors
        ),
        borderRadius: BorderRadius.circular(Get.height * 0.01),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.height * 0.025,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "This month's ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Get.height * 0.02,
                          ),
                        ),
                        Icon(
                          Icons.access_time_rounded,
                          color: Colors.white,
                          size: Get.height * 0.02,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.007,
                    ),
                    Text(
                      "$netAmount",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Get.height * 0.035,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      formatter.format(salaryMonth),
                      style: TextStyle(
                          color: Colors.white, fontSize: Get.height * 0.02),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 25,
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Total Income",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      totalIncome,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Get.height * 0.023,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Container(
                  width: 1,
                  height: 25,
                  color: Colors.white70,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Total Deduction",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "$totalDeduction",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Get.height * 0.023,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Container(
                  width: 1,
                  height: 25,
                  color: Colors.white70,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Net Amount",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "$netAmount",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Get.height * 0.023,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
