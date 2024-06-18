import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fideos_restaurant/models/restaurant.dart';
import 'package:fideos_restaurant/presentations/auth/email_verify_screen.dart';
import 'package:fideos_restaurant/presentations/auth/login_screen.dart';
import 'package:fideos_restaurant/presentations/auth/register_screen.dart';
import 'package:fideos_restaurant/presentations/auth/reset_password.dart';
import 'package:fideos_restaurant/presentations/auth/verify_otp.dart';
import 'package:fideos_restaurant/service.dart';
import 'package:fideos_restaurant/utils/cookies.dart';
import 'package:fideos_restaurant/utils/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Email text field controller for login screen
  final TextEditingController loginEmailController = TextEditingController();

  // Password text field controller for login screen
  final TextEditingController loginPasswordController = TextEditingController();

  // Name text field controller for register screen
  final TextEditingController regNameController = TextEditingController();

  // Name text field controller for register screen
  final TextEditingController regDescriptionController =
      TextEditingController();

  // Email text field controller for register screen
  final TextEditingController regEmailController = TextEditingController();

  // Phone text field controller for register screen
  final TextEditingController regPhoneController = TextEditingController();

  // Password text field controller for register screen
  final TextEditingController regPasswordController = TextEditingController();

  // Confirm password text field controller for register screen
  final TextEditingController regConfirmPasswordController =
      TextEditingController();

  // Restaurant website text field controller for register screen
  final TextEditingController regWebsiteController = TextEditingController();

  // Full Address text field controller for register screen
  final TextEditingController regFullAddressController =
      TextEditingController();

  // City text field controller for register screen
  final TextEditingController regCityController = TextEditingController();

  // State text field controller for register screen
  final TextEditingController regStateController = TextEditingController();

  // Country text field controller for register screen
  final TextEditingController regCountryController = TextEditingController();

  // Pin Code text field controller for register screen
  final TextEditingController regPincodeController = TextEditingController();

  // Serving text fields controller for register screen
  final TextEditingController regServingController = TextEditingController();

  // List of serving text editing controllers
  // final RxList<TextEditingController> servings = <TextEditingController>[].obs;

  // Open time fields controller for register screen
  final TextEditingController regOpenTimeController = TextEditingController();

  // Close time fields controller for register screen
  final TextEditingController regCloseTimeController = TextEditingController();

  // Delivery fee fields controller for register screen
  final TextEditingController deliveryfeeController = TextEditingController();

  // Minimum order fields controller for register screen
  final TextEditingController minimumorderController = TextEditingController();

  // Delivery estimated time fields controller for register screen
  final TextEditingController deliveryEstimatedtimeController =
      TextEditingController();

  // Pick up estimated time fields controller for register screen
  final TextEditingController pickupEstimatedtimeController =
      TextEditingController();

  // otp fields controller for register screen
  final TextEditingController otpController = TextEditingController();

  // Email verify otp fields controller for register screen
  final TextEditingController emailverifyotpController =
      TextEditingController();

  //reset password text field controller for register screen
  final TextEditingController resetPasswordController = TextEditingController();

  //reset confirm password controller text field controller for register screen
  final TextEditingController resetConfirmPasswordController =
      TextEditingController();

  // Login form key
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Register form key
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  // Forgot password form key
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  // Otp form key
  final GlobalKey<FormState> otpFieldFormKey = GlobalKey<FormState>();

  //Reset Password FormKey
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  //Email verify FormKey
  final GlobalKey<FormState> emailverifyFormKey = GlobalKey<FormState>();

  // List of terms condition options
  List<String> termsconditionoptions = <String>[
    "Terms of Service",
    "Privacy Policy",
    "Content Policy"
  ];

  // restuarant open days
  List weekDays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];

  // Registration food type
  List foodType = ["Veg", "Non Veg", "Both"];

  // Registration selected food type
  Rx<String> selectedFood = "Veg".obs;

  // Restuarant selected open days
  RxList<String> selectedDays = <String>[].obs;

  // Login password obsecurity
  RxBool loginPasswordObsecured = true.obs;

  
  // Register password obsecurity
  RxBool registerPasswordObsecured = true.obs;

  
  // Register confirm  password obsecurity
  RxBool registerConfirmPasswordObsecured = true.obs;

  // Boolean parameter for login
  RxBool loadingLogin = false.obs;

  // Register button loading
  RxBool registerLoading = false.obs;

  // Boolean parameter for forgot password
  RxBool loadingforgotPassword = false.obs;

  // Reset password obsecurity
  RxBool resetPasswordObsecured = true.obs;

  // Reset confirm password obsecurity
  RxBool resetConfirmPasswordObsecured = true.obs;

  // Boolean parameter otp verify
  RxBool otpFieldProcessing = false.obs;

  // Boolean parameter reset password
  RxBool resetPasswordProcessing = false.obs;

  // Boolean parameter for delivery switch
  RxBool deliverySwitch = false.obs;

  // Pick up switch value
  RxBool pickUpSwitch = false.obs;

  // Otp send to mail for forgot password
  RxInt sentOtp = 0.obs;

  // User id comming from response
  RxString sentUserId = "".obs;

  // Variable to save the otp verfication daa
  RxString otpVerificationData = "".obs;

  // Loader for email verification
  RxBool emailVerification = false.obs;

  // List of serving model
  RxList<ServingFields> servings = <ServingFields>[].obs;

  // Add serving text into list
  get addServings async {
    servings.add(ServingFields(
        servingController: TextEditingController(),
        flyingFromFocus: FocusNode()));
    servings.refresh();
  }

  // REMOVING TEXT FORM FIELD MODEL INTO THE ARRAY
  removeServings(index) async {
    // FLIGHT TEXT CONTROLLERS ADD
    servings.removeAt(index);

    // REFRESHING TEXT EDITING CONTROLLERS
    servings.refresh();
  }

  // Restaurant login
  login({email, password}) async {
    // Starting loader for login
    loadingLogin.value = true;

    // Creating restaurat
    final restaurant = Restaurant(email: email, password: password);

    // Logging using restaurant model login function
    final loginResponse = await restaurant.login();

    // Checkihg if error is null or not comming from resposne
    if (loginResponse["error"] != null) {
      // Showing error maessage
      FlashManager().show(loginResponse["error"]);
    }

    // Chrcking if data from resposne comming successfully or not
    else if (loginResponse["success"] != null) {
      // When data comming from resposnse successfully
      // we will store restaurat id and token comming from resposne inside cokkie manager
      await CookieManager("id", value: loginResponse["success"].id).save();
      await CookieManager("token", value: loginResponse["token"]).save();

      // Showing flash message after successfully login
      FlashManager().show("Login Successful");

      // Navigating to screen
      Get.to(() => const RegisterScreen());
    }

    loadingLogin.value = false;
  }

  // forgot password
  forgotPassword({email}) async {
    // Starting loader for forgot password
    loadingforgotPassword.value = true;

    // Creating restaurat
    final restaurant = Restaurant(email: email);

    final forgotpasswordResponse = await restaurant.forgotpassword();
    // Checkihg if error is null or not comming from resposne
    if (forgotpasswordResponse["error"] != null) {
      // Showing error maessage
      FlashManager().show(forgotpasswordResponse["error"]);
    }
    // Checking if data from resposne comming successfully or not
    else if (forgotpasswordResponse["success"] != null) {
      // Showing error maessage
      FlashManager().show("OTP sent successfully to Email");
      // When data comming from resposnse successfully
      // we will store forgot password id and otp comming from resposne inside variable
      sentOtp.value = forgotpasswordResponse["success"]["otp"];
      sentUserId.value = forgotpasswordResponse["success"]["id"];
      // navigate get to
      Get.to(() => const VerifyOtpScreen());
    }
    // Stop loader for forgot password
    loadingforgotPassword.value = false;
  }

