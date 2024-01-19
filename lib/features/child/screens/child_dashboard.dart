import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/child/screens/child_home.dart';
import 'package:semis/features/child/screens/child_profile.dart';
import 'package:semis/features/child/screens/child_settings.dart';
import 'package:semis/features/notification/controller/notification_controller.dart';
import 'package:semis/models/child_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChildDashboard extends StatefulWidget {
  const ChildDashboard({Key? key}) : super(key: key);

  @override
  State<ChildDashboard> createState() => _SchoolDashboardState();
}

class _SchoolDashboardState extends State<ChildDashboard> {
  int _pageIndex = 1;

  final NotificationController _notificationController =
      Get.put(NotificationController());


  @override
  void initState() {
    super.initState();
    loadNotification();
  }

  void loadNotification() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String schoolUrl = sharedPreferences.getString("schoolUrl")!;
    String stdID = sharedPreferences.getString("stdID")!;
    await _notificationController.getParentNotification(schoolUrl, stdID);
    _notificationController.isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    final dynamic args = Get.arguments;
    final Child child = args['child'];
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
                  'https://app.imdigisol.com/${child.picPath}',
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
          child.fullName,
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
          Container(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/parent_notification', arguments: {
                  'notification_controller': _notificationController
                });
              },
              child: const Badge(
                // isLabelVisible: int.parse(unreadNotificationsCount) > 0,
                label: Text("3"),
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.notifications_none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.child_care),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('stdID');
              prefs.remove("classCode");
              Get.back();
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Get.size * 0.03,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              "Class: ${child.className}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: _pageIndex,
            children: [
              ChildProfile(
                child: child,
              ),
              ChildHome(
                child: child,
              ),
              const ChildSettings(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                child: BottomNavigationBar(
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white60,
                  showSelectedLabels: true,
                  backgroundColor: Pallete.blueColor,
                  currentIndex: _pageIndex,
                  onTap: (int index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: "Profile"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings), label: "Settings"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
