import 'package:fideos_restaurant/presentations/auth/login_screen.dart';
import 'package:fideos_restaurant/utils/button.dart';
import 'package:fideos_restaurant/utils/loader.dart';
import 'package:fideos_restaurant/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../models/app_color.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // Importing auth controller
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
                key: _authController.forgotPasswordFormKey,
                child: Column(children: [
                  // App icon
                  Image.asset("assets/auth_screen.png", width: Get.width),

                  // Give space
                  const SizedBox(height: 20),

                  // Login title
                  const Center(
                      child: Text("Recover your account",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),

                  // Give space
                  const SizedBox(height: 3),

                  // Login subtitle
                  const Center(
                      child: Text("Enter your registered email to proceed",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500))),

                  // Give space
                  const SizedBox(height: 15),

                  // Forgot password form
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        // Email text field
                        TextFieldService(
                            controller: _authController.loginEmailController,
                            hint: "Email Address",
                            suffix: Feather.mail,
                            validator: (email) =>
                                _emailValidator(email: email)).show(),

                        // Give space
                        const SizedBox(height: 15),

                        // Verify email button
                        Obx(() => _authController.loadingforgotPassword.value
                            ? Loader().show()
                            : ButtonManager(
                                    onPressed: () => _verifyEmail(),
                                    text: "Verify Email")
                                .elevated()),

                        // Give space
                        const SizedBox(height: 20),

                        // Back to login
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Remember Password?",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13.5)),
                              const SizedBox(width: 5),
                              InkWell(
                                  onTap: () =>
                                      Get.to(() => const LoginScreen()),
                                  child: Text("Login",
                                      style: TextStyle(
                                          color: ColorManager.primary,
                                          fontSize: 13.5)))
                            ]),

                        // Give space
                        const SizedBox(height: 10)
                      ]))
                ]))));
  }

// Verify email
  _verifyEmail() {
    FocusScope.of(context).unfocus();

    if (_authController.forgotPasswordFormKey.currentState!.validate()) {
      _authController.forgotPasswordFormKey.currentState!.save();
      _authController.forgotPassword(
          email: _authController.loginEmailController.text);
    }
  }

// Email validator
  _emailValidator({String? email}) {
    if (email == null || email.isEmpty || !email.isEmail) {
      return "Please enter a valid email";
    }
    return null;
  }
}
