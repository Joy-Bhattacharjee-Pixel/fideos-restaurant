import 'package:fideos_restaurant/controllers/auth_controller.dart';
import 'package:fideos_restaurant/utils/button.dart';
import 'package:fideos_restaurant/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {

  //Importing authcontroller
  final AuthController _controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _controller.emailverifyFormKey,
            child: SingleChildScrollView(
                child: Column(children: [
              // App icon
              Image.asset("assets/auth_screen.png", width: Get.width),

              // Give space
              const SizedBox(height: 30),

              //  Title
              const Center(
                  child: Text("Verify Your Email",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500))),

              // Give space
              const SizedBox(height: 3),

              //  Subtitle
              const Center(
                  child: Text(
                      "Please enter the 4 digits OTP we sent in your email",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500))),
              // Give space
              const SizedBox(height: 15),

              // Verify otp fields
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    // Otp text field
                    Pinput(
                        controller: _controller.emailverifyotpController,
                        validator: (otp) {
                          if (otp == null || otp.isEmpty) {
                            return "OTP cannot be empty";
                          } else if (otp.length != 4) {
                            return "This is not a valid OTP";
                          }
                          return null;
                        }),

                    // Give space
                    const SizedBox(height: 20),

                    // Verify email button
                    Obx(() => _controller.emailVerification.value == true
                        ? Loader().show()
                        : ButtonManager(
                                onPressed: () => _verifyEmail(),
                                text: "Verify Email")
                            .elevated()),

                    // Give space
                    const SizedBox(height: 20),

                    // // back to login
                    // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    //   const Text("Lost OTP?",
                    //       style:
                    //           TextStyle(color: Colors.black, fontSize: 13.5)),

                    //   // give space
                    //   const SizedBox(width: 5),

                    //   InkWell(
                    //       onTap: () {},
                    //       child: Text("Resend",
                    //           style: TextStyle(
                    //               color: ColorManager.primary, fontSize: 13.5)))
                    // ]),

                    // Give space
                    const SizedBox(height: 10)
                  ]))
            ]))));
  }

  // email verify
  _verifyEmail() {
    FocusScope.of(context).unfocus();
    if (_controller.emailverifyFormKey.currentState!.validate()) {
      _controller.emailverifyFormKey.currentState!.save();
      _controller.verifyEmail(
          otp: _controller.emailverifyotpController.text.trim(),
          encryptedData: _controller.otpVerificationData.value);
    }
  }
}
