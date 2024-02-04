import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/detail_tile.dart';
import 'package:semis/constants/pallete.dart';

class HostelDetailsScreen extends StatelessWidget {
  const HostelDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            //
          },
          child: const Icon(
            Icons.arrow_back_sharp,
          ),
        ),
        title: Text(
          "Hostel Details",
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
              "Student ID : 00",
              style: TextStyle(
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DetailTile(
                  title: "Joining Date",
                  icon: Icons.app_registration,
                  subtitle: "2021-01-01",
                ),
                DetailTile(
                  title: "Ending Date",
                  icon: Icons.sticky_note_2,
                  subtitle: "2025-1-12",
                ),
                DetailTile(
                  title: "Current Status",
                  icon: Icons.eject_sharp,
                  subtitle: "Active",
                ),
                DetailTile(
                  title: "Room No",
                  icon: Icons.room_preferences,
                  subtitle: "2",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
