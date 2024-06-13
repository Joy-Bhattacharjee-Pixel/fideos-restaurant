import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController  {
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

  // Open time fields controller for register screen
  final TextEditingController regOpenTimeController = TextEditingController();

  // Close time fields controller for register screen
  final TextEditingController regCloseTimeController = TextEditingController();

  // Login form key
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Register form key
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  // Register form key
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

// login password obsecurity
  RxBool loginpasswordObsecured = true.obs;

  // List of terms condition options
  List<String> termsconditionoptions = <String>[
    "Terms of Service",
    "Privacy Policy",
    "Content Policy"
  ];
}

  // Registration food type
  List foodType = ["Veg", "Non Veg", "Both"];

  // restuarant open days
  List weekDays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Satureday"
  ];

  RxInt servingIndex  = 0.obs;
  
  // Registration selected food type
  Rx<String> selectedFood = "Veg".obs;

  // restuarant selected open days
  RxList selectedDays = [].obs;
