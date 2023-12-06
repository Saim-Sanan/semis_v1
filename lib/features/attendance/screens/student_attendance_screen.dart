import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/animated_loader.dart';

import 'package:semis/constants/pallete.dart';
import 'package:semis/features/attendance/controllers/attendance_controller.dart';

class StudentAttendanceScreen extends StatefulWidget {
  const StudentAttendanceScreen({super.key});

  @override
  State<StudentAttendanceScreen> createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendanceScreen> {
  final AttendanceController _attendanceController =
      Get.put(AttendanceController());

  @override
  void initState() {
    super.initState();
    _attendanceController.fetchStudentAttendanceData();
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
      body: Obx(
        () {
          final absents = _attendanceController.attendanceData.values
              .where((value) => value == "A")
              .length;
          final leaves = _attendanceController.attendanceData.values
              .where((value) => value == "L")
              .length;
          return _attendanceController.isLoading.value
              ? const AnimatedLoader2()
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: CalendarDatePicker2(
                                displayedMonthDate: today,
                                config: CalendarDatePicker2Config(
                                  firstDayOfWeek: DateTime.monday,
                                  currentDate: today,
                                  calendarType: CalendarDatePicker2Type.multi,
                                  selectableDayPredicate: (DateTime date) =>
                                      false,
                                  selectedDayHighlightColor: Pallete.blueColor,
                                ),
                                value: _attendanceController.attendanceData.keys
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Pallete.blueColor.withAlpha(80),
                                  thickness: 1,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Total Record",
                                style: TextStyle(
                                  color: Pallete.blueColor.withAlpha(80),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 8,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Divider(
                                  color: Pallete.blueColor.withAlpha(80),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150, // Set the width as needed
                              height: 150, // Set the height as needed
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color.fromARGB(200, 183, 28, 28),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$absents",
                                      style: const TextStyle(
                                        color: Pallete.whiteColor,
                                        fontSize: 20,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Absents',
                                      style: TextStyle(
                                        color: Pallete.whiteColor,
                                        fontSize: 20,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                                width:
                                    30), // Adjust spacing between the two blocks
                            Container(
                              width: 150, // Set the width as needed
                              height: 150, // Set the height as needed
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color.fromARGB(200, 249, 168, 37),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$leaves",
                                      style: const TextStyle(
                                        color: Pallete.whiteColor,
                                        fontSize: 20,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Leaves',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
