import 'dart:developer';
import 'package:fideos_restaurant/models/restaurant.dart';
import 'package:fideos_restaurant/presentations/auth/login_screen.dart';
import 'package:fideos_restaurant/presentations/auth/register_screen.dart';
import 'package:fideos_restaurant/presentations/auth/reset_password.dart';
import 'package:fideos_restaurant/presentations/auth/verify_otp.dart';
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

  // Email text field controller for register screen
  final TextEditingController regEmailController = TextEditingController();

  // Phone text field controller for register screen
  final TextEditingController regPhoneController = TextEditingController();

  // Password text field controller for register screen
  final TextEditingController regPasswordController = TextEditingController();

  // Confirm password text field controller for register screen
  final TextEditingController regConfirmPasswordController =
      TextEditingController();

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
  final TextEditingController deliveryEstimatedtimeController = TextEditingController();

  
  // Pick up estimated time fields controller for register screen
  final TextEditingController pickupEstimatedtimeController = TextEditingController();

  // otp fields controller for register screen
  final TextEditingController otpController = TextEditingController();

    // Email verify otp fields controller for register screen
  final TextEditingController emailverifyotpController = TextEditingController();

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

// Login password obsecurity
  RxBool loginpasswordObsecured = true.obs;

// Reset password obsecurity
  RxBool resetPasswordObsecured = true.obs;

  // Reset confirm password obsecurity
  RxBool resetConfirmPasswordObsecured = true.obs;

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

  RxInt servingIndex = 0.obs;

  // Registration selected food type
  Rx<String> selectedFood = "Veg".obs;

  // Restuarant selected open days
  RxList selectedDays = [].obs;

  // Login password obsecurity
  RxBool loginPasswordObsecured = true.obs;

  // Boolean parameter for login
  RxBool loadingLogin = false.obs;

  // Boolean parameter for forgot password
  RxBool loadingforgotPassword = false.obs;

  // Boolean parameter otp verify
  RxBool otpFieldProcessing = false.obs;

  // Boolean parameter reset password
  RxBool resetPasswordProcessing = false.obs;

// Boolean parameter for switch
  RxBool switchValue = false.obs;
// Boolean parameter for delivery switch
  RxBool deliverySwitch = false.obs;

  // Pick up switch value
  RxBool pickUpSwitch =  false.obs;

  RxInt sentOtp = 0.obs;
  RxString sentUserId = "".obs;

  // List of serving model 
  RxList<ServingFields> servings = <ServingFields>[].obs;

  // Add serving text into list
  get addServings async{
    servings.add(ServingFields(servingController: TextEditingController(), flyingFromFocus: FocusNode()));
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
      log(loginResponse["success"].id.toString());
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
      log("error");
    }
    // Checking if otp resposne comming successfully or not
    if (otpverifyresponse["success"] != null) {
      FlashManager().show("OTP verified successfully");
      log("successfully");
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
}

// Servings field model
class ServingFields {
  TextEditingController servingController;
  FocusNode flyingFromFocus;

  ServingFields(
      {required this.servingController, required this.flyingFromFocus});
}
