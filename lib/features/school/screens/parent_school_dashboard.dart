import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/models/school_model.dart';
import 'package:semis/models/child_list.dart';
import 'package:semis/features/child/screens/child_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParentSchoolDashboard extends StatefulWidget {
  const ParentSchoolDashboard({Key? key}) : super(key: key);

  @override
  State<ParentSchoolDashboard> createState() => _ParentSchoolDashboardState();
}

class _ParentSchoolDashboardState extends State<ParentSchoolDashboard> {
  @override
  Widget build(BuildContext context) {
    final dynamic args = Get.arguments;
    final School school = args['school'];
    final Children children = args['children'];

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
              await prefs.remove('token');
              await prefs.remove('schoolUrl');
              Get.back();
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Get.size * 0.03,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              "${school.branchName}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: Get.width,
            height: 250,
            child: PageView.builder(
              controller: PageController(
                initialPage: 2,
                viewportFraction: 0.9,
              ),
              // itemCount: 5,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Pallete.secondaryColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Children',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Pallete.blueColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: Get.width,
            height: 150,
            child: PageView.builder(
              controller: PageController(
                initialPage: 1,
                viewportFraction: 0.5,
              ),
              itemCount: children.childCount,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString(
                        'stdID', children.children[index].stdId);
                    await prefs.setString(
                        'classCode', children.children[index].classCode);
                    Get.to(() => const ChildDashboard(), arguments: {
                      'child': children.children[index],
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Pallete.secondaryColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profile.jpg'),
                          radius: 30,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          children.children[index].fullName,
                          style: const TextStyle(
                            fontSize: 15,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            color: Pallete.blueColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          children.children[index].className,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Pallete.blueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
