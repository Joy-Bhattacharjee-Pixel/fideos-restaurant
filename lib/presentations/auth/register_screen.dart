import 'package:fideos_restaurant/controllers/auth_controller.dart';
import 'package:fideos_restaurant/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Importing aut controller
  final _controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _controller.registerFormKey,
            child: Column(children: [
              // Image
              const Image(image: AssetImage("assets/auth_screen.png")),

              // Adding some space
              const SizedBox(height: 10),

              // Title for restaurat
              const Text("India’s #1 Food Video and Delivery App",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),

              // Adding some space
              const SizedBox(height: 20),

              // Restaurat name text field
              TextFieldService(controller: _controller.regEmailController, hint: "Email").show()
            ])));
  }
}
