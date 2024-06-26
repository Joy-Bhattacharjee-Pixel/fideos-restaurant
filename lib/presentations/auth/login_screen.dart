import 'package:fideos_restaurant/controllers/auth_controller.dart';
import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/presentations/auth/forgot_password.dart';
import 'package:fideos_restaurant/presentations/auth/register_screen.dart';
import 'package:fideos_restaurant/utils/button.dart';
import 'package:fideos_restaurant/utils/loader.dart';
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
  final _controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
          // Form key
          key: _controller.loginFormKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            // Top Image
            const Image(image: AssetImage("assets/auth_screen.png")),

            // Adding some space
            const SizedBox(height: 10),

            // Title for restaurat
            const Text("India’s #1 Food Video and Delivery App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),

            // Adding some space
            const SizedBox(height: 20),

            // Putting divider section
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
            Obx(() => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFieldService(
                    controller: _controller.loginPasswordController,
                    hint: "Password",
                    passwordObsecured: _controller.loginPasswordObsecured.value,
                    onTapSuffix: () => _controller.loginPasswordObsecured
                        .value = !_controller.loginPasswordObsecured.value,
                    suffix: _controller.loginPasswordObsecured.value
                        ? Feather.eye
                        : Feather.eye_off,
                    validator: (password) =>
                        _passwordValidator(password: password)).show())),

            // Forgot password option
            // Forgot password option
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

            // Give space
            const SizedBox(height: 15),

            // continue button
            Obx(() => _controller.loadingLogin.value
                ? Loader().show()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ButtonManager(
                            onPressed: () => _login(),
                            backgroundcolor: ColorManager.primary,
                            text: "Continue")
                        .elevated())),

            // Adding some space
            const SizedBox(height: 30),

            // Putting divider section
            Seperator(text: "or").show(),

            // Give space
            const SizedBox(height: 15),

            // Register option
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

            // Give space
            const SizedBox(height: 30),

            //  Continuing agree text
            const Text("By continuing, you agree to our",
                style: TextStyle(fontSize: 13)),

            // Give space
            const SizedBox(height: 6),

            // Terms and conditions Options list
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

            // Give space
            const SizedBox(height: 20),
          ])),
    ));
  }

// Email validator
  _emailValidator({String? email}) {
    if (email == null || email.isEmpty || !email.isEmail) {
      return "Please enter a valid email";
    }
    return null;
  }

  // Password validator
  _passwordValidator({String? password}) {
    if (password == null || password.isEmpty) {
      return "Please enter a valid password";
    }
    return null;
  }

  // Calling login function using controller
  _login() {
    FocusScope.of(context).unfocus();

    // Validating form
    if (_controller.loginFormKey.currentState!.validate()) {
      _controller.loginFormKey.currentState!.save();
      _controller.login(
          email: _controller.loginEmailController.text.trim(),
          password: _controller.loginPasswordController.text.trim());
    }
  }
}