// Otp verify
  verifyOtp({id, otp, enteredOtp}) async {
    // Starting loader for otp verify
    otpFieldProcessing.value = true;

    final restaurant = Restaurant();

    final otpverifyresponse =
        await restaurant.verifyOtp(otp: otp, enteredOtp: enteredOtp);
    // Checkihg if error is null or not comming from resposne
    if (otpverifyresponse["error"] != null) {
      FlashManager().show(otpverifyresponse["error"]);
    }
    // Checking if otp resposne comming successfully or not
    if (otpverifyresponse["success"] != null) {
      FlashManager().show("OTP verified successfully");
      Get.to(() => const ResetPasswordScreen());
    }
// Stop loader for otp varify
    otpFieldProcessing.value = false;
  }

// Reset password
  resetPassword({id, password}) async {
    // Start loader for reset password
    resetPasswordProcessing.value = true;

    // Creating restaurat
    final restaurant = Restaurant();

    final response = await restaurant.resetPassword(password: password, id: id);
    // If response error
    if (response["error"] != null) {
      FlashManager().show(response["error"]);
    }
    // If res
    if (response["success"] != null) {
      FlashManager().show("Password updated successfully");

      // Navigate to loginscreen
      Get.off(() => const LoginScreen());
    }
    // Stop loader for reset password
    resetPasswordProcessing.value = false;
  }

  // Create restaurant function
  Future<void> create() async {
    // Restaurant registering process start
    registerLoading.value = true;

    // Create restaurant class instance
    final Restaurant restaurant = Restaurant(
        name: regNameController.text.trim(),
        description: regDescriptionController.text.trim(),
        email: regEmailController.text.trim(),
        password: regPasswordController.text.trim(),
        phone: regPhoneController.text.trim(),
        website: regWebsiteController.text.trim(),
        address: Address(
            fullAddress: regFullAddressController.text.trim(),
            city: regCityController.text.trim(),
            country: regCountryController.text.trim(),
            pincode: regPincodeController.text.trim(),
            state: regStateController.text.trim()),
        servings: servings
            .map((element) => element.servingController.text.trim())
            .toList(),
        delivery: Delivery(
            available: deliverySwitch.value,
            estimatedTime: deliveryEstimatedtimeController.text.trim(),
            fee: double.parse(deliveryfeeController.text.trim()),
            minOrder: double.parse(minimumorderController.text.trim()).toInt()),
        openingDays: selectedDays,
        pickup: Pickup(
            available: pickUpSwitch.value,
            estimatedTime: pickupEstimatedtimeController.text.trim()),
        timing: Timing(
            closingTime: regCloseTimeController.text.trim(),
            openingTime: regOpenTimeController.text.trim()),
        type: selectedFood.value);

    // Create restaurat function from the class
    final response = await restaurant.create();

    // Check for error in the response
    if (response["error"] != null) {
      FlashManager().show(response["error"]);
    }

    // Check for success in the response
    if (response["success"] != null) {
      // Save the otp verificiation encrypted string
      otpVerificationData.value = response["otp"];

      log(otpVerificationData.value.toString());

      // OTP sent to email - show this message
      FlashManager().show("OTP sent to registered email");

      // Navigate to the OTP verification screen
      Get.to(() => const EmailVerifyScreen());
    }

    // Restaurant created successfully
    registerLoading.value = false;
  }

  // Verify email
  verifyEmail({ otp, encryptedData}) async {
    // Starting loader for email verify
    emailVerification.value = true;

    final restaurant = Restaurant();

    final emailverifyresponse = await restaurant.verifyEmail(
        otp: otp,
        encryptedOtp: encryptedData);

    // Checkihg if error is null or not comming from resposne
    if (emailverifyresponse["error"] != null) {
      FlashManager().show(emailverifyresponse["error"]);
    }
    // Checking if otp resposne comming successfully or not
    if (emailverifyresponse["success"] != null) {
      FlashManager().show("Email verified successfully");
      Get.to(() => const LoginScreen());
    }
    // Stop loader for email varify
    emailVerification.value = false;
  }
}

// Servings field model
class ServingFields {
  TextEditingController servingController;
  FocusNode flyingFromFocus;

  ServingFields(
      {required this.servingController, required this.flyingFromFocus});
}
