import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/feature_block.dart';
import 'package:semis/features/attendance/screens/attendance_screen.dart';
import 'package:semis/features/transport/screens/transport_screen.dart';
import 'package:semis/models/child_model.dart';

class ChildHome extends StatelessWidget {
  final Child child;
  const ChildHome({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(bottom: 80.0, left: 20, right: 20),
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
                  () => const AttendanceScreen(),
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
              onTap: () {},
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
    );
  }
}
