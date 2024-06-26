import 'dart:developer';
import 'package:fideos_restaurant/controllers/restaurant.controller.dart';
import 'package:fideos_restaurant/presentations/auth/login_screen.dart';
import 'package:fideos_restaurant/presentations/base/base_screen.dart';
import 'package:fideos_restaurant/utils/cookies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // After some certain seconds this page will be disposed and navigating to a new page
    // Timeout duration sets as 3 seconds initially = Calling a predefined function to start the timer
    _startTimer();
  }

  // This function starting the timer & calling the next function.
  _startTimer() async {
    await Future.delayed(const Duration(seconds: 3));
    _checkRoute();
  }

  final controller = Get.put(RestaurantController());
// This function navigate to the screen based on the cookies name "id" match or not
  _checkRoute() async {
    final id = await CookieManager("id").get();
    log(id.toString());

    if (id != null) {
      Get.to(() => const BaseScreen());
    } else {
      Get.to(() => const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Image.asset("assets/logo.png", width: 200)));
  }
}
