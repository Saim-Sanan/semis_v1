import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:semis/constants/pallete.dart';
import 'package:semis/features/attendance/controllers/attendance_controller.dart';

import 'package:table_calendar/table_calendar.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceState();
}

class _AttendanceState extends State<AttendanceScreen> {
  final AttendanceController _attendanceController =
      Get.put(AttendanceController());

  @override
  void initState() {
    super.initState();
    _attendanceController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Attendance",
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
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TableCalendar(
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              focusedDay: today,
              firstDay: DateTime.utc(2000, 01, 01),
              lastDay: DateTime.utc(2030, 01, 01),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Pallete.blueColor.withAlpha(100),
              ),
            ),
            child: ListTile(
              tileColor: Pallete.blueColor.withAlpha(20),
              trailing: const Text(
                "30",
                style: TextStyle(
                  color: Pallete.blueColor,
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w400,
                ),
              ),
              title: const Text(
                'Total Classes',
                style: TextStyle(
                  color: Pallete.blueColor,
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Pallete.blueColor.withAlpha(100),
              ),
            ),
            child: ListTile(
              tileColor: Pallete.blueColor.withAlpha(20),
              trailing: const Text(
                "10",
                style: TextStyle(
                  color: Pallete.blueColor,
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w400,
                ),
              ),
              title: const Text(
                'Absents',
                style: TextStyle(
                  color: Pallete.blueColor,
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Pallete.blueColor.withAlpha(100),
              ),
            ),
            child: ListTile(
              tileColor: Pallete.blueColor.withAlpha(20),
              trailing: const Text(
                "3",
                style: TextStyle(
                  color: Pallete.blueColor,
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w400,
                ),
              ),
              title: const Text(
                'Leaves',
                style: TextStyle(
                  color: Pallete.blueColor,
                  fontSize: 20,
                  letterSpacing: 8,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
