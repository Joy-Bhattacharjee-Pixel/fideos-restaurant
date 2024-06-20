import 'package:fideos_restaurant/utils/button.dart';
import 'package:fideos_restaurant/utils/loader.dart';
import 'package:fideos_restaurant/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  // Importing Authcontroller
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            child: Form(
                key: _authController.resetPasswordFormKey,
                child: SingleChildScrollView(
                    child: Column(children: [
                  // app icon
                  Image.asset("assets/auth_screen.png", width: Get.width),

                  // give space
                  const SizedBox(height: 20),

                  // login title
                  const Center(
                      child: Text("Reset Password",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))),

                  // give space
                  const SizedBox(height: 3),

                  // login subtitle
                  const Center(
                      child: Text("Please enter both the passwords to update",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500))),

                  // give space
                  const SizedBox(height: 15),

                  // password fields
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        // password text field
                        Obx(() => TextFieldService(
                            controller: _authController.resetPasswordController,
                            hint: "Password",
                            passwordObsecured:
                                _authController.resetPasswordObsecured.value,
                            onTapSuffix: () => _authController
                                    .resetPasswordObsecured.value =
                                !_authController.resetPasswordObsecured.value,
                            suffix: _authController.resetPasswordObsecured.value
                                ? Feather.eye
                                : Feather.eye_off,
                            validator: (password) =>
                                _passwordValidator(password: password)).show()),

                        // give space
                        const SizedBox(height: 10),

                        // confirm password text field
                        Obx(() => TextFieldService(
                                controller:
                                    _authController.resetConfirmPasswordController,
                                hint: "Confirm Password",
                                passwordObsecured: _authController
                                    .resetConfirmPasswordObsecured.value,
                                onTapSuffix: () => _authController
                                        .resetConfirmPasswordObsecured.value =
                                    !_authController
                                        .resetConfirmPasswordObsecured.value,
                                suffix: _authController
                                        .resetConfirmPasswordObsecured.value
                                    ? Feather.eye
                                    : Feather.eye_off,
                                validator: (password) =>
                                    _confirmPasswordValidator(password: password))
                            .show()),

                        // give space
                        const SizedBox(height: 20),

                        // update password button
                        Obx(() => _authController.resetPasswordProcessing.value
                            ? Loader().show()
                            : ButtonManager(
                                    onPressed: () => _updatePassword(),
                                    text: "Update Password")
                                .elevated())
                      ]))
                ])))));
  }

// Update password
  _updatePassword() {
    FocusScope.of(context).unfocus();

    if (_authController.resetPasswordFormKey.currentState!.validate()) {
      _authController.resetPasswordFormKey.currentState!.save();
      _authController.resetPassword(
          id: _authController.sentUserId.value,
          password: _authController.resetPasswordController.text.trim());
    }
  }

// Password validator
  _passwordValidator({String? password}) {
    if (password == null || password.isEmpty) {
      return "Please enter a valid password";
    }
    return null;
  }

// confirm password validator
  _confirmPasswordValidator({String? password}) {
    if (password == null || password.isEmpty) {
      return "Please enter a valid password";
    } else if (password !=
        _authController.resetPasswordController.text.trim()) {
      return "Passwords do not match";
    }
    return null;
  }
}
