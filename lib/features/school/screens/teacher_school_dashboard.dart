import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/animated_loader.dart';
import 'package:semis/constants/feature_block.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/attendance/screens/teacher_attendance_screen.dart';
import 'package:semis/features/leave/screens/teacher_leave_application.dart';
import 'package:semis/features/school/controllers/school_controller.dart';
import 'package:semis/features/transport/screens/transport_screen.dart';
import 'package:semis/models/school_model.dart';
import 'package:semis/models/teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherSchoolDashboard extends StatefulWidget {
  const TeacherSchoolDashboard({super.key});

  @override
  State<TeacherSchoolDashboard> createState() => _TeacherSchoolDashboardState();
}

class _TeacherSchoolDashboardState extends State<TeacherSchoolDashboard> {
  final SchoolController _schoolController = Get.put(SchoolController());

  @override
  Widget build(BuildContext context) {
    final dynamic args = Get.arguments;
    final School school = args['school'];
    final Teacher teacher = args['teacher'];


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          padding: const EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Center(
                child: Image.network(
                  'https://app.imdigisol.com/${school.schoolLogo}',
                  width: 50,
                  height: 50,
                  fit: BoxFit.scaleDown,
                  errorBuilder: (context, error, stackTrace) {
                    // If the image loading fails, display the default image
                    return Image.asset(
                      'assets/images/image.jpg',
                      // Replace with the path to your default image
                      width: 50,
                      height: 50,
                      fit: BoxFit.scaleDown,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        title: Text(
          '${school.schoolName}',
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
        actions: [
          IconButton(
            icon: const Icon(Icons.swap_horizontal_circle_sharp),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('schoolUrl');
              await prefs.remove('teacherId');
              Get.back();
            },
          )
        ],
      ),
      body: Obx(
        () {
          return _schoolController.isLoading.value
              ? const AnimatedLoader2()
              : Column(
                  children: [
                    Card(
                      margin: EdgeInsets.only(
                        left: Get.height * 0.03,
                        right: Get.height * 0.03,
                        top: Get.height * 0.03,
                        bottom: Get.height * 0.015,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.network(
                            '${school.appApi!.replaceFirst("/api/", "/")}/${teacher.empImage}',
                            width: 50,
                            height: 50,
                            fit: BoxFit.scaleDown,
                            errorBuilder: (context, error, stackTrace) {
                              // If the image loading fails, display the default image
                              return Image.asset(
                                'assets/images/image.jpg',
                                // Replace with the path to your default image
                                width: 50,
                                height: 50,
                                fit: BoxFit.scaleDown,
                              );
                            },
                          ),
                        ),
                        title: Text(
                          teacher.gender == "Male"
                              ? "Mr. ${teacher.empName}"
                              : "Ms. ${teacher.empName}",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: Get.height * 0.02,
                          ),
                        ),
                        //todo: to be changed to actual subject
                        subtitle: Text("Subject"),
                        trailing: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.height * 0.015,
                                vertical: Get.height * 0.007),
                            decoration: BoxDecoration(
                                color: Pallete.blueColor,
                                borderRadius:
                                    BorderRadius.circular(Get.height * 0.005)),
                            child: Text("View Profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.height * 0.015)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: 0.0,
                            left: Get.height * 0.03,
                            right: Get.height * 0.03),
                        padding: EdgeInsets.only(
                            bottom: 0.0,
                            left: Get.height * 0.03,
                            right: Get.height * 0.03),
                        child: GridView.count(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          children: [
                            FeatureBlock(
                              icon: Icons.done_outline,
                              title: 'Attendence',
                              onTap: () {
                                Get.to(
                                  () => const TeacherAttendanceScreen(),
                                );
                              },
                            ),
                            FeatureBlock(
                              icon: Icons.book,
                              title: 'Diary',
                              onTap: () {},
                            ),
                            FeatureBlock(
                              icon: Icons.time_to_leave_outlined,
                              title: 'Transport',
                              onTap: () {
                                Get.to(
                                  () => const TransportScreen(),
                                );
                              },
                            ),
                            FeatureBlock(
                              icon: Icons.date_range_outlined,
                              title: 'TimeTable',
                              onTap: () {},
                            ),
                            FeatureBlock(
                              icon: Icons.chat,
                              title: 'Chats',
                              onTap: () {},
                            ),
                            FeatureBlock(
                              icon: Icons.directions_walk,
                              title: 'Leave',
                              onTap: () {
                                Get.to(
                                  () => const TeacherLeaveApplication(),
                                );
                              },
                            ),
                            FeatureBlock(
                              icon: Icons.text_snippet,
                              title: 'Exam',
                              onTap: () {},
                            ),
                            FeatureBlock(
                              icon: Icons.report,
                              title: 'Report',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
