import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:semis/constants/animated_loader.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/auth/controllers/login_controller.dart';
import 'package:semis/features/school/screens/select_school.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _authController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Pallete.blueColor,
          body: Obx(
            () => _authController.isLoading.value
                ? const AnimatedLoader()
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width,
                          height: Get.height * 0.5,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                height: 350,
                                width: 350,
                                child: Lottie.asset(
                                  'assets/animations/login.json',
                                  repeat: true,
                                  reverse: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: Get.height * 0.5,
                          width: Get.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "SEMIS - School Education Management Information System",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w700,
                                      color: Pallete.blueColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Opacity(
                                    opacity: 0.6,
                                    child: Text(
                                      "semis Serves You Virtual Education At Your Home",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        color: Pallete.blackColor,
                                        wordSpacing: 3,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  TextFormField(
                                    controller:
                                        _cnicController, // CNIC Input Field
                                    decoration: const InputDecoration(
                                      hintText: "CNIC",
                                      prefixIcon: Icon(Icons.credit_card),
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your CNIC';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () => _handleLogin(),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Pallete.blueColor,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      minimumSize: Size(Get.width, 50),
                                    ),
                                    child: const Text(
                                      "Log In",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        wordSpacing: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void _handleLogin() async {
    try {
      _authController.isLoading.value = true; // Set loading state to true
      if (_formKey.currentState!.validate()) {
        // Form is valid, proceed with login
        final cnic = _cnicController.text;
        final schools = await _authController.cnicLogin(cnic);
        if (schools != null) {
          // Check if there are users associated with the CNIC
          if (schools.schoolCount > 0) {
            _saveLogin(cnic);
            Get.off(
              () => const SelectSchool(),
              arguments: {'schools': schools, 'cnic': cnic},
            );
          } else {
            // If no users found, display a message to the user
            Get.snackbar(
                "No Users Found", "No users are associated with this CNIC.");
          }
        }
      }
    } finally {
      _authController.isLoading.value = false;
    }
  }

  void _saveLogin(String cnic) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cnic', cnic);
    await prefs.setBool('isLoggedIn', true);
  }

  final TextEditingController _cnicController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
}
