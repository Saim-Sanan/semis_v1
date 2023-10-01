import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semis/constants/animated_loader.dart';
import 'package:semis/features/auth/controllers/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LoginController _loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    _getSchools();
  }

  void _getSchools() async {
    await _loginController.checkLoggedInUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnimatedLoader3(),
    );
  }
}
