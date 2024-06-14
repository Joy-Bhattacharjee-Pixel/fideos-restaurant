import 'package:fideos_restaurant/controllers/auth_controller.dart';
import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/presentations/auth/forgot_password.dart';
import 'package:fideos_restaurant/presentations/auth/register_screen.dart';
import 'package:fideos_restaurant/utils/button.dart';
import 'package:fideos_restaurant/utils/separator.dart';
import 'package:fideos_restaurant/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
        body: SingleChildScrollView(
      child: Form(
          // Form key
          key: _controller.loginFormKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            // top Image
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
            Seperator(text: "Log in or Sign up").show(),

            // Adding some space
            const SizedBox(height: 20),

            // Restaurat email text field
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFieldService(
                        controller: _controller.loginEmailController,
                        validator: (email) => _emailValidator(email: email),
                        hint: "Enter email address")
                    .show()),

            // Adding some space
            const SizedBox(height: 10),

            // Restaurat password text field
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFieldService(
                    controller: _controller.loginPasswordController,
                    hint: "Password",
                    passwordObsecured: _controller.loginpasswordObsecured.value,
                    onTapSuffix: () => _controller.loginpasswordObsecured
                        .value = !_controller.loginpasswordObsecured.value,
                    suffix: _controller.loginpasswordObsecured.value
                        ? Feather.eye
                        : Feather.eye_off,
                    validator: (password) =>
                        _passwordValidator(password: password)).show()),

            // forgot password option
            Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 14),
                child: GestureDetector(
                    onTap: () => Get.to(() => const ForgotPasswordScreen()),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Forgot Password?",
                            style: TextStyle(
                                color: ColorManager.primary,
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold))))),

            // give space
            const SizedBox(height: 15),

            // continue button
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ButtonManager(
                        onPressed: () {},
                        backgroundcolor: ColorManager.primary,
                        text: "Continue")
                    .elevated()),

            // Adding some space
            const SizedBox(height: 30),

            // putting divider section
            Seperator(text: "or").show(),

            // give space
            const SizedBox(height: 15),

            // register option
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Don't have an restaurant account?",
                  style: TextStyle(color: Colors.black, fontSize: 13.5)),
              // give space
              const SizedBox(width: 5),
              InkWell(
                  onTap: () => Get.to(() => const RegisterScreen()),
                  child: Text("Sign Up Now",
                      style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold)))
            ]),

            // give space
            const SizedBox(height: 30),

            //  continuing agree text
            const Text("By continuing, you agree to our",
                style: TextStyle(fontSize: 13)),

            // give space
            const SizedBox(height: 6),

            // terms and conditions Options list
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _controller.termsconditionoptions
                    .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Text(e,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: ColorManager.primary))))
                    .toList()),

            // give space
            const SizedBox(height: 20),
          ])),
    ));
  }

// email validator
  _emailValidator({String? email}) {
    if (email == null || email.isEmpty || !email.isEmail) {
      return "Please enter a valid email";
    }
    return null;
  }

  // password validator
  _passwordValidator({String? password}) {
    if (password == null || password.isEmpty) {
      return "Please enter a valid password";
    }
    return null;
  }
}
