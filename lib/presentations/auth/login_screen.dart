import 'package:fideos_restaurant/controllers/auth_controller.dart';
import 'package:fideos_restaurant/utils/separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Importing auth controller
  final _controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          // Form key
          key: _controller.loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image
              const Image(image: AssetImage("assets/auth_screen.png")),

              // Adding some space
              const SizedBox(height: 10),

              // Title for restaurat
              const Text("India’s #1 Food Video and Delivery App",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),

              // Adding some space
              const SizedBox(height: 20),

              // putting divider section
              Seperator(text: "Log in or Sign up").show()
            ],
          )),
    );
  }
}
