import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/animated_loader.dart';
import 'package:semis/constants/detail_tile.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/hostel/controller/hostel_controller.dart';
import 'package:semis/models/student_hostel_details.dart';

class HostelDetailsScreen extends StatefulWidget {
  const HostelDetailsScreen({Key? key}) : super(key: key);

  @override
  State<HostelDetailsScreen> createState() => _HostelDetailsScreenState();
}

class _HostelDetailsScreenState extends State<HostelDetailsScreen> {
  final dynamic args = Get.arguments;
  final HostelController _hostelController = Get.put(HostelController());
  late final StudentHostelDetails? studentHostelDetails;

  @override
  void initState() {
    super.initState();
    loadHostelDetails();
  }

  Future<void> loadHostelDetails() async {
    studentHostelDetails = await _hostelController.getHostelDetails();
  }

  @override
  Widget build(BuildContext context) {
    final String stdID = args['stdID'];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
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
        automaticallyImplyLeading: true,
        bottom: PreferredSize(
          preferredSize: Get.size * 0.01,
          child: Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              "Student ID : $stdID",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        return _hostelController.isLoading.value
            ? AnimatedLoader2()
            : Column(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DetailTile(
                          title: "Joining Date",
                          icon: Icons.app_registration,
                          subtitle: "${studentHostelDetails!.jDate}",
                        ),
                        DetailTile(
                          title: "Ending Date",
                          icon: Icons.sticky_note_2,
                          subtitle: "${studentHostelDetails!.dDate}",
                        ),
                        DetailTile(
                          title: "Current Status",
                          icon: Icons.eject_sharp,
                          subtitle: "${studentHostelDetails!.currentState}",
                        ),
                        DetailTile(
                          title: "Room No",
                          icon: Icons.room_preferences,
                          subtitle: "${studentHostelDetails!.roomNumber}",
                        ),
                      ],
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
