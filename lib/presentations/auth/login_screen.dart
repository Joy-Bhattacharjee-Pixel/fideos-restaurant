import 'package:fideos_restaurant/controllers/auth_controller.dart';
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
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image
              Image(image: AssetImage("assets/auth_screen.png")),

              // Adding some space
              SizedBox(height: 10),

              // Title for restaurat
              Text("India’s #1 Food Video and Delivery App",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),

              // Adding some space
              SizedBox(height: 20),


            ],
          )),
    );
  }
}