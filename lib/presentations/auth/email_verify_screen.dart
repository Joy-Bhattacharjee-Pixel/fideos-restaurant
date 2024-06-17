import 'package:fideos_restaurant/controllers/auth_controller.dart';
import 'package:fideos_restaurant/models/app_color.dart';
import 'package:fideos_restaurant/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  //importing authcontroller
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _authController.emailverifyFormKey,
            child: SingleChildScrollView(
                child: Column(children: [
              // app icon
              Image.asset("assets/auth_screen.png", width: Get.width),

              // give space
              const SizedBox(height: 30),

              //  title
              const Center(
                  child: Text("Verify Your Email",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500))),

              // give space
              const SizedBox(height: 3),

              //  subtitle
              const Center(
                  child: Text(
                      "Please enter the 4 digits OTP we sent in your email",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500))),
              // give space
              const SizedBox(height: 15),

              // verify otp fields
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    // otp text field
                    Pinput(
                        controller: _authController.emailverifyotpController,
                        validator: (otp) {
                          if (otp == null || otp.isEmpty) {
                            return "OTP cannot be empty";
                          } else if (otp.length != 4) {
                            return "This is not a valid OTP";
                          }
                          return null;
                        }),

                    // give space
                    const SizedBox(height: 20),

                    // verify email button
                    ButtonManager(onPressed: () {}, text: "Verify OTP")
                        .elevated(),

                    // give space
                    const SizedBox(height: 20),

                    // back to login
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text("Lost OTP?",
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.5)),

                      // give space
                      const SizedBox(width: 5),

                      InkWell(
                          onTap: () {},
                          child: Text("Resend",
                              style: TextStyle(
                                  color: ColorManager.primary, fontSize: 13.5)))
                    ]),

                    // give space
                    const SizedBox(height: 10)
                  ]))
            ]))));
  }
}
