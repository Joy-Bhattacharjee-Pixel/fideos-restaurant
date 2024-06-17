import 'dart:developer';
import 'package:fideos_restaurant/models/restaurant.dart';
import 'package:fideos_restaurant/presentations/auth/register_screen.dart';
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

  // Login form key
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Register form key
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  // forgot password form key
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

// login password obsecurity
  RxBool loginpasswordObsecured = true.obs;

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

  // restuarant selected open days
  RxList selectedDays = [].obs;

  // login password obsecurity
  RxBool loginPasswordObsecured = true.obs;

  // Boolean parameter for login
  RxBool loadingLogin = false.obs;

  // Boolean parameter for forgot password
  RxBool loadingforgotPassword = false.obs;

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
      Get.to(() => Container());
    }
    // Stop loader for forgot password
    loadingforgotPassword.value = false;
  }
}

// Servings field model
class ServingFields {
  TextEditingController servingController;
  FocusNode flyingFromFocus;

  ServingFields(
      {required this.servingController, required this.flyingFromFocus});
}
