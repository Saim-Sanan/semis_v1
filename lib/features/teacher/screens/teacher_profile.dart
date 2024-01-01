import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/detail_tile.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/models/teacher.dart';

class TeacherProfile extends StatelessWidget {
  final Teacher teacher;
  const TeacherProfile({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
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
                  'https://app.imdigisol.com/${teacher.empImage}',
                  width: 50,
                  height: 50,
                  fit: BoxFit.scaleDown,
                  errorBuilder: (context, error, stackTrace) {
                    // If the image loading fails, display the default image
                    return Image.asset(
                      'assets/images/image.jpg', // Replace with the path to your default image
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
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              Get.back();
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Get.size * 0.03,
          child: const Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              "Class: 10-A",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(
              bottom: 100.0, left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Personal Details",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Pallete.blueColor,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Divider(
                  thickness: 2,
                  color: Pallete.secondaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.numbers,
                subtitle: '${teacher.employeeId}',
                title: 'Teacher ID',
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.person_outline,
                subtitle: teacher.empName,
                title: 'Full Name',
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.person,
                subtitle: teacher.fatherName,
                title: 'Father Name',
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.credit_card,
                subtitle: teacher.cnicNumber,
                title: 'CNIC',
              ),
              const SizedBox(
                height: 20,
              ),
              const DetailTile(
                icon: Icons.water_drop_outlined,
                subtitle: "A+",
                title: 'Blood Group',
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.date_range_outlined,
                subtitle: '${teacher.birthDate}',
                title: 'Date of Birth',
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.phone,
                subtitle: teacher.permanentPhone,
                title: 'Contact',
              ),
              const SizedBox(
                height: 20,
              ),
              DetailTile(
                icon: Icons.location_on_sharp,
                subtitle: teacher.permanentAddress,
                title: 'Current Address',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
