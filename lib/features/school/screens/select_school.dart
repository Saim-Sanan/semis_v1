import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/animated_loader.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/auth/controllers/login_controller.dart';
import 'package:semis/features/school/controllers/school_controller.dart';
import 'package:semis/features/school/screens/parent_school_dashboard.dart';
import 'package:semis/features/school/screens/teacher_school_dashboard.dart';
import 'package:semis/models/school_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectSchool extends StatefulWidget {
  const SelectSchool({super.key});

  @override
  State<SelectSchool> createState() => _SelectSchoolState();
}

class _SelectSchoolState extends State<SelectSchool> {
  final SchoolController _schoolController = Get.put(SchoolController());
  final LoginController _loginController = Get.put(LoginController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dynamic args = Get.arguments;
    final SchoolList schools = args['schools'];
    final String cnic = args['cnic'];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          padding: const EdgeInsets.only(left: 15),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              color: Colors.grey,
              size: 30,
            ),
          ),
        ),
        title: const Text(
          'Parent',
          style: TextStyle(
            fontSize: 24.0, // Optional: Set the title font size
            fontWeight: FontWeight.bold, // Optional: Set the title font weight
            color: Colors.white, // Optional: Set the title text color
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
            onPressed: () {
              _loginController.logOut();
              Get.offAllNamed('login');
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Get.size * 0.03,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              "CNIC: $cnic",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () {
          return _schoolController.isLoading.value
              ? const AnimatedLoader2()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Welcome to the SEMIS by',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'lato',
                              ),
                            ),
                            Text(
                              'IM|Digisol',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Pallete.blueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      const Text(
                        'Select School | Branch',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Pallete.blackColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      for (int index = 0; index < schools.schoolCount; index++)
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
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle, // Circular form
                                border: Border.all(
                                  width: 1,
                                  color: Colors.white, // Border color
                                ),
                              ),
                              child: ClipOval(
                                child: Center(
                                  child: Image.network(
                                    'https://app.imdigisol.com/${schools.schools[index].schoolLogo}',
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
                            title: Text('${schools.schools[index].schoolName}'),
                            subtitle:
                                Text('${schools.schools[index].branchName}'),
                            onTap: () {
                              navigateToSchool(schools.schools[index], cnic);
                            },
                          ),
                        ),
                    ],
                  ),
                );
        },
      ),
    );
  }

  Future<String?> showAccessTypeDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Login Type"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Pallete.blueColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    minimumSize: Size(Get.width, 50),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop("parent");
                  },
                  child: const Text("Login as Parent"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Pallete.blueColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    minimumSize: Size(Get.width, 50),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop("teacher");
                  },
                  child: const Text("Login as Teacher"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void navigateToSchool(dynamic school, String cnic) async {
    try {
      if (school.accessType == "3") {
        final loginType = await showAccessTypeDialog(Get.context!);

        if (loginType != null) {
          if (loginType == "parent") {
            loginAsParent(school, cnic);
          } else if (loginType == "teacher") {
            loginAsTeacher(school, cnic);
          }
        } else {}
      } else if (school.accessType == "1") {
        loginAsParent(school, cnic);
      } else if (school.accessType == "2") {
        loginAsTeacher(school, cnic);
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    } finally {
      _schoolController.isLoading.value = false;
    }
  }

  Future<String?> showPasswordInputDialog(
      BuildContext context, String loginType) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController passwordController = TextEditingController();

        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Login As $loginType",
                style: const TextStyle(
                  color: Pallete.blueColor,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red[300],
                ),
                child: IconButton(
                  iconSize: 15,
                  icon: const Icon(
                    Icons.close,
                    color: Pallete.whiteColor,
                  ), // Close button
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ),
            ],
          ),
          content: Form(
            key: _formKey,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pop(passwordController.text);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.blueColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                minimumSize: Size(Get.width, 50),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  wordSpacing: 2,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> loginAsParent(school, cnic) async {
    try {
      final enteredPassword =
          await showPasswordInputDialog(Get.context!, "parent");
      if (enteredPassword != null) {
        _schoolController.isLoading.value = true;
        final children = await _schoolController.schoolLogin(
            cnic, enteredPassword, school.appApi);
        _schoolController.isLoading.value = false;

        if (children != null) {
          // Check if there are users associated with the CNIC
          if (children.childCount > 0) {
            // If there are users, navigate to a screen where you can display them
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('schoolUrl', school.appApi);
            Get.to(
              () => const ParentSchoolDashboard(),
              arguments: {
                'school': school,
                'children': children,
              },
            );
          } else {
            // If no users found, display a message to the user
            Get.snackbar(
                "No Users Found", "No users are associated with this CNIC.");
          }
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Parent Login Failed");
    }
  }

  Future<void> loginAsTeacher(school, cnic) async {
    try {
      final enteredPassword =
          await showPasswordInputDialog(Get.context!, "teacher");
      if (enteredPassword != null) {
        Get.to(
          () => const TeacherSchoolDashboard(),
          arguments: {
            'school': school,
          },
        );
      }
    } catch (e) {
      Get.snackbar("Error", "Teacher Login Failed");
    }
  }
}
