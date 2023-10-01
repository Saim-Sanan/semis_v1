import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:semis/constants/pallete.dart';
import 'package:semis/features/auth/screens/login_screen.dart';
import 'package:semis/features/child/screens/child_dashboard.dart';
import 'package:semis/features/school/screens/select_school.dart';
import 'package:semis/features/school/screens/school_dashboard.dart';
import 'package:semis/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn');
  if (isLoggedIn == true) {
    runApp(const MyApp(isLoggedIn: true));
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, this.isLoggedIn = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Pallete.blueColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Pallete.blueColor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? '/splash' : '/login',
      getPages: [
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/select-school', page: () => const SelectSchool()),
        GetPage(name: '/school-dashboard', page: () => const SchoolDashboard()),
        GetPage(name: '/child-dashboard', page: () => const ChildDashboard()),
      ],
    );
  }
}
